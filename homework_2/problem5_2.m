ref_vol = spm_vol('ASL_PWI.nii');
ref_vol_data = spm_read_vols(ref_vol);
figure, imshow3D(ref_vol_data);

to_reslice_vol = spm_vol('T1W.nii');
to_reslice_vol_data = spm_read_vols(to_reslice_vol);
figure, imshow3D(to_reslice_vol_data);

ref_vol.dim
to_reslice_vol.dim

prefix = 'resliced_';
resflags = struct(...
    'mask',0,... % will not mask anything
    'mean',0,... % will not write mean image
    'which',1,... % write only the coregistered file
    'interp',1,... 
    'prefix', prefix);
spm_reslice([to_reslice_vol; ref_vol], resflags); 

resliced_T1W = spm_vol('resliced_ASL_PWI.nii');
resliced_T1W_data = spm_read_vols(resliced_T1W);
figure, imshow3D(resliced_T1W_data);

resliced_T1W.dim