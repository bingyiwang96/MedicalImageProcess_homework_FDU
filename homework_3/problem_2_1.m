ref_vol = spm_vol('T1W.nii');
ref_vol.mat
ref_vol_data = spm_read_vols(ref_vol);
figure, imshow3D(ref_vol_data);

to_reslice_file = 'cropped_T1W.nii';
to_reslice_vol = spm_vol(to_reslice_file);
to_reslice_vol.mat
to_reslice_vol_data = spm_read_vols(to_reslice_vol);
figure, imshow3D(to_reslice_vol_data);

prefix = 'resliced_';
resflags = struct(...
    'mask',0,... % will not mask anything
    'mean',0,... % will not write mean image
    'which',1,... % write only the coregistered file
    'interp',1,... 
    'prefix', prefix);
spm_reslice([ref_vol; to_reslice_vol], resflags); 

reslice_vol = spm_vol(['resliced_',to_reslice_file]);
reslice_vol.mat
reslice_vol_data = spm_read_vols(reslice_vol);
figure, imshow3D(reslice_vol_data);

