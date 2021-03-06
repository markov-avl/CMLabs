clear all;
format long;

% ВХОДНЫЕ ДАННЫЕ

dx = 0.4;
x = (-1:dx:1)';
n = length(x);
y = [];
for i = 1:1:n
    y(i) = acos(x(i));
end

% ЗНАЧЕНИЕ ПЕРВОЙ ПРОИЗВОДНОЙ В ЦЕНТРЕ ИНТЕРВАЛА С ПОМОЩЬЮ ПОЛИНОМА НЬЮТОНА

dy(1:1:n, 1:1:n) = 0;
dy(:,1) = y;
for j = 2:1:n
  for i = 1:1:(n - j + 1)
    dy(i, j) = (dy(i + 1, j - 1) - dy(i, j - 1));
  end
end

y = 1 / dx * (dy(1, 2) + 3 * dy(1, 3) / 2 + 2 * dy(1, 4) / 6 - 2 * dy(1, 5) / 24)
