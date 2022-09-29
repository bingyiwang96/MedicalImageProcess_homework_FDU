img_vol = spm_vol('T1W.nii');
img = spm_read_vols(img_vol);
img_vol2 = img_vol;
img_vol2.fname = 'new_T1W.nii';
img2 = img;
spm_write_vol(img_vol2, img2);
