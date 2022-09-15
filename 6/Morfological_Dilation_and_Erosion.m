close all;
clear all;
f = imread('stone.jpeg');
f_gray = rgb2gray(f);
f_double = im2double(f_gray);

p = imread('b.png');


se = strel('disk', 2);




sobelVertical = ...
    [-1 -2 -1;
      0  0  0;
      1  2  1];
sobelHorizontal = ...
    [-1  0  1;
     -2  0  2;
     -1  0  1];
fx = imfilter(f_double, sobelVertical);
fy = imfilter(f_double, sobelHorizontal);
fNormOfGradient = (fx .^ 2 + fy .^ 2) .^ 0.5;



% 
% f1_erosion = imopen(f,se);
% f2_dilation = imclose(f1_erosion, se);
% 
% f3_erosion = imopen(f2_dilation,se);
% f3_dilation = imclose(f3_erosion, se);
% 
% f4_erosion = imopen(f3_dilation,se);
% f4_dilation = imclose(f4_erosion, se);
% 
% f5_erosion = imopen(f4_dilation,se);
% f5_dilation = imclose(f5_erosion, se);


% A=[1 2 3 4 5 6 7 8 9 10];
% A(1) = f ;
% for i=1:10
%     A(i+1) = imopen(A(i),se);
% end




 f1 = imdilate(fNormOfGradient,se);
  f2 = imdilate(f1,se);
  f3 = imdilate(f2,se);
  f4 = imdilate(f3,se);
  f5 = imdilate(f4,se);
  f6 = imdilate(f5,se);
  f7 = imdilate(f6,se);
  f8 = imdilate(f7,se);
  f9 = imopen(f8,se);
  f10 = imopen(f9,se);




a = imdilate(fNormOfGradient, se);
a2 = imdilate(a, se);


  
  
b = imerode(f6, se);
b2 = imerode(b, se);





figure(1);
subplot(2,2,1); imshow(f_gray);
subplot(2,2,2); imshow(fNormOfGradient);
subplot(2,2,3); imshow(b2);
subplot(2,2,4); imshow(imclose(p, se));



