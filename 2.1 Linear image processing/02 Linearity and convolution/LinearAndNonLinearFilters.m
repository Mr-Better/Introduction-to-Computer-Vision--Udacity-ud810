function main()
    median_filtering();
end

function blur_and_shift()
    img = imread('bee_small.jpg');
    imshow(img);
    title('org');

    filter = zeros(3, 3);
    filter(2, 2) = 1;
    figure();
    imshow(filter);
    title('filter');

    % 默认的操作是correlation不是convolution
    % padding默认是补0、same模式
    output = imfilter(img, filter);
    figure;
    imshow(output);
    title('output'); % img==output

    % filter =
    % 
    %      0     0     0
    %      0     0     1
    %      0     0     0
    % 图像向左移（向中心移动）
    % 
    % filter =
    % 
    %      0     0     0
    %      1     0     0
    %      0     0     0
    % 图像向右移

    filter1 = ones(3,3);
    filter1 = 1/9 * filter1;

    output = imfilter(img, filter1);
    figure;
    imshow(output);
end

function sharpen()
    % 使用黑白图像，否则会有意想不到的结果——最后三色通道叠加就会出现奇怪的颜色。
    img = imread('bicycle.png');
    brighten_filter = zeros(3, 3);
    brighten_filter(2, 2) = 2;
    blur_filter = ones(3, 3) * (1/9);
    
    % 为什么用brighten_filter减去blur_filter可以得到一个sharpen_filter?
    % - 对于不是边界的区域：
    %   这样的区域大概率像素值一致或相似，此时这个sharpen_filter可以让过滤后的这一块区域保持原来的像素值，或者相似的像素值；
    %   但对于bicycle.png这幅图像为什么地面普遍变黑？不应该大致不变吗？知道了，因为每次卷积并转化为图像都有一定的数值损失，转化成图像像素值会取整。
    % - 对于边界区域：
    %   过滤后这一区域像素值变化较大。
%     output1 = imfilter(img, brighten_filter);
%     output2 = imfilter(img, blur_filter);
%     figure; imshow(img);
%     figure; imshow(output1);
%     figure; imshow(output2);
%     figure; imshow(output1 - output2);
    
    % 下面这种做法就不会出现上面的问题了，经过这样sharpen的图像，看起来质量比原来更高，细节可以刻画的更清楚。
    % 比如自行车的篮子的细节更加清晰了。
    sharpen_filter = brighten_filter-blur_filter;
    imshow(img);
    figure; imshow(imfilter(img, sharpen_filter));
end

function median_filtering()
    img = imread('moon.png');
    % 椒盐噪声，随机黑白点干扰
    noisy_img = imnoise(img, 'salt & pepper', 0.02); % 最后一个参数是noise density
    
    % gaussian_filter = [1 2 1; 2 4 2; 1 2 1;] * (1/16);
    gaussian_filter = fspecial('gaussian', 3, 1); % filter_size, filter_sigma
    
    figure; 
    subplot(2, 2, 1); imshow(img); title('org');
    subplot(2, 2, 2); imshow(noisy_img); title('salt & pepper noisy img');
    subplot(2, 2, 3); imshow(imfilter(noisy_img, gaussian_filter)); title('noisy img + gaussian filter');
    % medfilt2 = median filtering in two dimension
    subplot(2, 2, 4); imshow(medfilt2(noisy_img)); title('noisy img + median filter');
end



