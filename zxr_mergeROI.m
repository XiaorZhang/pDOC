
% 左前丘脑与左后丘脑合并为左丘脑
rmean_map_hdrla = spm_vol('r03_L.aTHA.nii');
rmean_map_hdrlp = spm_vol('r13_L.pTHA.nii');
rmean_mapla = spm_read_vols(rmean_map_hdrla); %得到NII图像矩阵
rmean_maplp = spm_read_vols(rmean_map_hdrlp);

THA_L = rmean_mapla + rmean_maplp; %对图像矩阵进行的处理
mask_hdr1 = rmean_map_hdrla;
mask_hdr1.fname = fullfile('D:\casia\data\NC_01\fMRI\001-NII\fMRI\EPI\brain_ROI\subcortex','01_L.THA.nii'); %保存的文件名称
mask_hdr1.dt = [16 0]; % datatype: float32   %% spm datatype
spm_write_vol(mask_hdr1, THA_L); %保存为nii格式

%右前丘脑与右后丘脑合并为右丘脑
rmean_map_hdrra = spm_vol('r04_R.aTHA.nii');
rmean_map_hdrrp = spm_vol('r14_R.pTHA.nii');
rmean_mapra = spm_read_vols(rmean_map_hdrra); %得到NII图像矩阵
rmean_maprp = spm_read_vols(rmean_map_hdrrp);

THA_R = rmean_mapra + rmean_maprp; %对图像矩阵进行的处理
mask_hdr2 = rmean_map_hdra;
mask_hdr2.fname = fullfile('D:\casia\data\NC_01\fMRI\001-NII\fMRI\EPI\brain_ROI\subcortex','02_R.THA.nii'); %保存的文件名称
mask_hdr2.dt = [16 0]; % datatype: float32   %% spm datatype
spm_write_vol(mask_hdr2, THA_R); %保存为nii格式

%左海马与右海马合并
rmean_map_hdrlhip = spm_vol('r09_L.HIP.nii');
rmean_map_hdrrhip = spm_vol('r10_R.HIP.nii');
rmean_maplhip = spm_read_vols(rmean_map_hdrlhip); %得到NII图像矩阵
rmean_maprhip = spm_read_vols(rmean_map_hdrrhip);

HIP = rmean_maplhip + rmean_maprhip; %对图像矩阵进行的处理
mask_hdr3 = rmean_map_hdrlhip;
mask_hdr3.fname = fullfile('E:\data\dicom_sorting\NC_01\fMRI\001-NII\fMRI\EPI\brain_ROI\HIP_AMY_THA','r01_HIP.nii'); %保存的文件名称
mask_hdr3.dt = [16 0]; % datatype: float32   %% spm datatype
spm_write_vol(mask_hdr3, HIP); %保存为nii格式

%左杏仁核与右杏仁核合并
rmean_map_hdrlamy = spm_vol('r01_L.AMY.nii');
rmean_map_hdrramy = spm_vol('r02_R.AMY.nii');
rmean_maplamy = spm_read_vols(rmean_map_hdrlamy); %得到NII图像矩阵
rmean_mapramy = spm_read_vols(rmean_map_hdrramy);

AMY = rmean_maplamy + rmean_mapramy; %对图像矩阵进行的处理
mask_hdr4 = rmean_map_hdrlamy;
mask_hdr4.fname = fullfile('E:\data\dicom_sorting\NC_01\fMRI\001-NII\fMRI\EPI\brain_ROI\HIP_AMY_THA','r02_AMY.nii'); %保存的文件名称
mask_hdr4.dt = [16 0]; % datatype: float32   %% spm datatype
spm_write_vol(mask_hdr4, AMY); %保存为nii格式

%左丘脑与右丘脑合并
rmean_map_hdrltha = spm_vol('01_L.THA.nii');
rmean_map_hdrrtha = spm_vol('02_R.THA.nii');
rmean_mapltha = spm_read_vols(rmean_map_hdrltha); %得到NII图像矩阵
rmean_maprtha = spm_read_vols(rmean_map_hdrrtha);

THA = rmean_mapltha + rmean_maprtha; %对图像矩阵进行的处理
mask_hdr5 = rmean_map_hdrltha;
mask_hdr5.fname = fullfile('E:\data\dicom_sorting\NC_01\fMRI\001-NII\fMRI\EPI\brain_ROI\HIP_AMY_THA','r03_THA.nii'); %保存的文件名称
mask_hdr5.dt = [16 0]; % datatype: float32   %% spm datatype
spm_write_vol(mask_hdr5, THA); %保存为nii格式
