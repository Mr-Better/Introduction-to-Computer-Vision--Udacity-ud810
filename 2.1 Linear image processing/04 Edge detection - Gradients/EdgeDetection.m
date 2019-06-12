
function main()
%     test1();
    test2();
end

function test1()
    img = imread('../images/lena.png'); % zx.jpg
    img = rgb2gray(img);
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
    figure, imagesc(oy);
    colormap gray;
    figure, imagesc(ox);
    colormap gray;
    figure, imagesc(ox_neg);
    colormap gray;
    % 尝试合起来
    figure, imagesc(ox+oy);
    colormap gray;
    % TODO: 测试lena.png
end



