clear all;
close all;
k = 2.;
aInt = imread('Moon.tif');
f = im2double(aInt);
w = 1./9. * ...
    [1 1 1;
     1 1 1;
     1 1 1];
fBar = imfilter(f, w);
gMask = f - fBar;
g = f + k * gMask;

figure(1);
subplot(2, 2, 1);
imshow(f);
subplot(2, 2, 2);
imshow(fBar);
subplot(2, 2, 3);
imshow((gMask + 0.12);
subplot(2, 2, 4);
imshow(g);
