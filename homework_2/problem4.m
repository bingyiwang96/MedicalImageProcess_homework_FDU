% 读取文件，读取体素数据
nii_file = spm_vol('TOF.nii');
data = spm_read_vols(nii_file);
figure, imshow3D(data);

% 计算mat矩阵每行的模
mat = nii_file.mat;
out = [];
for i = 1:4
    out = [out,norm(mat(:,i))];
end
% 读取DICOM文件
info = dicominfo('Mag (0001).dcm');