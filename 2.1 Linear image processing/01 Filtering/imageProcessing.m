im = imread('zx.jpg');
figure();
imshow(im);
axis on;
hold on;
plot(im(180,:,2))
plot(37,180,'r.','markersize',10)
line([1 268],[180 180],'color','r');
% disp(size(img));