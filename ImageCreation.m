clear;
close all;

load('LightField.mat');
%% Traversing through different values of d2 and f to find the best combination
% These are the bounds of f that will be explored to find the ideal f.
f_lower = .1;
f_upper = .3;
% These are the bounds of d2 that will be explored to find the ideal d2.
d_lower = .1;
d_upper = .3;
% These will be the number of values of d2 and
% the number of values of f that will be explored.
numFrames = 5;

for d2 = linspace(d_lower, d_upper, numFrames) % This searches through
    % different values of d2, while keeping f = .1 m. An image is produced
    % for each different value of d2.
f = .1;
Mf = [1   0    0 0;
     -1/f 1    0 0;
      0   0    1 0;
      0   0 -1/f 1];

Md2 = [1, d2, 0, 0; 
      0, 1, 0, 0; 
      0, 0, 1, d2; 
      0, 0, 0, 1];

rays_out = zeros(size(rays));

for i = 1:size(rays, 2)
    rays_out(:, i) = Md2*Mf*rays(:, i); % rays is multiplied by Mf, and
    % the result is multiplied by Md2.
end

figure();
[img,x,y] = rays2img(rays_out(1, :), rays_out(3, :), 5e-3, 200); % The
% image is produced using a sensor width of 5 mm and 200 pixels.
colormap(gray);
imshow(img);
title(['Image after lens and propogation, d2 = ', num2str(d2), 'm, f = 0.1 m']);
end

for f = linspace(f_lower, f_upper, numFrames) % This searches through
    % different values of f, while keeping d2 = .2 m. An image is produced
    % for each different value of f.
d2 = .2;
Mf = [1   0    0 0;
     -1/f 1    0 0;
      0   0    1 0;
      0   0 -1/f 1];

Md2 = [1, d2, 0, 0; 
      0, 1, 0, 0; 
      0, 0, 1, d2; 
      0, 0, 0, 1];

rays_out = zeros(size(rays));

for i = 1:size(rays, 2)
    rays_out(:, i) = Md2*Mf*rays(:, i); % rays is multiplied by Mf, and
    % the result is multiplied by Md2.
end

figure();
[img,x,y] = rays2img(rays_out(1, :), rays_out(3, :), 5e-3, 200); % The
% image is produced using a sensor width of 5 mm and 200 pixels.
colormap(gray);
imshow(img);
title(['Image after lens and propogation, f = ', num2str(f), 'm, d2 = 0.2 m']);
end

%% This will create the image using the ideal values of d2 and f
f = .1;
d2 = .2;
Mf = [1   0    0 0;
     -1/f 1    0 0;
      0   0    1 0;
      0   0 -1/f 1];

Md2 = [1, d2, 0, 0; 
      0, 1, 0, 0; 
      0, 0, 1, d2; 
      0, 0, 0, 1];

rays_out = zeros(size(rays));

for i = 1:size(rays, 2)
    rays_out(:, i) = Md2*Mf*rays(:, i); % rays is multiplied by Mf, and
    % the result is multiplied by Md2.
end

figure();
[img,x,y] = rays2img(rays_out(1, :), rays_out(3, :), 5e-3, 200); % The
% image is produced using a sensor width of 5 mm and 200 pixels.
colormap(gray);
imshow(img);
title(['Final Image, f = ', num2str(f), 'm, d2 = 0.2 m']);
ax = gca;
ax.FontSize = 15;

width = max(rays_out(1, :)) - min(rays_out(1, :)); % We take the difference
% between the maximum and minimum x-positions to find the width of the
% object.
height = max(rays_out(3, :)) - min(rays_out(3, :)); % We take the difference
% between the maximum and minimum y-positions to find the height of the
% object.