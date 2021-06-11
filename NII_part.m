	%reg_mean_file = spm_select('FPList',[work_dir],[strcat('*.nii$')]); %选择当前目录的文件
	rmean_map_hdr = spm_vol('Tian_Subcortex_S1_3T_1mm.nii');
	rmean_map = spm_read_vols(rmean_map_hdr);
	%得到图像矩阵rmean_map
	HIP_rh = rmean_map==1; %对图像矩阵进行的处理
	mask_hdr1 = rmean_map_hdr;
	mask_hdr1.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','HIP-rh.nii'); %保存的文件名称
	mask_hdr1.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr1, HIP_rh); %保存为nii格式
    
    AMY_rh = rmean_map==2; %对图像矩阵进行的处理
	mask_hdr2 = rmean_map_hdr;
	mask_hdr2.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','AMY-rh.nii'); %保存的文件名称
	mask_hdr2.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr2, AMY_rh); %保存为nii格式
    
    pTHA_rh = rmean_map==3; %对图像矩阵进行的处理
	mask_hdr3 = rmean_map_hdr;
	mask_hdr3.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','pTHA-rh.nii'); %保存的文件名称
	mask_hdr3.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr3, pTHA_rh); %保存为nii格式
    
    aTHA_rh = rmean_map==4; %对图像矩阵进行的处理
	mask_hdr4 = rmean_map_hdr;
	mask_hdr4.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','aTHA-rh.nii'); %保存的文件名称
	mask_hdr4.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr4, aTHA_rh); %保存为nii格式
    
    NAc_rh = rmean_map==5; %对图像矩阵进行的处理
	mask_hdr5 = rmean_map_hdr;
	mask_hdr5.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','NAc-rh.nii'); %保存的文件名称
	mask_hdr5.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr5, NAc_rh); %保存为nii格式
    
    GP_rh = rmean_map==6; %对图像矩阵进行的处理
	mask_hdr6 = rmean_map_hdr;
	mask_hdr6.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','GP-rh.nii'); %保存的文件名称
	mask_hdr6.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr6, GP_rh); %保存为nii格式
    
    PUT_rh = rmean_map==7; %对图像矩阵进行的处理
	mask_hdr7 = rmean_map_hdr;
	mask_hdr7.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','PUT-rh.nii'); %保存的文件名称
	mask_hdr7.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr7, PUT_rh); %保存为nii格式
    
    CAU_rh = rmean_map==8; %对图像矩阵进行的处理
	mask_hdr8 = rmean_map_hdr;
	mask_hdr8.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','CAU-rh.nii'); %保存的文件名称
	mask_hdr8.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr8, CAU_rh); %保存为nii格式
    
    HIP_lh = rmean_map==9; %对图像矩阵进行的处理
	mask_hdr9 = rmean_map_hdr;
	mask_hdr9.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','HIP-lh.nii'); %保存的文件名称
	mask_hdr9.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr9, HIP_lh); %保存为nii格式
    
    AMY_lh = rmean_map==10; %对图像矩阵进行的处理
	mask_hdr10 = rmean_map_hdr;
	mask_hdr10.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','AMY-lh.nii'); %保存的文件名称
	mask_hdr10.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr10, AMY_lh); %保存为nii格式
    
    pTHA_lh = rmean_map==11; %对图像矩阵进行的处理
	mask_hdr11 = rmean_map_hdr;
	mask_hdr11.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','pTHA-lh.nii'); %保存的文件名称
	mask_hdr11.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr11, pTHA_lh); %保存为nii格式
    
    aTHA_lh = rmean_map==12; %对图像矩阵进行的处理
	mask_hdr12 = rmean_map_hdr;
	mask_hdr12.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','aTHA-lh.nii'); %保存的文件名称
	mask_hdr12.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr12, aTHA_lh); %保存为nii格式
    
    NAc_lh = rmean_map==13; %对图像矩阵进行的处理
	mask_hdr13 = rmean_map_hdr;
	mask_hdr13.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','NAc-lh.nii'); %保存的文件名称
	mask_hdr13.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr13, NAc_lh); %保存为nii格式
    
    GP_lh = rmean_map==14; %对图像矩阵进行的处理
	mask_hdr14 = rmean_map_hdr;
	mask_hdr14.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','GP-lh.nii'); %保存的文件名称
	mask_hdr14.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr14, GP_lh); %保存为nii格式
    
    PUT_lh = rmean_map==15; %对图像矩阵进行的处理
	mask_hdr15 = rmean_map_hdr;
	mask_hdr15.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','PUT-lh.nii'); %保存的文件名称
	mask_hdr15.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr15, PUT_lh); %保存为nii格式
    
    CAU_lh = rmean_map==16; %对图像矩阵进行的处理
	mask_hdr16 = rmean_map_hdr;
	mask_hdr16.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','CAU-lh.nii'); %保存的文件名称
	mask_hdr16.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr16, CAU_lh); %保存为nii格式