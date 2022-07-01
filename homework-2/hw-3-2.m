clear all;
format long;

% ВХОДНЫЕ ДАННЫЕ

a = -1;
b = 1;
points = 13;

dx = (b - a) / (points - 1);

x = [a]';
for i = 2:1:points
    x(i) = x(i - 1) + dx;
end

y = [];
for i = 1:1:length(x)
    y(i) = acos(x(i));
end

% ОПРЕДЕЛЕННЫЙ ИНТЕГРАЛ ПРИ ПОМОЩИ СОСТАВНЫХ КВАДРАТНЫХ ФОРМУЛ НЬЮТОНА-КОТЕСА
% НУЛЕВОГО, ПЕРВОГО, ВТОРОГО, ТРЕТЬЕГО И ЧЕТВЕРТОГО ПОРЯДКОВ

y0 = dx * sum(y)
y1 = dx/2 * (y(1) + 2*sum(y(2:1:end-1)) + y(end))
y2 = dx/3 * (y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end))
y3 = 3*dx/8 * (y(1) - sum(y(4:3:end-3)) + 3 * sum(y(2:1:end-1)) + y(end))
y4 = 2*dx/45 * (7*y(1) + 32*sum(y(2:2:end-1)) + 12*sum(y(3:4:end-2)) + 14*sum(y(5:4:end-4)) + 7*y(end))