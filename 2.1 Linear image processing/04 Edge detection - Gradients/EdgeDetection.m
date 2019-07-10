
function main()
%     test1();
%     test2();
%     canny_edge_detection();
    test2_binary_gradient_img_version()
end

function test1()
    img = imread('../images/lena.png'); % zx.jpg
    img = rgb2gray(img);
    % sobel 微分/梯度算子
    sy = fspecial('sobel'); % sy: sobel in y direction，sy的y轴正方向为向上

    % 不加double(img)，滤波后输出的类型是uint8，这样就只能检测到沿着正方向像素值剧烈变大的边(即由暗变亮的边)，
    % 而不能检测到沿着正方向像素值剧烈变小的边。
    % 所以sx_neg和sx检测到了不同的边
    oy = imfilter(img, sy);
    sx_neg = sy'; % sx_neg的x轴正方向为向左
    sx = -sy'; % sx的x轴正方向为向右
    ox_neg = imfilter(img, sx_neg);
    ox = imfilter(img, sx);

    imshow(img);
    figure, imshow(oy); % 检测水平边，向上由暗变亮的边
    figure, imshow(ox); % 检测竖直边，向右由暗变亮的边
    figure, imshow(ox_neg); % 检测竖直边，向右由亮变暗的边
end

function test2()
    img = imread('../images/lena.png'); % zx.jpg
    img = rgb2gray(img);
    sy = fspecial('sobel');
    % oy中负值被保留了
    oy = imfilter(double(img), sy);
    sx_neg = sy';
    sx = -sy';
    ox_neg = imfilter(double(img), sx_neg);
    ox = imfilter(double(img), sx);
    
    
    % figure, imshow(oy); % 没做scale，显示出来的图像没法看
    imshow(img);
%     figure, imshow(oy, []); 用这条语句可以自动调整数据的范围以便于显示，应该是使用了最大最小归一化。
    figure, imagesc(oy);
    colormap gray;
    figure, imagesc(ox);
    colormap gray;
    figure, imagesc(ox_neg);
    colormap gray;
    % 尝试合起来
    figure, imagesc(ox+oy);
    colormap gray;
end

function test2_binary_gradient_img_version()
    img = imread('../images/lena.png'); % zx.jpg
    img = rgb2gray(img);
    sy = fspecial('sobel');
    % oy中负值被保留了
    oy = imfilter(double(img), sy);
    sx_neg = sy';
    sx = -sy';
    ox_neg = imfilter(double(img), sx_neg);
    ox = imfilter(double(img), sx);
    
    % 数值矩阵变换成灰度图，实际上就是做了一个最大最小归一化到[0,1]
    oy = mat2gray(oy); 
    ox_neg = mat2gray(ox_neg);
    ox = mat2gray(ox);
    
    % 转换为二值图
    oy = im2bw(oy);
    ox_neg = im2bw(ox_neg);
    ox = im2bw(ox);
    
    imshow(img);
    figure, imshow(oy);
    figure, imshow(ox_neg);
    figure, imshow(ox);
    
end

function canny_edge_detection()
    img = imread('../images/lena.png');
    img = rgb2gray(img);
    imshow(img);
    e = edge(img, 'canny'); % 默认是sobel算子检测边缘
    figure, imshow(e);
end


