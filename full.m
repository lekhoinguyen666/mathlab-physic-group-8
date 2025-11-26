% Task 1

% Clear Command Window
clc; clear; close all;

% Declare symbolic variables
syms x y

disp('Task 1');

% Ask user to input potential expression
disp('Enter the electric potential V(x, y):');
disp('Example: x.^2 + y.^2   or   sin(x)*cos(y)');
V_input = input('V(x,y) = ', 's');   % Get user input as string

% Convert input string to math expression
V = str2sym(V_input);

% Task 2
disp('Task 2');

% Define the range for x and y
x_range = input('Enter x range [xmin xmax] (e.g. [-5 5]): ');  % specify the x-axis boundaries
y_range = input('Enter y range [ymin ymax] (e.g. [-5 5]): ');  % specify the y-axis boundaries

grid_points = input('Enter number of grid points (e.g. 50): '); % specify how many points to create in each direction

% Create mesh grid

% Fragment the x_range array to satisfy grid_points input (from [-5, 5] to output [-5, -4.7959, -4.5918, ..., 4.7959, 5])
x_vec = linspace(x_range(1), x_range(2), grid_points);

% Fragment the y_range array to satisfy grid_points input (from [-5, 5] to output [-5, -4.7959, -4.5918, ..., 4.7959, 5])
y_vec = linspace(y_range(1), y_range(2), grid_points);

[X, Y] = meshgrid(x_vec, y_vec);
fprintf('Mesh grid created: %dx%d points\n', size(X,1), size(X,2));

% Additional notes
% [-5 5] is similar to MATLAB's horizontal array notion of [-5, 5]


% Task 3
disp('Task 3');

% Compute the symbolic gradient of the potential V(x,y)
gradV = gradient(V, [x; y]);   % gradV = [dV/dx ; dV/dy]
dVdx = gradV(1);
dVdy = gradV(2);

% Convert symbolic expressions into numeric MATLAB functions
dVdx_fun = matlabFunction(dVdx, 'Vars', [x y]);
dVdy_fun = matlabFunction(dVdy, 'Vars', [x y]);
V_fun    = matlabFunction(V,    'Vars', [x y]);

% Evaluate electric potential on the grid
V_grid = V_fun(X, Y);

% Compute electric field components on the grid: (E = -grad(V))
Ex = -dVdx_fun(X, Y);
Ey = -dVdy_fun(X, Y);

% Fix: if Ex or Ey are scalars, expand them to match the grid size
if isscalar(Ex)
    Ex = Ex * ones(size(X));
end
if isscalar(Ey)
    Ey = Ey * ones(size(Y));
end

% Compute magnitude of the electric field
E_mag = sqrt(Ex.^2 + Ey.^2);

% Define permittivity of free space
epsilon0 = 8.854e-12;

% Compute electric field energy density: (u = 1/2 * epsilon0 * |E|^2)
u = 0.5 * epsilon0 * (E_mag.^2);

disp('Electric field and energy density successfully computed.');

% Task 4
disp('Task 4');

% Plot electric potential
figure('Name', 'Electric Potential V(x,y)', 'NumberTitle', 'off');
surf(X, Y, V_grid, 'EdgeColor', 'none');
title('Electric Potential V(x,y)');
xlabel('x');
ylabel('y');
zlabel('V (Volts)');
colorbar;
colormap jet;
shading interp;
view(45, 35);
disp('Successfully plotted electric potential on Oxy');

% Plot energy density
figure('Name', 'Electric Field Energy Density u(x,y)', 'NumberTitle', 'off');
surf(X, Y, u, 'EdgeColor', 'none');
title('Energy Density u = 1/2 \epsilon_0 |E|^2');
xlabel('x');
ylabel('y');
zlabel('u (J/m^3)');
colorbar;
colormap turbo;
shading interp;
view(45, 35);
disp('Successfully plotted electric field energy density');