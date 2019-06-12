
% �߽��padding��padding���������棬һ����padding�ķ�����full��same��valid����һ����padding�����ݡ�
% ����������padding�����ݡ�
img = imread('fall-leaves.png');
imshow(img)
title('original image');

filter_size = 21; % һ��filter size��������
filter_sigma = 3;

% fspecial i.e. special filter
filter = fspecial('gaussian', filter_size, filter_sigma);

% �߽�padding 0, ����кڱ�
smoothed = imfilter(img, filter, 0); % ��3�����������д��Ĭ���ǲ�0
figure();
imshow(smoothed);
title('zero padding');

% ��ͼ������һ�����ڣ�circular���źţ���߽������padding���ұ߽磬�ұ߽������
% padding����߽磬���±߽����ơ�����������һ��죬�ұ���һ����
smoothed = imfilter(img, filter, 'circular');
figure();
imshow(smoothed);
title('circular padding');

% ���߽縴���л��У�����������߽綼�����ԣ������������ַ�ʽ����ı߽綼��һЩ����
smoothed = imfilter(img, filter, 'replicate');
figure();
imshow(smoothed);
title('replicate padding');

% �ڱ߽���о���Գ�padding���·�ԭͼ����Χ���Ŀ龵��
% �����replicate��ʽ���ۿ���������
smoothed = imfilter(img, filter, 'symmetric');
figure();
imshow(smoothed);
title('symmetric padding');
