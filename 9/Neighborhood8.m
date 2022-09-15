function n = Neighborhood8(x, y, xMax, yMax)
%Neighborhood8 Returns the 8-neighborhood of the given pixel
if x > 1
    xBegin = x - 1;
else
    xBegin = x;
end
if x < xMax
    xEnd = x + 1;
else
    xEnd = x;
end
if y > 1
    yBegin = y - 1;
else
    yBegin = y;
end
if y < yMax
    yEnd = y + 1;
else
    yEnd = y;
end
numNeighbors = (xEnd - xBegin + 1) * (yEnd - yBegin + 1) - 1;
n = zeros(numNeighbors, 2, 'uint32');
i = 0;
for thisx = xBegin:xEnd
    for thisy = yBegin:yEnd
        if thisx ~= x || thisy ~= y
            i = i + 1;
            n(i, :) = [thisx thisy];
        end
    end
end
end

