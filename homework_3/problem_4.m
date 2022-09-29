% 读取tof影像
tof = spm_vol('tof.nii');
tof_data = spm_read_vols(tof);
% 沿着第三轴进行最大投影，并旋转
tof_data_rotate = imrotate(squeeze(max(tof_data,[],3)),90);
% 使用fibermetric进行血管增强
tof_data_rotate_fib = fibermetric(tof_data_rotate);
% 先归一化再fibermetric
tof_data_rotate_rs_fib = fibermetric(rescale(tof_data_rotate));
% 修改thickness = [1,2,3,4,5]
tof_data_rotate_rs_fib_t1 = fibermetric(rescale(tof_data_rotate), [1,2,3,4,5]);
% 修改thickness = [16,18,20,22,24]
tof_data_rotate_rs_fib_t2 = fibermetric(rescale(tof_data_rotate), [16,18,20,22,24]);
figure;
subplot(2,3,1); imshow(rescale(tof_data_rotate)); title('原始投影图像');
subplot(2,3,2); imshow(rescale(tof_data_rotate_fib)); title('默认参数无归一化的fibermetric');
subplot(2,3,3); imshow(rescale(tof_data_rotate_rs_fib)); title('先归一化再fibermetric');
subplot(2,3,4); imshow(rescale(tof_data_rotate_rs_fib_t1)); title('修改thickness = [1,2,3,4,5]');
subplot(2,3,5); imshow(rescale(tof_data_rotate_rs_fib_t2)); title('修改thickness = [16,18,20,22,24]');







