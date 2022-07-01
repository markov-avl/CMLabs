clear all;
format long;

% ВХОДНЫЕ ДАННЫЕ

dx = 0.4;
x = (-1:dx:1)';
center = mean(x);
n = length(x);
y = [];
for i = 1:1:n
    y(i) = acos(x(i));
end

% ЗНАЧЕНИЕ ПЕРВОЙ И ВТОРОЙ ПРОИЗВОДНЫХ В ЦЕНТРЕ ИНТЕРВАЛА ПРИ ПОМОЩИ РАЗНОСТНЫХ
% СХЕМ РАЗЛИЧНОГО ПОРЯДКА

% f'(x) = (f(x + dx) - f(x)) / dx
y1 = (acos(center + dx) - acos(center)) / dx
% f'(x) = (f(x) - f(x - dx)) / dx
y1 = (acos(center) - acos(center - dx)) / dx
% f'(x) = (f(x + dx) - f(x - dx)) / 2dx
y1 = (acos(center + dx) - acos(center - dx)) / (2 * dx)
% f"(x) = (f(x + dx) - 2f(x) + f(x - dx)) / dx^2
y2 = (acos(center + dx) - 2 * (acos(center)) + acos(center - dx)) / dx ^ 2
