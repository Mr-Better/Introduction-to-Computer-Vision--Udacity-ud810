im = imread('../images/bicycle.png');
figure, imshow(im);

% �񻯣�ͻ���߽�
%    [ 0     0     0         [ 0     0     0              [ 1     1     1
%      0     1     0     +     0     1     0     - 1/9 *    1     1     1
%      0     0     0 ]         0     0     0                1     1     1]
%   ��Ե��Ϊ���֣��ڱ�Ե����Χ�ǰ����أ��ױ�Ե����Χ�Ǻ����ء�
%   ���ںڱ�Ե��ͨ���˲�������ֵ���ͣ������ڣ�
%   ���ڰױ�Ե��ͨ���˲�������ֵ���ߣ������ס�
filter = zeros(3,3);
filter(2,2) = 2;
sharpen_filter = filter - ones(3,3)*(1/9);
sharpened_im = imfilter(im, sharpen_filter);
disp(sharpen_filter);
figure, imshow(sharpened_im);
figure, imshow(sharpened_im - im);