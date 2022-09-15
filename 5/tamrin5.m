close all;
clear all;
fInt = imread("tv.tif");


gInt = fInt;
xInt(:, :, 1) = fInt(:, :, 2);
xInt(:, :, 2) = gInt(:, :, 1);
xInt(:, :, 3) = gInt(:, :, 3);



figure(1);
subplot(1,2,1); imshow(fInt);
subplot(1,2,2); imshow(xInt);
