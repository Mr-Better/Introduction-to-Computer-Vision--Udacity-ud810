
% 边界的padding，padding有两个方面，一个是padding的方案：full，same，valid；另一个是padding的内容。
% 本代码讨论padding的内容。
img = imread('fall-leaves.png');
imshow(img)
title('original image');

filter_size = 21; % 一般filter size都是奇数
filter_sigma = 3;

% fspecial i.e. special filter
filter = fspecial('gaussian', filter_size, filter_sigma);

% 边界padding 0, 输出有黑边
smoothed = imfilter(img, filter, 0); % 第3个参数如果不写，默认是补0
figure();
imshow(smoothed);
title('zero padding');

% 将图像视作一个周期（circular）信号，左边界的像素padding到右边界，右边界的像素
% padding到左边界，上下边界类似。输出左边有有一点红，右边有一点绿
smoothed = imfilter(img, filter, 'circular');
figure();
imshow(smoothed);
title('circular padding');

% 将边界复制行或列，输出还不错，边界都很明显，不像上面两种方式输出的边界都有一些问题
smoothed = imfilter(img, filter, 'replicate');
figure();
imshow(smoothed);
title('replicate padding');

% 在边界进行镜像对称padding，仿佛原图像周围有四块镜子
% 结果和replicate方式肉眼看不出区别
smoothed = imfilter(img, filter, 'symmetric');
figure();
imshow(smoothed);
title('symmetric padding');
