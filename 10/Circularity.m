% circle = [ 3 3;
%            3 4;
%            3 5;
%            4 6;
%            5 7;
%            6 7;
%            7 7;
%            8 6;
%            9 5;
%            9 4;
%            9 3;
%            8 2;
%            7 1;
%            6 1;
%            5 1;
%            4 2;
%            3 3 ];
square = [  1 1;
            1 2;
            1 3;
            2 3;
            3 3;
            3 2;
            3 1;
            2 1;
            1 1  ];
        
sum1=0;
for i=1:size(square,1)-1
    sum1 = (square(i,1) * square(i+1,2)) + sum1;
end

sum2=0;
for i=1:size(square,1)-1
    sum2 = (square(i,2) * square(i+1,1)) + sum2;
end

area = (sum2 - sum1)/ 2.0;


perimeter=0;
for i=1:size(square,1)-1
    if square(i,1) == square(i+1,1) || square(i,2) == square(i+1,2)
        perimeter = perimeter +1;
    end
    if square(i,1) ~= square(i+1,1) && square(i,2) ~= square(i+1,2)
        perimeter = perimeter + sqrt(2) ;
    end
        
end
    
    
circulariy = (4 * pi * area) / (perimeter ^ 2);
    

    
    
    
    
    
    
    
    
    
    
    

