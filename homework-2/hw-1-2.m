clear all;

% ВХОДНЫЕ ДАННЫЕ

dx = 0.4;
x1 = (-1:dx:1)';
n = length(x1);
y1 = [];
for i = 1:1:n
    y1(i) = acos(x1(i));
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

x2 = [x1(1):0.01:x1(n)]';
y2 = [];
for i = 1:1:length(x2)
    y2(i) = lagrang(x2(i), x1, y1);
end


[x3, y3] = least_square_method(1, x1', y1);
[x4, y4] = least_square_method(2, x1', y1);
[x5, y5] = least_square_method(3, x1', y1);

plot(x1, y1, 's',   'MarkerEdgeColor', 'k', 'MarkerSize', 20,
     x2, y2, 'b-',  'LineWidth', 2,
     x3, y3, 'g-.', 'LineWidth', 3,
     x4, y4, 'k:',  'LineWidth', 4,
     x5, y5, 'r-',  'LineWidth', 2);
h = legend('y(x) = arccos(x)', 'Метод Лагранжа', 'approx(1)', 'approx(2)',
           'approx(3)', 'location', 'northeastoutside');
set(h, "fontsize", 12);
