
% matlab�ֽű��ļ��ͺ����ļ�����ֻд�ű�����ֻд�������֣�
% �����ֲ��ܻ��ã���Ҫ��ȫ�ǽű���䣬Ҫ��ȫ�Ǻ�����д�������ʱ��Ҫ����main����
% main�����������⣬����������ļ�������
function main()
    hsize = 30;
    for sigma=1:3:9
        disp(sigma);
        single_test(hsize, sigma);
        pause;
    end
    
end

function single_test(hsize, sigma)
    % �������������ݣ�hsize, sigma)
    % (10, 5) (30, 5) (30, 1) �����м�һ��Ľ����ƽ��
    % �Ƚϵı�׼�ǽ����Ͻǵ��˻�С�׵���Ϊ��������
    % hsize: the size of filter h 
    
    % �����ֵ�Ǿ���normalize�������ֵ��0.0������СֵҲ���Ǹ���
    h = fspecial('gaussian', hsize, sigma); 
    %surf(h);
    figure; imagesc(h);

    im = imread('dolphin.png');
%     figure; imshow(im); 

    outim = imfilter(im, h);
    figure; imshow(outim);
end


