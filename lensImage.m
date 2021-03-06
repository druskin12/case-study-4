clear;
close all;

%% Original d2 and f
d1 = 0.2;
d2 = 0.2; 
f = 1/(1/d1 + 1/d2); % This equation must be maintained.

% First propagation step.
Md1 = [1, d1, 0, 0; 
      0, 1, 0, 0; 
      0, 0, 1, d1; 
      0, 0, 0, 1];

% Second propagation step.
Md2 = [1, d2, 0, 0; 
      0, 1, 0, 0; 
      0, 0, 1, d2; 
      0, 0, 0, 1];

% Thin lens
Mf = [1   0    0 0;
     -1/f 1    0 0;
      0   0    1 0;
      0   0 -1/f 1];

x1 = 0;
y1 = 0;
ThetaY = 0;
rays_in = zeros(4, 5);
rays_out = zeros(4, 5); % This matrix will be used to plot the rays from
% the first propagation step up to the thin lens.
rays_out2 = zeros(4, 5); % This matrix will be used to plot the rays
% during the second propagation step.

VariousThetaX = [-pi/20, -pi/40, 0, pi/40, pi/20];
for i = 1:5
    ThetaX = VariousThetaX(i);
    rays_in(:, i) = [x1; ThetaX; y1; ThetaY];
    rays_out(:, i) = Mf*Md1*rays_in(:, i); % Apply the first propagation
    % step, then the thin lins.
    rays_out2(:, i) = Md2*rays_out(:, i); % Then, apply the second
    % propagation step. 
end

ray_z = [zeros(1, size(rays_in, 2)); d1*ones(1, size(rays_in, 2))];
figure;
hold on;
plot(ray_z, [rays_in(1, :); rays_out(1, :)], 'Color',[0,0,1]);
ray_z = [zeros(1, size(rays_in, 2)); d2*ones(1, size(rays_in, 2))];
plot(ray_z + .2, [rays_out(1, :); rays_out2(1, :)], 'Color', [0,0,1]);

x1 = 0.01; % Change initial x position to 0.01
for i = 1:5
    ThetaX = VariousThetaX(i);
    rays_in(:, i) = [x1; ThetaX; y1; ThetaY];
    rays_out(:, i) = Mf*Md1*rays_in(:, i);
    rays_out2(:, i) = Md2*rays_out(:, i);
end

ray_z = [zeros(1, size(rays_in, 2)); d1*ones(1, size(rays_in, 2))];
plot(ray_z, [rays_in(1, :); rays_out(1, :)], 'Color',[1,0,0]);
ray_z = [zeros(1, size(rays_in, 2)); d2*ones(1, size(rays_in, 2))];
plot(ray_z + .2, [rays_out(1, :); rays_out2(1, :)], 'Color', [1,0,0]);

x1 = 0.02;
for i = 1:5
    ThetaX = VariousThetaX(i);
    rays_in(:, i) = [x1; ThetaX; y1; ThetaY];
    rays_out(:, i) = Mf*Md1*rays_in(:, i);
    rays_out2(:, i) = Md2*rays_out(:, i);
end

ray_z = [zeros(1, size(rays_in, 2)); d1*ones(1, size(rays_in, 2))];
plot(ray_z, [rays_in(1, :); rays_out(1, :)], 'Color',[0,1,0]);
ray_z = [zeros(1, size(rays_in, 2)); d2*ones(1, size(rays_in, 2))];
plot(ray_z + .2, [rays_out(1, :); rays_out2(1, :)], 'Color', [0,1,0]);

hold off;
title('Ray tracing through a lens, d2 = 200 mm, f = 100 mm');
ylabel('x (m)');
xlabel('z (m)');

ax = gca;
ax.FontSize = 24;

%% Decrease d2 and f
d1 = 0.2;
d2 = 0.1;
f = 1/(1/d1 + 1/d2); % This equation must be maintained.

% First propagation step.
Md1 = [1, d1, 0, 0; 
      0, 1, 0, 0; 
      0, 0, 1, d1; 
      0, 0, 0, 1];

% Second propagation step.
Md2 = [1, d2, 0, 0; 
      0, 1, 0, 0; 
      0, 0, 1, d2; 
      0, 0, 0, 1];

% Thin lens
Mf = [1   0    0 0;
     -1/f 1    0 0;
      0   0    1 0;
      0   0 -1/f 1];

x1 = 0;
y1 = 0;
ThetaY = 0;
rays_in = zeros(4, 5);
rays_out = zeros(4, 5); % This matrix will be used to plot the rays from
% the first propagation step up to the thin lens.
rays_out2 = zeros(4, 5); % This matrix will be used to plot the rays
% during the second propagation step.

VariousThetaX = [-pi/20, -pi/40, 0, pi/40, pi/20];
for i = 1:5
    ThetaX = VariousThetaX(i);
    rays_in(:, i) = [x1; ThetaX; y1; ThetaY];
    rays_out(:, i) = Mf*Md1*rays_in(:, i); % Apply the first propagation
    % step, then the thin lins.
    rays_out2(:, i) = Md2*rays_out(:, i); % Then, apply the second
    % propagation step. 
end

ray_z = [zeros(1, size(rays_in, 2)); d1*ones(1, size(rays_in, 2))];
figure;
hold on;
plot(ray_z, [rays_in(1, :); rays_out(1, :)], 'Color',[0,0,1]);
ray_z = [zeros(1, size(rays_in, 2)); d2*ones(1, size(rays_in, 2))];
plot(ray_z + .2, [rays_out(1, :); rays_out2(1, :)], 'Color', [0,0,1]);

x1 = 0.01; % Change initial x position to 0.01
for i = 1:5
    ThetaX = VariousThetaX(i);
    rays_in(:, i) = [x1; ThetaX; y1; ThetaY];
    rays_out(:, i) = Mf*Md1*rays_in(:, i);
    rays_out2(:, i) = Md2*rays_out(:, i);
end

ray_z = [zeros(1, size(rays_in, 2)); d1*ones(1, size(rays_in, 2))];
plot(ray_z, [rays_in(1, :); rays_out(1, :)], 'Color',[1,0,0]);
ray_z = [zeros(1, size(rays_in, 2)); d2*ones(1, size(rays_in, 2))];
plot(ray_z + .2, [rays_out(1, :); rays_out2(1, :)], 'Color', [1,0,0]);

x1 = 0.02;
for i = 1:5
    ThetaX = VariousThetaX(i);
    rays_in(:, i) = [x1; ThetaX; y1; ThetaY];
    rays_out(:, i) = Mf*Md1*rays_in(:, i);
    rays_out2(:, i) = Md2*rays_out(:, i);
end

ray_z = [zeros(1, size(rays_in, 2)); d1*ones(1, size(rays_in, 2))];
plot(ray_z, [rays_in(1, :); rays_out(1, :)], 'Color',[0,1,0]);
ray_z = [zeros(1, size(rays_in, 2)); d2*ones(1, size(rays_in, 2))];
plot(ray_z + .2, [rays_out(1, :); rays_out2(1, :)], 'Color', [0,1,0]);

hold off;
title('Ray tracing through a lens, d2 = 100 mm, f = 67 mm');
ylabel('x (m)');
xlabel('z (m)');

ax = gca;
ax.FontSize = 24;

%% Increase d2 and f
d1 = 0.2;
d2 = 0.3;
f = 1/(1/d1 + 1/d2); % This equation must be maintained.

% First propagation step.
Md1 = [1, d1, 0, 0; 
      0, 1, 0, 0; 
      0, 0, 1, d1; 
      0, 0, 0, 1];

% Second propagation step.
Md2 = [1, d2, 0, 0; 
      0, 1, 0, 0; 
      0, 0, 1, d2; 
      0, 0, 0, 1];

% Thin lens
Mf = [1   0    0 0;
     -1/f 1    0 0;
      0   0    1 0;
      0   0 -1/f 1];

x1 = 0;
y1 = 0;
ThetaY = 0;
rays_in = zeros(4, 5);
rays_out = zeros(4, 5); % This matrix will be used to plot the rays from
% the first propagation step up to the thin lens.
rays_out2 = zeros(4, 5); % This matrix will be used to plot the rays
% during the second propagation step.

VariousThetaX = [-pi/20, -pi/40, 0, pi/40, pi/20];
for i = 1:5
    ThetaX = VariousThetaX(i);
    rays_in(:, i) = [x1; ThetaX; y1; ThetaY];
    rays_out(:, i) = Mf*Md1*rays_in(:, i); % Apply the first propagation
    % step, then the thin lins.
    rays_out2(:, i) = Md2*rays_out(:, i); % Then, apply the second
    % propagation step. 
end

ray_z = [zeros(1, size(rays_in, 2)); d1*ones(1, size(rays_in, 2))];
figure;
hold on;
plot(ray_z, [rays_in(1, :); rays_out(1, :)], 'Color',[0,0,1]);
ray_z = [zeros(1, size(rays_in, 2)); d2*ones(1, size(rays_in, 2))];
plot(ray_z + .2, [rays_out(1, :); rays_out2(1, :)], 'Color', [0,0,1]);

x1 = 0.01; % Change initial x position to 0.01
for i = 1:5
    ThetaX = VariousThetaX(i);
    rays_in(:, i) = [x1; ThetaX; y1; ThetaY];
    rays_out(:, i) = Mf*Md1*rays_in(:, i);
    rays_out2(:, i) = Md2*rays_out(:, i);
end

ray_z = [zeros(1, size(rays_in, 2)); d1*ones(1, size(rays_in, 2))];
plot(ray_z, [rays_in(1, :); rays_out(1, :)], 'Color',[1,0,0]);
ray_z = [zeros(1, size(rays_in, 2)); d2*ones(1, size(rays_in, 2))];
plot(ray_z + .2, [rays_out(1, :); rays_out2(1, :)], 'Color', [1,0,0]);

x1 = 0.02;
for i = 1:5
    ThetaX = VariousThetaX(i);
    rays_in(:, i) = [x1; ThetaX; y1; ThetaY];
    rays_out(:, i) = Mf*Md1*rays_in(:, i);
    rays_out2(:, i) = Md2*rays_out(:, i);
end

ray_z = [zeros(1, size(rays_in, 2)); d1*ones(1, size(rays_in, 2))];
plot(ray_z, [rays_in(1, :); rays_out(1, :)], 'Color',[0,1,0]);
ray_z = [zeros(1, size(rays_in, 2)); d2*ones(1, size(rays_in, 2))];
plot(ray_z + .2, [rays_out(1, :); rays_out2(1, :)], 'Color', [0,1,0]);

hold off;
title('Ray tracing through a lens, d2 = 300 mm, f = 120 mm');
ylabel('x (m)');
xlabel('z (m)');

ax = gca;
ax.FontSize = 24;