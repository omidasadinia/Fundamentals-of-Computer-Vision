close all;
clear all;
a = im2bw(imread('HOM2.tif'));
b = im2bw(imread('kid.tif'));
aComplement = not(a);
bComplement = not(b);
c = imerode(a, b);
d = imerode(aComplement, bComplement);
e = c & d;

figure(1);
subplot(2, 4, 1), imshow(a);
subplot(2, 4, 2), imshow(b);
subplot(2, 4, 3), imshow(c);
subplot(2, 4, 5), imshow(aComplement);
subplot(2, 4, 6), imshow(bComplement);
subplot(2, 4, 7), imshow(d);
subplot(1, 4, 4), imshow(e);


