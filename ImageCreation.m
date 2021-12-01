clear;
close all;

load('LightField.mat');

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

figure;
[img,x,y] = rays2img(rays_out(1, :), rays_out(3, :), 5e-3, 200);
colormap(gray);
imshow(img);