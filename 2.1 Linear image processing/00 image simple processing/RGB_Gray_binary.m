
% ԭʼRGBͼ��
img = imread('../images/one_punch_man2.jpg');
% gray scaleͼ�񣬻Ҷ�ͼ��Ҳ���Խ���intensity image
gray = rgb2gray(img);
% black and white image����ֵͼ�����ڰ�ͼ
bw = im2bw(img);

figure, imshow(img);
figure, imshow(gray);
figure, imshow(bw);