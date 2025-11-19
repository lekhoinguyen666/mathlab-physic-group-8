% Nguyen

% Task 1
% Clear Command Window
clc; clear; close all;

% Declare symbolic variables
syms x y

disp('Task 1');

% Ask user to input potential expression
disp('Enter the electric potential V(x, y):');
disp('Example: x^2 + y^2   or   sin(x)*cos(y)');
V_input = input('V(x,y) = ', 's');   % Get user input as string

% Convert input string to math expression
V = str2sym(V_input);