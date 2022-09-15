clear all;
close all;
f =imread("Components1.bmp");
 
[m, n] = size(f);

se = [1 1 1;
      1 1 1;
      1 1 1] ;
  

subplot(3,3,1); imshow(f);
  
for e=1:4
    x = false(m, n, m);
    
    p = find(f);
    
    if (size(p,1)>0) == false
       break;
    end
    
    x(p(1))= true;
    
    for r=0:4392
        x(:, :, r+2) = imdilate(x(:, :, r+1), se) ;
        x(:, :, r+2) = x(:, :, r+2) & f ;
        
        if x(:, :, r+1)==x(:, :, r+2)
            f = f - x(:, :, 1+r);
            break;
        end
    
    end
    
    subplot(3,3,e+3); imshow(x(:, :, r+2));
    
end





