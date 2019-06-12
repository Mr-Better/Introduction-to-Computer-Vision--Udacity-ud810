function noise = guassian(size, sigma)
    noise = uint8(randn([size size]) .* sigma);
end



