% Построить интерполяционный полином по значениям x и y(x) различными методами (прямой метод, Лагранжа, Ньютона).
% Построить интерполяционные сплайны второй степени. Методом наименьших квадратов построить аппроксимирующую функцию
% первой, второй и третьей степени.

% y(x) = arcsin(x)
% x = (-1, 0.6, -0.2, 0.2, 0.6, 1)

% Прямой метод действия
clear all;
y = [asin(-1), asin(-0.6), asin(-0.2), asin(0.2), asin(0.6), asin(1)]';
n = length(y);
x = [1:1:n];

for i=1:1:n
  for j=1:1:n
    a(i,j)=x(i)^(j-1);
  end
end

k = a ^ (-1) * y;
x2 = [1:0.01:n]';
n2 = length(x2);
y2 = zeros(n2);

for i=1:1:n
  y2 = y2 + k(i).* x2.^(i-1);
end

plot(x, y, 's', 'MarkerEdgeColor', 'k', 'MarkerSize', 20, x2, y2, '-', 'LineWidth', 2)
