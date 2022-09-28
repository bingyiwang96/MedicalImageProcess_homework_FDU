% 问题6 沿着三个方向进行最大投影并旋转到合适角度。
tof_vol = spm_vol('TOF_Dicom/sANONYMOUS-0201-00002-000001-01.nii');

% 沿着维度1进行最大投影，并旋转到合适角度
tof1 = imrotate(spm_read_vols(tof_vol), 90);
tof_mip1 = imrotate(squeeze(max(tof,[],1)),90);
figure, imshow3D(tof_mip1);

% 沿着维度2进行最大投影，并旋转到合适角度
tof2 = imrotate(spm_read_vols(tof_vol), 90);
tof_mip2 = imrotate(squeeze(max(tof,[],2)),90);
figure, imshow3D(tof_mip2);

% 沿着维度3进行最大投影，并旋转到合适角度
tof3 = imrotate(spm_read_vols(tof_vol), 90);
tof_mip3 = imrotate(squeeze(max(tof,[],3)),0);
figure, imshow3D(tof_mip3);


% 问题6 沿着三个方向进行最小投影并旋转到合适角度。
tof_vol = spm_vol('TOF_Dicom/sANONYMOUS-0201-00002-000001-01.nii');

% 沿着维度1进行最大投影，并旋转到合适角度
tof1 = imrotate(spm_read_vols(tof_vol), 90);
tof_mip1 = imrotate(squeeze(min(tof,[],1)),90);
figure, imshow3D(tof_mip1);

% 沿着维度2进行最大投影，并旋转到合适角度
tof2 = imrotate(spm_read_vols(tof_vol), 90);
tof_mip2 = imrotate(squeeze(min(tof,[],2)),90);
figure, imshow3D(tof_mip2);

% 沿着维度3进行最大投影，并旋转到合适角度
tof3 = imrotate(spm_read_vols(tof_vol), 90);
tof_mip3 = imrotate(squeeze(min(tof,[],3)),0);
figure, imshow3D(tof_mip3);
