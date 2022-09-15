clear all;
close all;
k = 2.;
fInt = imread('cameraman.jpg');
f = im2double(fInt);
sobelVertical = ...
    [-1 -2 -1;
      0  0  0;
      1  2  1];
sobelHorizontal = ...
    [-1  0  1;
     -2  0  2;
     -1  0  1];
fx = imfilter(f, sobelVertical);
fy = imfilter(f, sobelHorizontal);
fNormOfGradient = (fx .^ 2 + fy .^ 2) .^ 0.5;

figure(1);
subplot(2, 2, 1);
imshow(f);
subplot(2, 2, 2);
imshow(abs(fy));
subplot(2, 2, 3);
imshow(abs(fx));
subplot(2, 2, 4);
imshow(fNormOfGradient);
