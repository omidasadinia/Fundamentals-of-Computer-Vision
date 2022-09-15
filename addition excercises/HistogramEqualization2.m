close all;
clear all;
f = imread('Mars.tif');
% Declare an array to hold histogram data
b = zeros(256, 1);
% Extract histogram
for i = 0:255
    % Count pixels where intensity equals i
    b(i + 1) = sum(f(:) == i);
end
% Compute the probability density function (PDF)
% i.e. the probability that an arbitrary pixel has a given value
p = b / (size(f, 1) * size(f, 2));
% compute the cumulative distribution function (CDF)
pa = zeros(size(p));
pa(1) = p(1);
for i = 2:256
    pa(i) = p(i) + pa(i - 1);
end
% Find the mapping r-->s to equalize the histogram
s = zeros(256, 1);
for r = 0:255
    s(r + 1) = round(pa(r + 1) * 255);
end
% Apply the mapping r-->s to f
g = f;
for x = 1:size(f, 1)
    for y = 1:size(f, 2)
        alpha = f(x, y);
        beta = s(alpha + 1);
        g(x, y) = beta;
    end
end
% Find PDF and CDF of g (for presentation, solely)
bPrime = zeros(256, 1);
for i = 0:255
    bPrime(i + 1) = sum(g(:) == i);
end
pPrime = bPrime / (size(g, 1) * size(g, 2));
paPrime = zeros(size(pPrime));
paPrime(1) = pPrime(1);
for i = 2:256
    paPrime(i) = pPrime (i) + paPrime(i - 1);
end
% Present
figure(2);
subplot(2, 3, 1); imshow(f);
subplot(2, 3, 2); plot(p);
subplot(2, 3, 3); plot(pa);
subplot(2, 3, 4); imshow(g);
subplot(2, 3, 5); plot(pPrime);
subplot(2, 3, 6); plot(paPrime);

