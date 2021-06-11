	%reg_mean_file = spm_select('FPList',[work_dir],[strcat('*.nii$')]); %ѡ��ǰĿ¼���ļ�
	rmean_map_hdr = spm_vol('Tian_Subcortex_S1_3T_1mm.nii');
	rmean_map = spm_read_vols(rmean_map_hdr);
	%�õ�ͼ�����rmean_map
	HIP_rh = rmean_map==1; %��ͼ�������еĴ���
	mask_hdr1 = rmean_map_hdr;
	mask_hdr1.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','HIP-rh.nii'); %������ļ�����
	mask_hdr1.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr1, HIP_rh); %����Ϊnii��ʽ
    
    AMY_rh = rmean_map==2; %��ͼ�������еĴ���
	mask_hdr2 = rmean_map_hdr;
	mask_hdr2.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','AMY-rh.nii'); %������ļ�����
	mask_hdr2.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr2, AMY_rh); %����Ϊnii��ʽ
    
    pTHA_rh = rmean_map==3; %��ͼ�������еĴ���
	mask_hdr3 = rmean_map_hdr;
	mask_hdr3.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','pTHA-rh.nii'); %������ļ�����
	mask_hdr3.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr3, pTHA_rh); %����Ϊnii��ʽ
    
    aTHA_rh = rmean_map==4; %��ͼ�������еĴ���
	mask_hdr4 = rmean_map_hdr;
	mask_hdr4.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','aTHA-rh.nii'); %������ļ�����
	mask_hdr4.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr4, aTHA_rh); %����Ϊnii��ʽ
    
    NAc_rh = rmean_map==5; %��ͼ�������еĴ���
	mask_hdr5 = rmean_map_hdr;
	mask_hdr5.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','NAc-rh.nii'); %������ļ�����
	mask_hdr5.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr5, NAc_rh); %����Ϊnii��ʽ
    
    GP_rh = rmean_map==6; %��ͼ�������еĴ���
	mask_hdr6 = rmean_map_hdr;
	mask_hdr6.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','GP-rh.nii'); %������ļ�����
	mask_hdr6.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr6, GP_rh); %����Ϊnii��ʽ
    
    PUT_rh = rmean_map==7; %��ͼ�������еĴ���
	mask_hdr7 = rmean_map_hdr;
	mask_hdr7.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','PUT-rh.nii'); %������ļ�����
	mask_hdr7.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr7, PUT_rh); %����Ϊnii��ʽ
    
    CAU_rh = rmean_map==8; %��ͼ�������еĴ���
	mask_hdr8 = rmean_map_hdr;
	mask_hdr8.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','CAU-rh.nii'); %������ļ�����
	mask_hdr8.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr8, CAU_rh); %����Ϊnii��ʽ
    
    HIP_lh = rmean_map==9; %��ͼ�������еĴ���
	mask_hdr9 = rmean_map_hdr;
	mask_hdr9.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','HIP-lh.nii'); %������ļ�����
	mask_hdr9.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr9, HIP_lh); %����Ϊnii��ʽ
    
    AMY_lh = rmean_map==10; %��ͼ�������еĴ���
	mask_hdr10 = rmean_map_hdr;
	mask_hdr10.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','AMY-lh.nii'); %������ļ�����
	mask_hdr10.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr10, AMY_lh); %����Ϊnii��ʽ
    
    pTHA_lh = rmean_map==11; %��ͼ�������еĴ���
	mask_hdr11 = rmean_map_hdr;
	mask_hdr11.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','pTHA-lh.nii'); %������ļ�����
	mask_hdr11.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr11, pTHA_lh); %����Ϊnii��ʽ
    
    aTHA_lh = rmean_map==12; %��ͼ�������еĴ���
	mask_hdr12 = rmean_map_hdr;
	mask_hdr12.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','aTHA-lh.nii'); %������ļ�����
	mask_hdr12.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr12, aTHA_lh); %����Ϊnii��ʽ
    
    NAc_lh = rmean_map==13; %��ͼ�������еĴ���
	mask_hdr13 = rmean_map_hdr;
	mask_hdr13.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','NAc-lh.nii'); %������ļ�����
	mask_hdr13.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr13, NAc_lh); %����Ϊnii��ʽ
    
    GP_lh = rmean_map==14; %��ͼ�������еĴ���
	mask_hdr14 = rmean_map_hdr;
	mask_hdr14.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','GP-lh.nii'); %������ļ�����
	mask_hdr14.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr14, GP_lh); %����Ϊnii��ʽ
    
    PUT_lh = rmean_map==15; %��ͼ�������еĴ���
	mask_hdr15 = rmean_map_hdr;
	mask_hdr15.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','PUT-lh.nii'); %������ļ�����
	mask_hdr15.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr15, PUT_lh); %����Ϊnii��ʽ
    
    CAU_lh = rmean_map==16; %��ͼ�������еĴ���
	mask_hdr16 = rmean_map_hdr;
	mask_hdr16.fname = fullfile('D:\casia\subcortex-Tian\subcortex\Group-Parcellation\3T\Subcortex-Only\Tian_Subcortex_S1_3T_1mm','CAU-lh.nii'); %������ļ�����
	mask_hdr16.dt = [16 0]; % datatype: float32   %% spm datatype
	spm_write_vol(mask_hdr16, CAU_lh); %����Ϊnii��ʽ