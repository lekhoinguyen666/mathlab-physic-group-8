% Nhan
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

% Compute electric field components on the grid:
% E = -grad(V)
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

% Compute electric field energy density:
% u = 1/2 * epsilon0 * |E|^2
u = 0.5 * epsilon0 * (E_mag.^2);

disp('Electric field and energy density successfully computed.');
