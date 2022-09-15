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

fNormOfGradient_histogram = imhist(fNormOfGradient);
figure(1);
subplot(2, 4, 1);
imshow(f);
subplot(2, 4, 5);
imshow(abs(fy));
subplot(2, 4, 6);
imshow(abs(fx));
subplot(2, 4, 8);
imshow(fNormOfGradient);
subplot(2, 4, 4);
plot(fNormOfGradient_histogram);