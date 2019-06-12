onion   = rgb2gray(imread('onion.png'));
peppers = rgb2gray(imread('peppers.png'));
% imshow(onion);
figure, imshowpair(peppers,onion,'montage');
c = normxcorr2(onion,peppers); 
figure, surf(c), shading flat;

% Find peak in cross-correlation.
[ypeak, xpeak] = find(c==max(c(:)));

% Account for the padding that normxcorr2 adds.
% normxcorr2Ĭ�ϵ�padding��ʽ��full? ����Ӧ����-size(onion,1)/2��
yoffSet = ypeak-size(onion,1);
xoffSet = xpeak-size(onion,2);

hFig = figure;
hAx  = axes;
imshow(peppers,'Parent', hAx);
imrect(hAx, [xoffSet+1, yoffSet+1, size(onion,2), size(onion,1)]);
