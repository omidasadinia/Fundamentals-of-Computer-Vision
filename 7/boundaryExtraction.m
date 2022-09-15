close all;
clear all;
% a = imread('lincoln.tif');
a = im2bw(imread('line.tif'));

b4 = true(3, 3);
c4 = imerode(a, b4);
beta4 = a - c4;

b8 = true(3, 3);
b8(1, 1) = false;
b8(1, 3) = false;
b8(3, 1) = false;
b8(3, 3) = false;
c8 = imerode(a, b8);
beta8 = a - c8;

figure(1);
subplot(1, 3, 1); imshow(a);
subplot(2, 3, 2); imshow(b4);
subplot(2, 3, 3); imshow(beta4);
subplot(2, 3, 5); imshow(b8);
subplot(2, 3, 6); imshow(beta8);
