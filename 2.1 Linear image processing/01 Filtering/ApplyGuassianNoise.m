img = imread('saturn.png');
% figure();
% title('original');
% imshow(img);

noise = randn(size(img)).*200; % ����255��ߵ��ܶȶ�һ����������̬�ֲ����󲿷�ȡֵΪ-sig��sig֮�䣩
figure();
output = uint8(double(img) + noise); % img + uint8(noise)���������дunit8ֻ���طǸ��������Ǿ�û�м���
imshow(output);
title('guassian noise');