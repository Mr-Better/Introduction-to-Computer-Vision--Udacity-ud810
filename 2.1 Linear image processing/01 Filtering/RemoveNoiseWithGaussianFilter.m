
% ���������ʹ�ø�˹�˲�����ȷ����ȥ�룬��ͬʱȴҲ��������Ϣ����ʧ

% load img and add noise
img = imread('saturn.png');
figure; imshow(img);

noise_sigma = 25;
noise = randn(size(img)) .* noise_sigma;
noisy_img = uint8(double(img) + noise);
figure; imshow(noisy_img);

% noisy_img = imnoise(img, 'gaussian', mean, var);

% remove noise by applying a gaussian filter
filter_size = 30;
filter_sigma = 1;
filter = fspecial('gaussian', filter_size, filter_sigma);
smoothed = imfilter(noisy_img, filter);
figure; imshow(smoothed);
