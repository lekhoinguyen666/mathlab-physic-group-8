% Nam

% Task 4

% Plot electric potential
figure('Name', 'Electric Potential V(x,y)', 'NumberTitle', 'off');
surf(x_vec, y_vec, V_grid, 'EdgeColor', 'none');
title('Electric Potential V(x,y)');
xlabel('x');
ylabel('y');
zlabel('V (Volts)');
colorbar;
colormap jet;
shading interp;
view(45, 35);

% Plot energy density
figure('Name', 'Electric Field Energy Density u(x,y)', 'NumberTitle', 'off');
surf(x_vec, y_vec, u, 'EdgeColor', 'none');
title('Energy Density u = 1/2 \epsilon_0 |E|^2');
xlabel('x');
ylabel('y');
zlabel('u (J/m^3)');
colorbar;
colormap turbo;
shading interp;
view(45, 35);

