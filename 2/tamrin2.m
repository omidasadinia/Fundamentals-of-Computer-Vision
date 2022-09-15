close all;
close all;
aInt = imread('cameraman.jpg');
a = im2double(aInt);

a_negative = 1 - a ;
average = (a + a_negative) ./ 2 ;
weighted_average = ((a .* 2) + a_negative) ./3 ; 

subplot(2, 3, 2); imshow(a); title("original image");
subplot(2, 3, 4); imshow(a_negative); title("negative image");
subplot(2, 3, 5); imshow(average); title("average image between"+ newline + "original image and negative image");
subplot(2, 3, 6); imshow(weighted_average); title(" weighted average image"+ newline + "original image and negative image");
