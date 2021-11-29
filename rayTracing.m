clear;
close all;
%% Part 1: Ray propagation in free space
%% Ray Tracing
% Simulate the rays originating from two points on an object
% d = traveling distance
d = .2;
% 3D ray-transfer matrix (Md) that represents propagation in free space
Md = [1, d, 0, 0; 
      0, 1, 0, 0; 
      0, 0, 1, d; 
      0, 0, 0, 1];
% initial conditions
x1 = 0;
y1 = 0;
ThetaY = 0;
rays_in = zeros(4, 5);
rays_out = zeros(4, 5);
% changing theta
VariousThetaX = [-pi/20, -pi/40, 0, pi/40, pi/20];
for i = 1:5
    ThetaX = VariousThetaX(i);
    rays_in(:, i) = [x1; ThetaX; y1; ThetaY];
    rays_out(:, i) = Md*rays_in(:, i);
end

ray_z = [zeros(1, size(rays_in, 2)); d*ones(1, size(rays_in, 2))];
% plot ray tracing in blue
plot(ray_z, [rays_in(1, :); rays_out(1, :)],'Color',[0,0,1]);
% change x value to 0.01
hold on;
x1 = 0.01;
% use same theta values
VariousThetaX = [-pi/20, -pi/40, 0, pi/40, pi/20];
for i = 1:5
    ThetaX = VariousThetaX(i);
    rays_in(:, i) = [x1; ThetaX; y1; ThetaY];
    rays_out(:, i) = Md*rays_in(:, i);
end
ray_z = [zeros(1, size(rays_in, 2)); d*ones(1, size(rays_in, 2))];
% plot ray tracing with new x value on same graph in red
plot(ray_z, [rays_in(1, :); rays_out(1, :)],'Color',[1,0,0]);
title('Ray Tracing');
ylabel('x (m)');
xlabel('z (m)');

 