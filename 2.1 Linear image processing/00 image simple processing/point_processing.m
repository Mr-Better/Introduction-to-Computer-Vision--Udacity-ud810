im = imread('../images/one_punch_man2.jpg');
% figure, imshow(im);

% invert
figure, imshow(255-im);

% darken
% figure, imshow(im-128);
% figure, imshow(im-mean(im(:)));

% lighten
% figure, imshow(im+128);

% lower contrast, 对比度：最亮的白的值-最暗的黑的值
% figure, imshow(im/2);

% raise contrast
% figure, imshow(im*2);


