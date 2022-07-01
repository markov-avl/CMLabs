clear all;

% ВХОДНЫЕ ДАННЫЕ

x = [-1, -0.6, -0.2, 0.2, 0.6, 1]';
n = length(x);
y = [];
for i = 1:1:n
    y(i) = acos(x(i));
end

% ПРЯМОЙ МЕТОД ДЕЙСТВИЯ

y = y';

for i=1:1:n
    for j=1:1:n
        a(i, j) = x(i) ^ (j - 1);
    end
end

k = a ^ (-1) * y;
x2 = [x(1):0.01:x(n)]';
n2 = length(x2);
y2 = zeros(n2);

for i=1:1:n
    y2 += k(i).* x2.^(i - 1);
end


[x3, y3] = least_square_method(1, x, y);
[x4, y4] = least_square_method(2, x, y);
[x5, y5] = least_square_method(3, x, y);

plot(x,  y,  's',    'MarkerEdgeColor', 'k', 'MarkerSize', 20,
     x2, y2, 'b-',   'LineWidth', 2,
     x3, y3, 'g-.',  'LineWidth', 3,
     x4, y4, 'k:',   'LineWidth', 4,
     x5, y5, 'r- -', 'LineWidth', 2);
h = legend('y(x) = arccos(x)', 'Прямой метод действия', 'approx(1)',
           'approx(2)', 'approx(3)', 'location', 'northeastoutside');
set(h, "fontsize", 12);
