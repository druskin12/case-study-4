clear;
close all;
d = .2;

Md = [1, d, 0, 0; 
      0, 1, 0, 0; 
      0, 0, 1, d; 
      0, 0, 0, 1];
  
x1 = 0;
y1 = 0;
ThetaY = 0;
rays_in = zeros(4, 5);
rays_out = zeros(4, 5);

VariousThetaX = [-pi/20, -pi/40, 0, pi/40, pi/20];
for i = 1:5
    ThetaX = VariousThetaX(i);
    rays_in(:, i) = [x1; ThetaX; y1; ThetaY];
    rays_out(:, i) = Md*rays_in(:, i);
end

ray_z = [zeros(1, size(rays_in, 2)); d*ones(1, size(rays_in, 2))];
plot(ray_z, [rays_in(1, :); rays_out(1, :)]);
hold on;
x1 = 0.01;
VariousThetaX = [-pi/20, -pi/40, 0, pi/40, pi/20];
for i = 1:5
    ThetaX = VariousThetaX(i);
    rays_in(:, i) = [x1; ThetaX; y1; ThetaY];
    rays_out(:, i) = Md*rays_in(:, i);
end

ray_z = [zeros(1, size(rays_in, 2)); d*ones(1, size(rays_in, 2))];
plot(ray_z, [rays_in(1, :); rays_out(1, :)]);


 