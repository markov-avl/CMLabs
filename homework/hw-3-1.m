clear all;
format long;

% ВХОДНЫЕ ДАННЫЕ

dx = 0.4;
x = [-1, -0.6, -0.2, 0.2, 0.6, 1]';
n = length(x);
y = [];
for i = 1:1:n
    y(i) = acos(x(i));
end

% ОПРЕДЕЛЕННЫЙ ИНТЕГРАЛ ПРИ ПОМОЩИ КВАДРАТНЫХ ФОРМУЛ НЬЮТОНА-КОТЕСА НУЛЕВОГО,
% ПЕРВОГО, ВТОРОГО, ТРЕТЬЕГО И ЧЕТВЕРТОГО ПОРЯДКОВ

y0 = dx * sum(y)
y1 = dx/2 * (y(1) + y(end) + 2 * sum(y(2:1:(end - 1))))
y2 = dx/3 * (y(1) + y(end) + 4 * sum(y(2:2:(end - 1))) - 2 * sum(y(3:2:(end-2))))
y3 = 3 * dx/8 * (y(1) + y(end) - sum(y(4:3:end-3)) + 3 * sum(y(2:1:(end-1))))
y4 = 2 * dx/45 * (7 * (y(1) + y(end)) + 12*sum(y(2:4:(end-2))) - 14 * sum(y(4:4:(end-4))) + 32 * sum(y(1:2:(end-1))))