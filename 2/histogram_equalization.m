close all;
clear all;
f = imread('cameraman.tif');
hf = imhist(f);
g = histeq(f);
hg = imhist(g);

subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(hf);
subplot(2, 2, 3); imshow(g);
subplot(2, 2, 4); imshow(hg);

