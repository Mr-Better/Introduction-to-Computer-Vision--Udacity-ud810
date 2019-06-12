% Test code:
dolphin = imread('dolphin.png');
bicycle = imread('bicycle.png');

result = blend(dolphin, bicycle, 0.1);
imshow(result); % note: will result in an error if blend() returns empty or incorrect value
