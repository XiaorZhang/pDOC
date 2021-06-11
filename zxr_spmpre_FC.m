%%
clear all;
clc;
tic;

%filelist_str = 'D:\casia\data\NC_01\fMRI\NC_01-NII.txt'
%work_dir = 'D:\casia\data\NC_01\fMRI\001-NII\fMRI';
%EPI_dir = 'D:\casia\data\NC_01\fMRI\001-NII\fMRI\EPI';
%fMRI_directory = 'D:\casia\data\NC_01\fMRI';
%ROI_dir = 'D:\casia\data\NC_01\fMRI\001-NII\fMRI\EPI\brain_ROI';
%%
%mask_file= 'F:\0316\pDOC\EPI\maskEPI_V2mm_float32.nii';

%%
directory='E:\DoC_elife\750\';
filelist='patient_name.txt'; %'error_subject_no.txt'
filelist_str=sprintf('%s%s',directory,filelist);
filelist_str1 = filelist_str;
fid=fopen(filelist_str1,'r');
index=0;
work_dir = 'E:\DoC_elife\750\lianglijiang-1\fMRI\';
EPI_directory = fullfile(work_dir, 'EPI');
f_EPI = spm_select('FPList', EPI_directory,  '^EPI.*\.nii$') ;
f_7BN = spm_select('FPList', EPI_directory,  '^winner_7.*\.nii$') ;
f_mask = spm_select('FPList', EPI_directory,  '^maskEPI_V3mm_float32.*\.nii$') ;
%% Initialise SPM defaults
%--------------------------------------------------------------------------
spm('Defaults','fMRI');
spm_jobman('initcfg'); % useful in SPM8 only

while 1
 
    tline = fgetl(fid);
    if ~ischar(tline), break, end
    index=index+1;
    tline = strtrim(tline);
    [subject_label subject_no] = fileparts(tline);
    %[pathstr, name, ext] = fileparts(tline);
    %C = strsplit('\',tline);
    %subject_no = C{1,3};
    %len_subject_no = length(subject_no);
    %subject_no = subject_no(len_subject_no-4:len_subject_no);
    
    fprintf('Processing %d %s\n',index, subject_no);
    %fMRI_directory = fullfile('E:\data\dicom_sorting\NC_36','fMRI');
    %for i =1:3
        %% Select functional and structural scans
        %--------------------------------------------------------------------------
        
        %work_dir= fullfile(fMRI_directory,num2str(i));
        cd(work_dir);
         %% change Bounding box
        fMRI_file = spm_select('FPList', work_dir,  '.*\.nii$') ;
        for j =1: size(fMRI_file,1)
            rmean_map_hdr = spm_vol(fMRI_file(j,:));
            rmean_map = spm_read_vols(rmean_map_hdr);
            [BB vx] = spm_get_bbox(fMRI_file(j,:));
            mask_hdr = rmean_map_hdr;
            mask_hdr.fname = char(editfilenames(fMRI_file(j,:),'prefix', 'bb_'));
            img_dim = mask_hdr.dim;
        
            AA  = img_dim.* abs(vx) - abs(vx);
            BB = [(-1)*AA/2; AA/2];
            mask_hdr.mat = [...
                vx(1)     0     0    (BB(1,1) - abs(vx(2)))/sign(vx(1));...
                0     vx(2)     0  BB(1,2) - abs(vx(2));...
                0     0     vx(3)   BB(1,3) - abs(vx(3));...
                0     0     0     1];
            spm_write_vol(mask_hdr, rmean_map);
        end
       %% DELETE the first 5 frames
        fprintf('deleting the 5 %s analysis file\n',tline);
        filename_1 = spm_select('FPList', work_dir,  '^bb.*_001\.nii$') ;
        if(size(filename_1, 1)>0)
            f1_hdr = spm_vol(filename_1);
            img_dim = f1_hdr.dim;
            n_slices = img_dim(3);
            [temp, filename_1] = fileparts(filename_1);
            length_filename_1 = length(filename_1);
            prefix = filename_1(1:length_filename_1-4);
            for k=1:5
                temp_file=sprintf('%s_%.3d.*',prefix,k);
                delete(temp_file);
            end
        else
            filename_1 = spm_select('FPList', work_dir,  '^bb.*_006\.nii$') ;
            f1_hdr = spm_vol(filename_1);
            img_dim = f1_hdr.dim;
            n_slices = img_dim(3);
        end
       %% WORKING DIRECTORY (useful for .ps only)
        %--------------------------------------------------------------------------
        clear jobs;
        jobs{1}.util{1}.cdir.directory = cellstr(work_dir);
        
        f = spm_select('FPList', work_dir,  '^bb.*\.nii$') ;
        a = tline;
       %% SLICE TIMING
        %--------------------------------------------------------------------------
        jobs{2}.temporal{1}.st.scans{1} = cellstr(f);
        jobs{2}.temporal{1}.st.nslices = 39;
        jobs{2}.temporal{1}.st.tr = 2;
        jobs{2}.temporal{1}.st.ta = 2-2/39;
        jobs{2}.temporal{1}.st.so =[1:2:39 2:2:38];
        jobs{2}.temporal{1}.st.refslice = 2;
       %% REALIGN
        %--------------------------------------------------------------------------
        jobs{3}.spatial{1}.realign{1}.estwrite.data{1} = editfilenames(f,'prefix','a');
       
        %% NORMALIZE
        jobs{3}.spatial{2}.normalise{1}.estwrite.subj.source  = editfilenames(f(1,:),'prefix','meana');
        jobs{3}.spatial{2}.normalise{1}.estwrite.subj.resample = editfilenames(f,'prefix','ra');
        jobs{3}.spatial{2}.normalise{1}.estwrite.eoptions.template = cellstr(f_EPI);
        jobs{3}.spatial{2}.normalise{1}.estwrite.roptions.vox  = [3 3 3];
        jobs{3}.spatial{2}.normalise{1}.estwrite.roptions.bb  = [-90 -126 -72; 90 90 108];
       
        %% SMOOTHING
        %--------------------------------------------------------------------------
        jobs{3}.spatial{3}.smooth.data = editfilenames(f,'prefix','wra');
        jobs{3}.spatial{3}.smooth.fwhm = [3 3 3];
        
       %% RUN JOBS
        %save('DOC.mat','jobs');
        %spm_jobman('interactive',jobs); % open a GUI containing all the setup
        spm_jobman('run',jobs);
        %% compute the overlay ratio for wmaskEPI_V2mm_float32.nii and rmaskEPI_V2mm_float32.nii
        %wmask_file = char(editfilenames(f_mask,'prefix','w'));
        %rmask_file = char(editfilenames(f_mask,'prefix','r'));
        %[ratio_intersection] = msong_calculate_intersection(wmask_file, rmask_file);
        %fprintf('intersection between mask & brain: %4.3f\n', ratio_intersection);
        
       %% remove whole brain and head motion
        fprintf('removing the head motion and whole brain mean.\n');
        func_name = strcat(work_dir,'\swra*.nii');
        motionfile_name = strcat(work_dir,'\rp_*.txt');
        file = dir(motionfile_name);
        motionfile_name = strcat(work_dir,'\',file.name);
        %mask_file =  char(editfilenames(f_mask,'prefix','w'));
        T = 205;
        [TC_mean] = f_RemoveHeadMotion_Wholemean_2(work_dir,func_name,motionfile_name,f_mask,T);
        %% scrub fMRI timeseries with too large headmotion
        headmotion_txt = motionfile_name;
        headmotion_threshold = 1.5;
        [temporal_mask]=f_calculate_headmotion_FD(headmotion_txt , headmotion_threshold);
        prefix = '^rhmw_';
        fMRI_3D_series = spm_select('FPList', work_dir,  sprintf('%s.*\\.nii$',prefix));
        prefix=f_temporalMask_fMRI3D_series(fMRI_3D_series, temporal_mask);
        %% band pass filter
        %prefix = '^S_';
        fprintf('band pass filtering...\n');
        fMRI_data = spm_select('FPList', work_dir,  sprintf('%s.*\\.nii$',prefix));
        %%,'brain_mask', 0
        low_cutoff = 0.01;
        high_cutoff = 0.08;
        TR = 2;
        prefix = f_ideal_bandpass_filter(fMRI_data,'TR', TR,  'low_cutoff', low_cutoff, 'high_cutoff', high_cutoff,'brain_mask',  f_mask);
        %% series 3D into 4D
    	filter_result_directory = fullfile(work_dir, 'afni');
        if(~exist(filter_result_directory,'dir'))
            mkdir(work_dir, 'afni');
        end
        clear jobs;
        jobs{1}.util{1}.cdir.directory = cellstr(filter_result_directory);
        jobs{2}.util{1}.cat.vols = cellstr(spm_select('FPList', work_dir,  sprintf('%s.*\\.nii$',prefix)));
        jobs{2}.util{1}.cat.name = fullfile(filter_result_directory,strcat('BP_rhmw_', subject_no,'.nii'));
        jobs{2}.util{1}.cat.dtype = 0;  % SAME with original image
        %spm_jobman('interactive',jobs); % open a GUI containing all the setup
        spm_jobman('run',jobs);
        %%  funcional connectivity in individual space
        fprintf('\n Functional connectivity analysis.\n');
        result_directory = fullfile(work_dir, 'result_6BN');
        if(~exist(result_directory,'dir'))
            mkdir(work_dir, 'result_6BN');
        end
    
        %mask_file =  char(editfilenames(f_mask,'prefix','w'));
        mask_hdr = spm_vol(f_mask);

        %filelist_str = 'D:\casia\data\NC_01\fMRI\1-NII.txt';
        fprintf('\n computing %s_fullbrain ...\n', tline);
        ROI_file = [];
        ROI_dir = 'E:\DoC_elife\750\lianglijiang-1\fMRI\EPI\brain_ROI\DMN';
        temp = spm_select('FPList',ROI_dir,[strcat( '^r.*\.nii$')]);
        ROI_file = strvcat(ROI_file,temp);        
        n_ROI_file = size(ROI_file, 1);
        %filter_result_directory = 'D:\casia\data\NC_01\fMRI\1-NII\fMRI\afni';
        result_directory2 = fullfile(result_directory, 'fullbrain');
        if(~exist(result_directory2,'dir'))
            mkdir(result_directory, 'fullbrain');
        end
    
        for j =1:n_ROI_file
            fprintf('\n\t ROI: %s ...\n', ROI_file(j,:));

            fMRI_4D_file = fullfile(filter_result_directory,strcat('BP_rhmw_', subject_no,'.nii'));

            [cor_Z, cor_R, cor_P, TC_ROI,  N_ROI] = f_ROIconnectivity_simple_4D(fMRI_4D_file, ROI_file(j,:),  f_mask);
            [ROI_dir_temp, ROI_name] = fileparts(ROI_file(j,:));
            result_filename = sprintf('%02d_%s_fullbrain_Zmap.nii', j, ROI_name);
            cor_Z_hdr = mask_hdr;
            cor_Z_hdr.fname = fullfile(result_directory2, result_filename);
            cor_Z_hdr.dt = [16 0]; % datatype: float32
            spm_write_vol(cor_Z_hdr, cor_Z);
        end
        fprintf('functional connectivity completed!');
end
fclose(fid);