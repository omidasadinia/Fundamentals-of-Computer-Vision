close all;
close all;
aInt = imread('cameraman.jpg');
a = im2double(aInt);
imtool(a)
gamma1 = 2;
gamma2 = 4;
gamma3 = 0.5;
gamma4 = 0.1;

b1 = a .^ gamma1 ;
b2 = a .^ gamma2 ;
b3 = a .^ gamma3 ;
b4 = a .^ gamma4 ;


%figure(1);
%subplot(1, 3, 1); imshow(a);
%subplot(2, 3, 2); imshow(b1);
%subplot(2, 3, 3); imshow(b2);
%subplot(2, 3, 5); imshow(b3);
%subplot(2, 3, 6); imshow(b4);