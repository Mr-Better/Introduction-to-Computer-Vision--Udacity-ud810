
function main()
%     test1();
%     test2();
%     canny_edge_detection();
    test2_binary_gradient_img_version()
end

function test1()
    img = imread('../images/lena.png'); % zx.jpg
    img = rgb2gray(img);
    % sobel ΢��/�ݶ�����
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
%     figure, imshow(oy, []); �������������Զ��������ݵķ�Χ�Ա�����ʾ��Ӧ����ʹ���������С��һ����
    figure, imagesc(oy);
    colormap gray;
    figure, imagesc(ox);
    colormap gray;
    figure, imagesc(ox_neg);
    colormap gray;
    % ���Ժ�����
    figure, imagesc(ox+oy);
    colormap gray;
end

function test2_binary_gradient_img_version()
    img = imread('../images/lena.png'); % zx.jpg
    img = rgb2gray(img);
    sy = fspecial('sobel');
    % oy�и�ֵ��������
    oy = imfilter(double(img), sy);
    sx_neg = sy';
    sx = -sy';
    ox_neg = imfilter(double(img), sx_neg);
    ox = imfilter(double(img), sx);
    
    % ��ֵ����任�ɻҶ�ͼ��ʵ���Ͼ�������һ�������С��һ����[0,1]
    oy = mat2gray(oy); 
    ox_neg = mat2gray(ox_neg);
    ox = mat2gray(ox);
    
    % ת��Ϊ��ֵͼ
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
    e = edge(img, 'canny'); % Ĭ����sobel���Ӽ���Ե
    figure, imshow(e);
end


