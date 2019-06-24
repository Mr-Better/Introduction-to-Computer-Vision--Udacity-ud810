
% 原始RGB图像
img = imread('../images/one_punch_man2.jpg');
% gray scale图像，灰度图，也可以叫做intensity image
gray = rgb2gray(img);
% black and white image，二值图，即黑白图
bw = im2bw(img);

figure, imshow(img);
figure, imshow(gray);
figure, imshow(bw);