close all;
clear all;
a = imread('Components0.bmp');
maxNoComponents = 10;
se = ones(3, 3); % Structuring element
b = a; % Let a remain unchanged
comps = false(size(b, 1), size(b, 2), maxNoComponents);
for component = 1:maxNoComponents
    f = find(b);
    if size(f, 1) == 0
        break;
    end
    x = false(size(b));
    y = false(size(b));
    y(f(1)) = true;
    while not(isequal(x, y))
        x = y;
        y = and(imdilate(x, se), b);
    end
    comps(:, :, component) = y; % Save the found component
    b = b - y; % Remove the found component from b
end
figure(1);
subplot(1, 4, 1); imshow(a);
subplot(1, 4, 2); imshow(comps(:, :, 1));
subplot(1, 4, 3); imshow(comps(:, :, 2));
subplot(1, 4, 4); imshow(comps(:, :, 3));
