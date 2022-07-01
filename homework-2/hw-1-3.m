clear all;

% ВХОДНЫЕ ДАННЫЕ

dx = 0.4;
x1 = (-1:dx:1)';
n = length(x1);
y1 = [];
for i = 1:1:n
    y1(i) = acos(x1(i));
end

% ИНТЕРПОЛЯЦИОННЫЙ ПОЛИНОМ НЬЮТОНА

function s = newton (x, y, t)
    n = length(x);
    for i = 1:n
        C(i, 1) = y(i);
    end
    for i = 2:n
        for j = 2:n
            if (i < j)
                C(i, j) = 0;
            else
                C(i, j) = (C(i, j - 1) - C(j - 1, j - 1)) / (x(i) - x(j - 1));
            end
        end
    end
    for i = 1:n
        A(i) = C(i, i);
    end

    s = 0;
    for i = 1:n
         p = 1;
         for j = 1:i-1
             p = p * (t - x(j));
         end
         s = s + A(i) * p;
    end
end

x2 = [x1(1):0.01:x1(n)]';
y2 = [];
for t = x1(1):0.01:x1(n)
    y2 = [y2 newton(x1, y1, t)];
end


[x3, y3] = least_square_method(1, x1', y1);
[x4, y4] = least_square_method(2, x1', y1);
[x5, y5] = least_square_method(3, x1', y1);


plot(x1, y1, 's',   'MarkerEdgeColor', 'k', 'MarkerSize', 20,
     x2, y2, 'b-',  'LineWidth', 2,
     x3, y3, 'g-.', 'LineWidth', 3,
     x4, y4, 'k:',  'LineWidth', 4,
     x5, y5, 'r-',  'LineWidth', 2);
h = legend('y(x) = arccos(x)', 'Интерполяционный полином Ньютона', 'approx(1)',
           'approx(2)', 'approx(3)', 'location', 'northeastoutside');
set(h, "fontsize", 12);
