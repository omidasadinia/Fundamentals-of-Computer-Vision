clear all;
close all;
t = 0.2;
% a = im2double(imread('backslash.bmp'));
a = im2double(imread('cameraman.jpg'));
% a = im2double(imread('Edge0.bmp'));
G = [1 2 1; 2 4 2; 1 2 1] ./ 16.;
% b = imfilter(a, G);
h = fspecial('gaussian',9,9);
b = imfilter(a,h);
sobelX = [-1. -2. -1.; 0. 0. 0.; 1. 2. 1.];
sobelY = [-1. 0. 1.; -2. 0. 2.; -1. 0. 1.];
bX = imfilter(b, sobelX);
bY = imfilter(b, sobelY);
M = sqrt(bX .^ 2 + bY .^ 2);
alpha = atan2(bY, bX);
alphaDeg = alpha / pi * 180;
alphaDeg = alphaDeg + (alphaDeg < 0) .* 360;

beta = floor((alphaDeg + 22.5) / 45.);

M2 = zeros(size(M));
for x = 2:size(M, 1)-1
    for y= 2:size(M, 2)-1
        if((beta(x, y) == 2 | beta(x, y) == 6) &...
                M(x, y) > M(x, y + 1) &...
                M(x, y) > M(x, y - 1)...
                )
            M2(x, y) = M(x, y);
        end
        if((beta(x, y) == 0 | beta(x, y) == 4) &...
                M(x, y) > M(x + 1, y) &...
                M(x, y) > M(x - 1, y)...
                )
            M2(x, y) = M(x, y);
        end
        if((beta(x, y) == 3 | beta(x, y) == 7) &...
                M(x, y) > M(x + 1, y - 1) &...
                M(x, y) > M(x - 1, y + 1)...
                )
            M2(x, y) = M(x, y);
        end
        if((beta(x, y) == 1 | beta(x, y) == 5) &...
                M(x, y) > M(x + 1, y + 1) &...
                M(x, y) > M(x - 1, y - 1)...
                )
            M2(x, y) = M(x, y);
        end
    end
end
% if (beta == 0) || (beta == 4)
%     orientation = 'vertical';
% elseif beta == 1 || beta == 5
%     orientation = 'backslash';
% elseif beta == 2 || beta == 6
%     orientation = 'horizontal';
% elseif beta == 3 || beta == 7
%     orientation = 'slash';
% end

maxM = max(max(M)');
MImage = M / maxM;

maxM2 = max(max(M2)');
M2Image = M2 / maxM2;

edge = (M >= t * maxM);

figure(1);
subplot(2, 3, 1), imshow(a);
subplot(2, 3, 2), imshow(MImage);
subplot(2, 3, 5), imshow(M2);
subplot(2, 3, 3), imshow(edge);
