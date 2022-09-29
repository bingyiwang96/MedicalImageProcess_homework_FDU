% 读取dicom文件
head_image = dicomread('T2W_Head.dcm');
% figure; subplot(2,3,1); imshow(head_image); title('原始图像');

% 将图像归一化到[0,1]
head_image_normal = rescale(head_image);
figure; subplot(2,3,1); imshow(head_image_normal); title('原始图像');

% 添加图像噪声
head_image_normal_noize = head_image_normal + 0.1*rand(size(head_image_normal));
subplot(2,3,2); imshow(head_image_normal_noize); title('原始带噪声图像');

% 使用fft2和fftshift得到傅里叶变换
head_image_fft= fft2(head_image_normal_noize);
% figure, imshow(rescale(real(head_image_fft)))
head_image_ffts= fftshift(head_image_fft);
% figure, imshow(rescale(real(head_image_ffts)))

% 对fc(head_image_ffts)做对数变换
head_image_ffts_log = log(1+abs(head_image_ffts));
subplot(2,3,4); imshow(rescale(real(head_image_ffts_log))); title('原始带噪声图像频率域');


% 设计滤波器 生成网格坐标
[M,N] = size(head_image_normal_noize);
u = -N/2:N/2-1;
v = -M/2:M/2-1;
[U,V] = meshgrid(u,v);    % 生成网格
D = hypot(U,V);           % 中心为0的同心圆数组
D0 = 50;                  % 设置截止频率，越大越清晰
H = mat2gray( D <= D0 );  % 理想低通滤波器
subplot(2,3,5); imshow(H);title('理想低通滤波器');

head_image_ffts_f = head_image_ffts.*H;  %进行滤波
subplot(2,3,6); imshow(rescale(log(1+abs(head_image_ffts_f))));title('滤波后的频率域');

head_image_ffts_f_if = ifft2(fftshift(head_image_ffts_f)); %傅里叶反变换
subplot(2,3,3); imshow(head_image_ffts_f_if);title('滤波后的图像');


