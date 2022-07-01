clear all;

% ВХОДНЫЕ ДАННЫЕ

x = [-1, -0.6, -0.2, 0.2, 0.6, 1]';
n = length(x);
y = [];
for i = 1:1:n
    y(i) = acos(x(i));
end

% МЕТОД ЛАГРАНЖА

function l = lagrang(x, X, Y)
    n = size(X);
    l = 0;
    for k = 1:1:n
        mult = 1;
        for i = 1:1:(k-1)
            mult = mult.*(x-X(i))./(X(k)-X(i));
        end
        for i = (k+1):1:n
            mult = mult.*(x-X(i))./(X(k)-X(i));
        end
        l += mult.*Y(k);
    end
end

x2 = [x(1):0.01:x(n)]';
y2 = [];

for i = 1:1:length(x2)
    y2(i) = lagrang(x2(i), x, y);
end


[x3, y3] = least_square_method(1, x', y);
[x4, y4] = least_square_method(2, x', y);
[x5, y5] = least_square_method(3, x', y);

plot(x,  y,  's',    'MarkerEdgeColor', 'k', 'MarkerSize', 20,
     x2, y2, 'b-',   'LineWidth', 2,
     x3, y3, 'g-.',  'LineWidth', 3,
     x4, y4, 'k:',   'LineWidth', 4,
     x5, y5, 'r- -', 'LineWidth', 2);
h = legend('y(x) = arccos(x)', 'Метод Лагранжа', 'approx(1)', 'approx(2)',
           'approx(3)', 'location', 'northeastoutside');
set(h, "fontsize", 12);
