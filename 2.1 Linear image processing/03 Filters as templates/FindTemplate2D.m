function main()
    % Test code:
    tablet = imread('../images/tablet.png');
    
    imshow(tablet);
    glyph = tablet(75:165, 150:185);
    figure, imshow(glyph);

    [y x] = find_template_2D(glyph, tablet);
    disp([y x]); % should be the top-left corner of template in tablet
    
end

function [yIndex xIndex] = find_template_2D(template, img)
    c = normxcorr2(template, img);
    [ypeak, xpeak] = find(c==max(c(:)));
    yIndex = ypeak - size(template, 1) + 1;
    xIndex = xpeak - size(template, 2) + 1;
end



