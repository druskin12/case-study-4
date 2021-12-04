clear;
close all;

load('LightField.mat');

figure;
subplot(2, 3, 1);
[img,x,y] = rays2img(rays(1, :), rays(3, :), 5e-3, 200); % Use width of
% 5e-3 and number of pixels of 200 as a basis for comparison.
colormap(gray);
imshow(img);
title('5 mm width, 200 pixels (Original)');

% Increase sensor width to 10e-3.
subplot(2, 3, 2);
[img,x,y] = rays2img(rays(1, :), rays(3, :), 10e-3, 200); 
colormap(gray);
imshow(img);
title('10 mm width, 200 pixels');

% Decrease sensor width to 1e-3.
subplot(2, 3, 3);
[img,x,y] = rays2img(rays(1, :), rays(3, :), 1e-3, 200);
colormap(gray);
imshow(img);
title('1 mm width, 200 pixels');

% Increase number of sensor pixels to 300.
subplot(2, 3, 4);
[img,x,y] = rays2img(rays(1, :), rays(3, :), 5e-3, 300);
colormap(gray);
imshow(img);
title('5 mm width, 300 pixels');

% Decrease number of sensor pixels to 100.
subplot(2, 3, 5);
[img,x,y] = rays2img(rays(1, :), rays(3, :), 5e-3, 100);
colormap(gray);
imshow(img);
title('5 mm width, 100 pixels');

% Prof Ching said that if it's not sharp, we'll know it's not sharp. Also
% it doesn't have to be sharp, but we should explore a lot of the values
% before we conclude that it isn't sharp.

d = .2;
Md = [1, d, 0, 0; 
      0, 1, 0, 0; 
      0, 0, 1, d; 
      0, 0, 0, 1];
rays_out = zeros(size(rays));
for i = 1:size(rays, 2)
    rays_out(:, i) = Md*rays(:, i);
end

figure;
[img2,x,y] = rays2img(rays_out(1, :), rays_out(3, :), 5e-3, 200);
colormap(gray);
imshow(img2);
title('Propgation of d = 200 m with 5 mm sensor width, 200 pixels');