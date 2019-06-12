% Blend two images
function output = blend(a, b, alpha)
    output = a * alpha + b * (1-alpha);
end


