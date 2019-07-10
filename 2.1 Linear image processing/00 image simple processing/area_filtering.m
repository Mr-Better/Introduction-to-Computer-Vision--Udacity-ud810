im = imread('../images/bicycle.png');
figure, imshow(im);

% 锐化，突出边界
%    [ 0     0     0         [ 0     0     0              [ 1     1     1
%      0     1     0     +     0     1     0     - 1/9 *    1     1     1
%      0     0     0 ]         0     0     0                1     1     1]
%   边缘分为两种：黑边缘，周围是白像素；白边缘，周围是黑像素。
%   对于黑边缘，通过滤波后像素值降低，即更黑；
%   对于白边缘，通过滤波后像素值升高，即更白。
filter = zeros(3,3);
filter(2,2) = 2;
sharpen_filter = filter - ones(3,3)*(1/9);
sharpened_im = imfilter(im, sharpen_filter);
disp(sharpen_filter);
figure, imshow(sharpened_im);
figure, imshow(sharpened_im - im);