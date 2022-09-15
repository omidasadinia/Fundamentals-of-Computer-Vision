clear all;
close all;
tH = 0.8;
tL = 0.2;
% a = im2double(imread('backslash.bmp'));
% a = im2double(imread('cameraman.jpg'));
a = im2double(imread('headCT.tif'));
% a = im2double(imread('Edge0.bmp'));
G = fspecial('gaussian', 9, 9);
b = imfilter(a, G);
sobelX = [-1. -2. -1.; 0. 0. 0.; 1. 2. 1.];
sobelY = [-1. 0. 1.; -2. 0. 2.; -1. 0. 1.];
bX = imfilter(b, sobelX);
bY = imfilter(b, sobelY);
M = sqrt(bX .^ 2 + bY .^ 2);
alpha = atan2(bY, bX);
alphaDeg = alpha / pi * 180;
alphaDeg = alphaDeg + (alphaDeg < 0) .* 360;

beta = floor((alphaDeg + 22.5) / 45.);

gN = zeros(size(M));
for x = 2:size(M, 1)-1
    for y= 2:size(M, 2)-1
        if((beta(x, y) == 2 | beta(x, y) == 6) &...
                M(x, y) > M(x, y + 1) &...
                M(x, y) > M(x, y - 1)...
                )
            gN(x, y) = M(x, y);
        end
        if((beta(x, y) == 0 | beta(x, y) == 4) &...
                M(x, y) > M(x + 1, y) &...
                M(x, y) > M(x - 1, y)...
                )
            gN(x, y) = M(x, y);
        end
        if((beta(x, y) == 3 | beta(x, y) == 7) &...
                M(x, y) > M(x + 1, y - 1) &...
                M(x, y) > M(x - 1, y + 1)...
                )
            gN(x, y) = M(x, y);
        end
        if((beta(x, y) == 1 | beta(x, y) == 5) &...
                M(x, y) > M(x + 1, y + 1) &...
                M(x, y) > M(x - 1, y - 1)...
                )
            gN(x, y) = M(x, y);
        end
    end
end
% gN = [1.00 0.00 0.00 0.00 0.00;
%       0.00 0.85 0.00 0.00 0.60;
%       0.00 0.60 0.00 0.00 0.00;
%       0.00 0.00 0.55 0.52 0.40;
%       0.00 0.00 0.00 0.00 0.00];

gNsize = (size(gN))';
gNmax = max(max(gN)');
gNHlogical = gN > gNmax * tH;
gNLlogical = gN > gNmax * tL;
gNLlogical = gNLlogical - gNHlogical;
edge = gNHlogical;
[toBeVisitedX, toBeVisitedY] = find(gNHlogical);
toBeVisited = [toBeVisitedX, toBeVisitedY];

while size(toBeVisited, 1) > 0
    pixel = toBeVisited(1, :)';
    toBeVisited(1, :) = [];
    n = Neighborhood8(pixel(1), pixel(2), gNsize(1), gNsize(2));
    for i = 1:size(n, 1)
        if gNLlogical(n(i, 1), n(i, 2))
            edge(n(i, 1), n(i, 2)) = true;
            toBeVisited = [toBeVisited; n(i, :)];
            gNLlogical(n(i, 1), n(i, 2)) = false;
        end
    end
end




% gNH = 


Mmax = max(max(M)');
Mimage = M / Mmax;

gNimage = gN /gNmax;

figure(1);
subplot(2, 3, 1), imshow(a);
subplot(2, 3, 2), imshow(Mimage);
subplot(2, 3, 5), imshow(gNimage);
subplot(2, 3, 3), imshow(edge);
