% 使用img_vol和img分别读取文件头和像素矩阵
img_vol = spm_vol('T1W.nii');
img_data = spm_read_vols(img_vol);

% 裁剪图像
img_data_crop = img_data(50:150, 100:250, 30:120);

% 修改新的文件的文件头
img_vol_crop = img_vol;
img_vol_crop.fname = 'cropped_T1W.nii';
img_vol_crop.dim = size(img_data_crop);

% 计算新的mat矩阵，已知图像没有旋转和缩放，不考虑裁剪，相当于x y z方向移动-49,-99,-29
trans_mat = [1,0,0,-49;
             0,1,0,-99;
             0,0,1,-29;
             0,0,0,1];
img_vol_crop.mat = img_vol.mat * inv(trans_mat);
img_vol_crop.mat

%保存文件
spm_write_vol(img_vol_crop, img_data_crop);

% 反转图像----------------------------------------------------------------------------------
img_data_crop_invert = img_data_crop(:, end:-1:1, :);

% 修改新的文件的文件头
img_vol_crop_invert = img_vol_crop;
img_vol_crop_invert.fname = 'invert_cropped_T1W.nii';
img_vol_crop_invert.dim = size(img_data_crop_invert);

% 计算新的mat矩阵，相当于沿着y轴缩放-1倍，然后向y正方向平移152个单位
% 至于为啥是152不是151，我暂时也没弄明白。但确实这里写152比151好
trans_mat = [1,0,0,0;
             0,-1,0,152;
             0,0,1,0;
             0,0,0,1];
img_vol_crop_invert.mat = img_vol_crop.mat * inv(trans_mat);
img_vol_crop_invert.mat

%保存文件
spm_write_vol(img_vol_crop_invert, img_data_crop_invert);


