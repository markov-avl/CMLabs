% Найти значение первой и второй производной в центре интервала при помощи разностных схем различного порядка и с
% помощью интерполяционного полинома Ньютона.

x = [0, 0.2 * pi, 0.4 * pi, 0.6 * pi, 0.8 * pi, pi]';
n = length(x);
y = [];
for i = 1:1:n
    y(i) = sin(x(i));
end

function [l] = PolinNewton(x, X, Y)
    n = size(X);
    l = 0;
    dx=2;
    f_razn(1:1:n,1:1:n)=0;
    f_razn(:,1)=X;
    f_razn(:,2)=Y;
    for i=1:1:(n-1)
        for j=1:1:(n-i)
            f_razn(j,i+2)=f_razn(j+1,i+1)-f_razn(j,i+1);
        end
    end
    sum=0;
    for i=1:1:n
        pr=1;
        for j=1:1:(i-1)
            pr=pr.*(x-X(j));
        end
        sum=sum+f_razn(1,i+1)/(factorial(i-1)*dx^(i-1))*pr;
    end
    l=sum;
end

function s = newton (t, x, y)
    n = length(x) ; % Вычисление количества точек в массивах x и y
    for i = 1:n % Запись в первый столбец C разделённых разностей y
        C(i, 1) = y(i);
    end
    for i = 2:n % Формирование матрицы разделённых разностей
        for j = 2:n
            if (i < j)
                C(i, j) = 0;
            else
                C(i, j) = (C(i, j - 1) - C(j - 1, j - 1)) / (x(i) - x(j - 1));
            end
        end
    end
    for i = 1:n % Формирование массива коэффициентов полинома Ньютона
        A(i) = C(i, i);
    end

    s = 0; % Расчёт значения полинома в точке t по формуле (12.5)
    for i = 1:n
         p = 1;
         for j = 1:i-1
             p = p * (t - x(j));
         end
         s = s + A(i) * p;
    end
end

# sin'(x) -> cos(x)
# sin"(x) -> -sin(x)

%[PolinNewton(0, x, y), cos(0), -sin(0)]
%[PolinNewton(0.2 * pi, x, y), sin(0.2 * pi), cos(0.2 * pi), -sin(0.2 * pi)]
%[PolinNewton(0.4 * pi, x, y), cos(0.4 * pi), -sin(0.4 * pi)]
%[PolinNewton(0.6 * pi, x, y), cos(0.6 * pi), -sin(0.6 * pi)]
%[PolinNewton(0.8 * pi, x, y), cos(0.8 * pi), -sin(0.8 * pi)]
%[PolinNewton(pi, x, y), cos(pi), -sin(pi)]

[newton(0, x, y), sin(0), cos(0), -sin(0)]
[newton(0.2 * pi, x, y), sin(0.2 * pi), cos(0.2 * pi), -sin(0.2 * pi)]
[newton(0.4 * pi, x, y), sin(0.4 * pi), cos(0.4 * pi), -sin(0.4 * pi)]
[newton(0.5 * pi, x, y), sin(0.5 * pi), cos(0.5 * pi), -sin(0.5 * pi)]
[newton(0.6 * pi, x, y), sin(0.6 * pi), cos(0.6 * pi), -sin(0.6 * pi)]
[newton(0.8 * pi, x, y), sin(0.8 * pi), cos(0.8 * pi), -sin(0.8 * pi)]
[newton(pi, x, y), sin(pi), cos(pi), -sin(pi)]