clear all;
close all;
% a = imread('LineScattered.png');
a = imread('2LinesScattered.png');
E = im2bw(a);
[iHeight,iWidth] = size(E);
distMax = round(sqrt(iHeight^2 + iWidth^2)); % Maximum possible distance from origin
theta = -90:1:89; % range of theta values
rho = -distMax:1:distMax; % range of rho values
H = zeros(length(rho),length(theta)); % Allocate accumulator array
% Scan through edge image
for ix=1:iWidth
    for iy=1:iHeight
        if E(iy,ix) ~= 0
            % Fill in accumulator array
            for iTheta = 1:length(theta)
                t = theta(iTheta)*pi/180; % get angle in radians                
                % Calculate distance from origin, given this angle
                % Let's use (1,1) as the "origin"
                r = (ix-1)*cos(t) + (iy-1)*sin(t);
                % Find rho value that is closest to this
                [d, iRho] = min(abs(rho-r));
                if d <= 1
                    H(iRho,iTheta) = H(iRho,iTheta) + 1; % Inc accumulator array
                end
            end
        end
    end
end
w = fspecial('gaussian', 11, 5);
E = fspecial('gaussian', 6, 6);
F = fspecial('gaussian', 3, 3);
B = imfilter(H, w);
B = imfilter(B, E);
B = imfilter(B, F);

local_maximum = zeros(size(B));
for x = 2:size(B,1)-1
    for y = 2:size(B,2)-1
        if (B(x,y) > B(x-1,y-1) &&... 
            B(x,y) > B(x-1,y) &&...
            B(x,y) > B(x-1,y+1) &&...
            B(x,y) > B(x,y-1) &&...
            B(x,y) > B(x,y+1) &&...
            B(x,y) > B(x+1,y-1) &&...
            B(x,y) > B(x+1,y) &&...
            B(x,y) > B(x+1,y+1) )
                
                local_maximum(x,y) = B(x,y);
        end
    end
end
figure(1);
subplot(1, 4, 1), imshow(a, []), impixelinfo;
subplot(1, 4, 2), imshow(H, []), impixelinfo;
subplot(1, 4, 3), imshow(B, []), impixelinfo;
subplot(1, 4, 4), imshow(local_maximum, []), impixelinfo;
