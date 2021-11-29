clear;
close all;

load('LightField.mat');

figure;
subplot(2, 3, 1);
[img,x,y] = rays2img(rays(1, :), rays(3, :), 5e-3, 200);
colormap(gray);
imshow(img);
title('5 mm width, 200 pixels (Original)');

% Increase sensor width.
subplot(2, 3, 2);
[img,x,y] = rays2img(rays(1, :), rays(3, :), 10e-3, 200);
colormap(gray);
imshow(img);
title('10 mm width, 200 pixels');

% Decrease sensor width.
subplot(2, 3, 3);
[img,x,y] = rays2img(rays(1, :), rays(3, :), 1e-3, 200);
colormap(gray);
imshow(img);
title('1 mm width, 200 pixels');

% Increase number of sensor pixels.
subplot(2, 3, 4);
[img,x,y] = rays2img(rays(1, :), rays(3, :), 5e-3, 300);
colormap(gray);
imshow(img);
title('5 mm width, 300 pixels');

% Decrease number of sensor pixels.
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
x1 = 0;
y1 = 0;
ThetaY = 0;