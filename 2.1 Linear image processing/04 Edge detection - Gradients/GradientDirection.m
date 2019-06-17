
img = double(imread('../images/octagon.png')) / 255.;
imshow(img); % assumes [0, 1] range for double images

% Compute x, y gradients
% imgradientxyĬ�Ͼ���ʹ��sobel�˲���
[gx gy] = imgradientxy(img, 'sobel'); % Note: gx, gy are not normalized

% ���ݶȹ�һ��������ʹ��imshow(gx, [-4,4])���ṩ���鷶Χ��imshow����һ��
% ����imshow(gx, [])����ȼ���imagesc(gx)������ʹ�������е�ʵ�����ֵ����Сֵ����һ��
%figure, imshowpair((gx+4)/8, (gy+4)/8, 'montage');
figure, imagesc(gx);

[gmag gdir] = imgradient(gx, gy);
figure, imshow(gmag / (4 * sqrt(2))); % mag = sqrt(gx^2 + gy^2), so [0, (4 * sqrt(2))]
figure, imshow((gdir + 180.0) / 360.0); % angle in degrees [-180, 180]
% �ݶȷ���ͼ�а˱������ҵ���һ���ߵ��ݶȷ���Ϊ0�ȣ���[-180, 180]��Χ���㣩��
% ���������ݶȷ���Ĭ��ҲΪ0�ȣ�gdir����һ����Χ��[-180, 180]�����飩�����������߿�������
% ��ɫ��ͬ�ĵط���˵��ֵ��ͬ��˵���ݶȷ�����ͬ��

% �������ݶȣ�һ�㷽���������С�Ƚ�С
my_grad = select_gdir(gmag, gdir, 1, 30, 60);
figure, imshow(my_grad);

imread('/f');
imshow(