
img = double(imread('../images/octagon.png')) / 255.;
imshow(img); % assumes [0, 1] range for double images

% Compute x, y gradients
% imgradientxy默认就是使用sobel滤波器
[gx gy] = imgradientxy(img, 'sobel'); % Note: gx, gy are not normalized

% 将梯度归一化，或者使用imshow(gx, [-4,4])，提供数组范围让imshow做归一化
% 或者imshow(gx, [])，这等价于imagesc(gx)，都是使用数组中的实际最大值、最小值做归一化
%figure, imshowpair((gx+4)/8, (gy+4)/8, 'montage');
figure, imagesc(gx);

[gmag gdir] = imgradient(gx, gy);
figure, imshow(gmag / (4 * sqrt(2))); % mag = sqrt(gx^2 + gy^2), so [0, (4 * sqrt(2))]
figure, imshow((gdir + 180.0) / 360.0); % angle in degrees [-180, 180]
% 梯度方向图中八边形最右的那一条边的梯度方向为0度（按[-180, 180]范围来算），
% 而背景的梯度方向默认也为0度（gdir就是一个范围是[-180, 180]的数组），所以那条边看不见。
% 颜色相同的地方，说明值相同，说明梯度方向相同。

% 噪声的梯度，一般方向随机，大小比较小
my_grad = select_gdir(gmag, gdir, 1, 30, 60);
figure, imshow(my_grad);

imread('/f');
imshow(