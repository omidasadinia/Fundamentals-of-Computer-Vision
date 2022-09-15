clear all;
close all;
t = 0.2;
% a = imread('house2.tif');
a = im2double(imread('cameraman.jpg'));

sobelX = [-1. -2. -1.; 0. 0. 0.; 1. 2. 1.];
sobelY = [-1 0 1; -2 0 2; -1 0 1];
aX = imfilter(a, sobelX);
aY = imfilter(a, sobelY);
M = sqrt(aX .^ 2 + aY .^ 2);
maxM = max(max(M)');
mImage = M / maxM;

edge = (M >= t * maxM);

figure(1);
subplot(1, 3, 1), imshow(a);
subplot(1, 3, 2), imshow(mImage);
subplot(1, 3, 3), imshow(edge);
