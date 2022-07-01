clear all;
format long;

% ВХОДНЫЕ ДАННЫЕ

a = -1;
b = 1;
points = 5;

dx = (b - a) / (points - 1);

x = [a]';
for i = 2:1:points
    x(i) = x(i - 1) + dx;
end

y = [];
for i = 1:1:length(x)
    y(i) = acos(x(i));
end

% ОПРЕДЕЛЕННЫЙ ИНТЕГРАЛ ПРИ ПОМОЩИ КВАДРАТНЫХ ФОРМУЛ НЬЮТОНА-КОТЕСА НУЛЕВОГО,
% ПЕРВОГО, ВТОРОГО, ТРЕТЬЕГО И ЧЕТВЕРТОГО ПОРЯДКОВ

integral0 = dx * y(1)
integral1 = dx/2 * (y(1) + y(2))
integral2 = dx/3 * (y(1) + 4*y(2) + y(3))
integral3 = 3*dx/8 * (y(1) + 3*y(2) + 3*y(3) + y(4))
integral4 = 2*dx/45 * (7*y(1) + 32*y(2) + 12*y(3) + 32*y(4) + 7*y(5))
