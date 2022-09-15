clear all;
close all;
k = 2.;
aInt = imread('Cameraman.tif');
f = im2double(aInt);
w = 1./9. * ...
    [1 1 1;
     1 1 1;
     1 1 1];
fBar = imfilter(f, w);

figure(1);
subplot(1, 2, 1);
imshow(f);
subplot(1, 2, 2);
imshow(fBar);
