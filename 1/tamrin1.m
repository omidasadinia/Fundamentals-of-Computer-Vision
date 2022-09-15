clear all;
close all;
a = imread('cameraman.jpg');
%imtool(a);
b = a(: , size(a,2):-1:1);
%imtool(b)
c = a(size(a,1):-1:1 , : );
%imtool(c);
d = a(size(a,1):-1:1 , size(a,2):-1:1 );
%imtool(d);

figure(1);
subplot(2,2,1); imshow(a);
subplot(2,2,2); imshow(b);
subplot(2,2,3); imshow(c);
subplot(2,2,4); imshow(d);
