% Nguyen

% Step 0: Clear Command Window
clc; clear; close all;

% Step 1: Declare symbolic variables
syms x y

% Step 2: Ask user to input potential expression
disp('Enter the electric potential V(x, y):');
disp('Example: x^2 + y^2   or   sin(x)*cos(y)');
V_input = input('V(x,y) = ', 's');   % Get user input as string

% Step 3: Convert input string to math expression
V = str2sym(V_input);

% Step 4: Compute gradient and electric field components
gradV = gradient(V, [x, y]);   % gradV = [dV/dx; dV/dy]
Ex = -gradV(1);                % Electric field in x-direction
Ey = -gradV(2);                % Electric field in y-direction

% Step 5: Display results
fprintf('\nElectric field components:\n');
fprintf('Ex = %s\n', char(Ex));
fprintf('Ey = %s\n', char(Ey));
