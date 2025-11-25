%Task 4 nhân làm thử 
% Task 4
disp('Task 4');

% --- Plot 3D surface of electric potential V(x,y) ---
figure(1);
surf(X, Y, V_grid);
title('Electric Potential Distribution V(x,y)');
xlabel('x'); ylabel('y'); zlabel('V(x,y)');
shading interp;         % smooth color interpolation
colorbar;               % show color scale
colormap('jet');        % optional visually clear color map

% --- Plot 3D surface of electric field energy density u(x,y) ---
figure(2);
surf(X, Y, u);
title('Electric Field Energy Density u(x,y)');
xlabel('x'); ylabel('y'); zlabel('u(x,y)');
shading interp;
colorbar;
colormap('hot');

disp('3D plots successfully generated.');
