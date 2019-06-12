img = imread('saturn.png');
% figure();
% title('original');
% imshow(img);

noise = randn(size(img)).*200; % 超过255后斑点密度都一样（看做正态分布绝大部分取值为-sig到sig之间）
figure();
output = uint8(double(img) + noise); % img + uint8(noise)，如果这样写unit8只返回非负数，于是就没有减了
imshow(output);
title('guassian noise');