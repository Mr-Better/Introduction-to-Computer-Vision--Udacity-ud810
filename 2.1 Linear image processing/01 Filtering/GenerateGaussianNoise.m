noise = randn([1 1000]);
[n, x] = hist(noise, linspace(-3, 3, 21));
disp([x;n]);
plot(x,n)

