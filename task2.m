% Nguyen

% Task 2

disp('Task 2');

% Define the range for x and y
x_range = input('Enter x range [xmin xmax] (e.g. [-5 5]): ');  % specify the x-axis boundaries
y_range = input('Enter y range [ymin ymax] (e.g. [-5 5]): ');  % specify the y-axis boundaries
grid_points = input('Enter number of grid points (e.g. 50): '); % specify how many points to create in each direction

% Create mesh grid
% Fragment the x_range array to sastify grid_points input (from [-5, 5] to ouput [-5, -4.7959, -4.5918, ..., 4.7959, 5])
x_vec = linspace(x_range(1), x_range(2), grid_points); 
% Fragment the y_range array to sastify grid_points input (from [-5, 5] to output [-5, -4.7959, -4.5918, ..., 4.7959, 5])
y_vec = linspace(y_range(1), y_range(2), grid_points);

[X, Y] = meshgrid(x_vec, y_vec);
fprintf('Mesh grid created: %dx%d points\n', size(X,1), size(X,2));

% Additional notes
% [-5 5] is similar to MATLAB's horizontal array notion of [-5, 5]