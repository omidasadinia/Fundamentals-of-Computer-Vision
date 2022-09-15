close all;
clear all;
fInt = imread("mandrill.png");
fRGB = im2double(fInt);
fHSI = rgb2hsv(fRGB);


fH = fHSI(:, : , 1);
fS = fHSI(:, : , 2);
fI = fHSI(:, : , 3);


fH_in_degree = fH .* 360;
new_fS = fS; 

%new_fS(fH_in_degree>20 & fH_in_degree<330) = 0;
for i=1:size(fInt,1)
    for j=1:size(fInt,1)
        if(fH_in_degree(i,j)>15)
           new_fS(i,j) = 0; 
        end
    end
end

gHSI = fHSI;
gHSI(:, : , 1) = fH;
gHSI(:, : , 2) = new_fS;
gHSI(:, : , 1) =fI;
gRGB = hsv2rgb(gHSI);

figure(1);
subplot(1,5,1); imshow(gRGB);
subplot(1,5,2); imshow(fRGB);
