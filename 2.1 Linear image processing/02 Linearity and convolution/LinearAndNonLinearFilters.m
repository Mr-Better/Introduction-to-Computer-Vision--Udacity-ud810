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

    % Ĭ�ϵĲ�����correlation����convolution
    % paddingĬ���ǲ�0��sameģʽ
    output = imfilter(img, filter);
    figure;
    imshow(output);
    title('output'); % img==output

    % filter =
    % 
    %      0     0     0
    %      0     0     1
    %      0     0     0
    % ͼ�������ƣ��������ƶ���
    % 
    % filter =
    % 
    %      0     0     0
    %      1     0     0
    %      0     0     0
    % ͼ��������

    filter1 = ones(3,3);
    filter1 = 1/9 * filter1;

    output = imfilter(img, filter1);
    figure;
    imshow(output);
end

function sharpen()
    % ʹ�úڰ�ͼ�񣬷���������벻���Ľ�����������ɫͨ�����Ӿͻ������ֵ���ɫ��
    img = imread('bicycle.png');
    brighten_filter = zeros(3, 3);
    brighten_filter(2, 2) = 2;
    blur_filter = ones(3, 3) * (1/9);
    
    % Ϊʲô��brighten_filter��ȥblur_filter���Եõ�һ��sharpen_filter?
    % - ���ڲ��Ǳ߽������
    %   ������������������ֵһ�»����ƣ���ʱ���sharpen_filter�����ù��˺����һ�����򱣳�ԭ��������ֵ���������Ƶ�����ֵ��
    %   ������bicycle.png���ͼ��Ϊʲô�����ձ��ڣ���Ӧ�ô��²�����֪���ˣ���Ϊÿ�ξ����ת��Ϊͼ����һ������ֵ��ʧ��ת����ͼ������ֵ��ȡ����
    % - ���ڱ߽�����
    %   ���˺���һ��������ֵ�仯�ϴ�
%     output1 = imfilter(img, brighten_filter);
%     output2 = imfilter(img, blur_filter);
%     figure; imshow(img);
%     figure; imshow(output1);
%     figure; imshow(output2);
%     figure; imshow(output1 - output2);
    
    % �������������Ͳ����������������ˣ���������sharpen��ͼ�񣬿�����������ԭ�����ߣ�ϸ�ڿ��Կ̻��ĸ������
    % �������г������ӵ�ϸ�ڸ��������ˡ�
    sharpen_filter = brighten_filter-blur_filter;
    imshow(img);
    figure; imshow(imfilter(img, sharpen_filter));
end

function median_filtering()
    img = imread('moon.png');
    % ��������������ڰ׵����
    noisy_img = imnoise(img, 'salt & pepper', 0.02); % ���һ��������noise density
    
    % gaussian_filter = [1 2 1; 2 4 2; 1 2 1;] * (1/16);
    gaussian_filter = fspecial('gaussian', 3, 1); % filter_size, filter_sigma
    
    figure; 
    subplot(2, 2, 1); imshow(img); title('org');
    subplot(2, 2, 2); imshow(noisy_img); title('salt & pepper noisy img');
    subplot(2, 2, 3); imshow(imfilter(noisy_img, gaussian_filter)); title('noisy img + gaussian filter');
    % medfilt2 = median filtering in two dimension
    subplot(2, 2, 4); imshow(medfilt2(noisy_img)); title('noisy img + median filter');
end



