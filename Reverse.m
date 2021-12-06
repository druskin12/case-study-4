d = .2;
Mdinverse = [1, -d, 0,  0; 
             0,  1, 0,  0; 
             0,  0, 1, -d; 
             0,  0, 0,  1];
rays_out = zeros(size(rays));
for i = 1:size(rays, 2)
    rays_out(:, i) = Mdinverse*rays(:, i);
end

figure;
[img,x,y] = rays2img(rays_out(1, :), rays_out(3, :), 5e-3, 200);
colormap(gray);
imshow(img);

width = max(rays_out(1, :)) - min(rays_out(1, :));
height = max(rays_out(3, :)) - min(rays_out(3, :));