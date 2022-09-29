% 读取文件，读取体素数据
nii_file = spm_vol('ASL_PWI.nii');
data = spm_read_vols(nii_file);
figure, imshow3D(data);
% 先使用阈值法去除大部分非脑结构
data = global_threshold(data,120);
figure, imshow3D(data);
% 定义二维滤波器
SE = strel('square',3);
% 进行开操作 先腐蚀再膨胀
data = imerode(data,SE);
data = imdilate(data,SE);
figure, imshow3D(data);

% 全局阈值法函数
function [img] = global_threshold(s_img, thre)
    [a,b,c]=size(s_img);
    for i = 1:a
        for j = 1:b
            for k = 1:c
                if s_img(i,j,k)<thre
                    s_img(i,j,k) = 0;
                else 
                    s_img(i,j,k) = 255;
                end
            end
        end
    end
    img = s_img;
end