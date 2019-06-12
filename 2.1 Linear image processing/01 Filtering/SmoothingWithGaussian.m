
% matlab分脚本文件和函数文件，即只写脚本语句和只写函数两种；
% 这两种不能混用，即要不全是脚本语句，要不全是函数，写多个函数时需要定义main函数
% main函数名字任意，但必须放在文件最上面
function main()
    hsize = 30;
    for sigma=1:3:9
        disp(sigma);
        single_test(hsize, sigma);
        pause;
    end
    
end

function single_test(hsize, sigma)
    % 测试了三组数据（hsize, sigma)
    % (10, 5) (30, 5) (30, 1) 发现中间一组的结果最平滑
    % 比较的标准是将左上角的浪花小白点视为“噪声”
    % hsize: the size of filter h 
    
    % 输出的值是经过normalize的吗？最大值才0.0几，最小值也不是负数
    h = fspecial('gaussian', hsize, sigma); 
    %surf(h);
    figure; imagesc(h);

    im = imread('dolphin.png');
%     figure; imshow(im); 

    outim = imfilter(im, h);
    figure; imshow(outim);
end


