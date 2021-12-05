clear;
close all;

load('LightField.mat');
%%
f_lower = .1;
f_upper = .3;
d_lower = .1;
d_upper = .3;
numFrames = 5;

for d2 = linspace(d_lower, d_upper, numFrames)
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
    rays_out(:, i) = Md2*Mf*rays(:, i);
end

figure();
[img,x,y] = rays2img(rays_out(1, :), rays_out(3, :), 5e-3, 200);
colormap(gray);
imshow(img);
title(['Image after lens and propogation, d2 = ', num2str(d2), 'm, f = 0.1 m']);
end

for f = linspace(f_lower, f_upper, numFrames)
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
    rays_out(:, i) = Md2*Mf*rays(:, i);
end

figure();
[img,x,y] = rays2img(rays_out(1, :), rays_out(3, :), 5e-3, 200);
colormap(gray);
imshow(img);
title(['Image after lens and propogation, f = ', num2str(f), 'm, d2 = 0.2 m']);
end

%%
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
    rays_out(:, i) = Md2*Mf*rays(:, i);
end

figure();
[img,x,y] = rays2img(rays_out(1, :), rays_out(3, :), 5e-3, 200);
colormap(gray);
imshow(img);
title(['Final Image, f = ', num2str(f), 'm, d2 = 0.2 m']);
ax = gca;
ax.FontSize = 15;
max(rays(1, :))
min(rays(1, :))
max(rays(3, :))
min(rays(3, :))

max(rays_out(1, :))
min(rays_out(1, :))
max(rays_out(3, :))
min(rays_out(3, :))