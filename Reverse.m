d = .2;

% inverse propagation matrix that we found mathematically(Md-1) 

Mdinverse = [1, -d, 0,  0; 
             0,  1, 0,  0; 
             0,  0, 1, -d; 
             0,  0, 0,  1];
rays_out = zeros(size(rays));

% multiply each intput ray by the inverse propagation matrix to get output
% rays
for i = 1:size(rays, 2)
    rays_out(:, i) = Mdinverse*rays(:, i);
end

figure;
% plot figure
[img,x,y] = rays2img(rays_out(1, :), rays_out(3, :), 5e-3, 200);
colormap(gray);
imshow(img);
title('Image after Reverse Propagation');
ax = gca;
ax.FontSize = 5;

% find width of output image
width = max(rays_out(1, :)) - min(rays_out(1, :));
% find height of output image
height = max(rays_out(3, :)) - min(rays_out(3, :));