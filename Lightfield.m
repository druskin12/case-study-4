%% 1.3 Task Part 2
% By using the function rays2img() render an image of the rays from 
% LightField.mat
% use reasonable values for the sensor width (e.g., 5 mm) and the number
% of pixels (e.g., 200).

clear;
close all;
% load data
load('LightField.mat');

figure;
subplot(2, 3, 1);
[img,x,y] = rays2img(rays(1, :), rays(3, :), 5e-3, 200); % Use width of
% 5e-3 and number of pixels of 200 as a basis for comparison.
colormap(gray);
imshow(img);
title('5 mm width, 200 pixels (Original)');
ax = gca;
ax.FontSize = 20;

% Increase sensor width to 10e-3.
subplot(2, 3, 2);
[img,x,y] = rays2img(rays(1, :), rays(3, :), 10e-3, 200); 
colormap(gray);
imshow(img);
title('10 mm width, 200 pixels');
ax = gca;
ax.FontSize = 20;

% Decrease sensor width to 1e-3.
subplot(2, 3, 3);
[img,x,y] = rays2img(rays(1, :), rays(3, :), 1e-3, 200);
colormap(gray);
imshow(img);
title('1 mm width, 200 pixels');
ax = gca;
ax.FontSize = 20;

% Increase number of sensor pixels to 300.
subplot(2, 3, 4);
[img,x,y] = rays2img(rays(1, :), rays(3, :), 5e-3, 300);
colormap(gray);
imshow(img);
title('5 mm width, 300 pixels');
ax = gca;
ax.FontSize = 20;

% Decrease number of sensor pixels to 100.
subplot(2, 3, 5);
[img,x,y] = rays2img(rays(1, :), rays(3, :), 5e-3, 100);
colormap(gray);
imshow(img);
title('5 mm width, 100 pixels');
ax = gca;
ax.FontSize = 20;

% explore a lot of the values before we conclude that it is a sharp image.

d = .2;
Md = [1, d, 0, 0; 
      0, 1, 0, 0; 
      0, 0, 1, d; 
      0, 0, 0, 1];
rays_out = zeros(size(rays));
for i = 1:size(rays, 2)
    rays_out(:, i) = Md*rays(:, i);
end
% final image with valid vaules of width and pixels
figure;
[img2,x,y] = rays2img(rays_out(1, :), rays_out(3, :), 5e-3, 200);
colormap(gray);
imshow(img2);
title('Propagation of d = 200 mm with 5 mm sensor width, 200 pixels');
ax = gca;
ax.FontSize = 20;