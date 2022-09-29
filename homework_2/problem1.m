
% 读取文件，读取体素数据
nii_file = spm_vol('ASL_PWI.nii');
data = spm_read_vols(nii_file);
% 取出上述第18层图像
data_18 = data(:,:,18);

% 将其数值范围调整到0-255，并将数据格式转为uint8
data_18 = uint8((data_18 - min(data_18(:))) * 255 / (max(data_18(:)) - min(data_18(:))));
% 显示图像
figure, imshow(data_18);

% 显示colorbar 使用jet伪彩色图
colorbar;
colormap(gca, jet);
cmap = colormap(gca);
% 修改color bar

cmap(30:70,:) = zeros(41,3);
cmap(150:180,:) = ones(31,3);

colormap(gca, cmap)