
function main()
%     test1();
    test2();
end

function test1()
    img = imread('../images/lena.png'); % zx.jpg
    img = rgb2gray(img);
    sy = fspecial('sobel'); % sy: sobel in y direction��sy��y��������Ϊ����

    % ����double(img)���˲��������������uint8��������ֻ�ܼ�⵽��������������ֵ���ұ��ı�(���ɰ������ı�)��
    % �����ܼ�⵽��������������ֵ���ұ�С�ıߡ�
    % ����sx_neg��sx��⵽�˲�ͬ�ı�
    oy = imfilter(img, sy);
    sx_neg = sy'; % sx_neg��x��������Ϊ����
    sx = -sy'; % sx��x��������Ϊ����
    ox_neg = imfilter(img, sx_neg);
    ox = imfilter(img, sx);

    imshow(img);
    figure, imshow(oy); % ���ˮƽ�ߣ������ɰ������ı�
    figure, imshow(ox); % �����ֱ�ߣ������ɰ������ı�
    figure, imshow(ox_neg); % �����ֱ�ߣ����������䰵�ı�
end

function test2()
    img = imread('../images/lena.png'); % zx.jpg
    img = rgb2gray(img);
    sy = fspecial('sobel');
    % oy�и�ֵ��������
    oy = imfilter(double(img), sy);
    sx_neg = sy';
    sx = -sy';
    ox_neg = imfilter(double(img), sx_neg);
    ox = imfilter(double(img), sx);
    
    
    % figure, imshow(oy); % û��scale����ʾ������ͼ��û����
    imshow(img);
    figure, imagesc(oy);
    colormap gray;
    figure, imagesc(ox);
    colormap gray;
    figure, imagesc(ox_neg);
    colormap gray;
    % ���Ժ�����
    figure, imagesc(ox+oy);
    colormap gray;
    % TODO: ����lena.png
end



