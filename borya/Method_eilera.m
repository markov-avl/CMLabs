# задачи начальных условий
# метод эйлера -> основан на ряде тейлора

# y = e ^ sinx + sinx + 1
# y' =  cosx * e ^ sinx + cosx = cos(e ^ sinx + 1) = y * cosx - cosx * sinx = y * cosx - 1/2 * sin2x
# y - sinx = e ^ sinx + 1

# y' = y * cosx - 1/2 * sin2x
# x [0; 5]
# y(0) = 2


# явный метод эйлера 1 порядка
clear all;
f = @(x, y) (y * cos(x) - 0.5 * sin(2 * x));
dx = 1;
x = [0:dx:500];
y(1) = 2;

for i = 1:1:(length(x) - 1)
  y(i+1) = y(i) + f(x(i), y(i)) * dx;
end

yr = exp(sin(x)) + sin(x) + 1;
mean(abs(y - yr))


# неявный метод эйлера 1 порядка
for i = 1:1:(length(x) - 1)
  y(i+1) = y(i) - 0.5 * dx * sin(2 * x(i + 1)) / (1 - dx * cos(x(i + 1)));
end

yr = exp(sin(x)) + sin(x) + 1;
mean(abs(y - yr))


# комбинированный метод эйлера 1 порядка
for i = 1:1:(length(x) - 1)
  yt = y(i) + f(x(i), y(i)) * dx;
  y(i+1) = y(i) + f(x(i+1), yt) * dx;
end

yr = exp(sin(x)) + sin(x) + 1;
mean(abs(y - yr))


# явный метод эйлера 2 порядка
dfdx = @(x, y) (-y * sin(x) - cos(2 * x));
dfdy = @(x, y) (cos(x));

for i = 1:1:(length(x) - 1)
  y(i+1) = y(i) + f(x(i), y(i)) * dx + 0.5 * (dfdx(x(i), y(i)) + dfdy(x(i), y(i)) *f(x(i), y(i))) * dx * dx;
end

yr = exp(sin(x)) + sin(x) + 1;
mean(abs(y - yr))


# метод Рунги-Кутты 2 порядка
c = 1.1;
for i = 1:1:(length(x) - 1)
  y(i + 1) = y(i) + ((1 - c) * f(x(i), y(i)) + c * f(x(i) + 0.5 * dx / c, y(i) + 0.5 * f(x(i), y(i)) * dx / c)) * dx;
end

yr = exp(sin(x)) + sin(x) + 1;
mean(abs(y - yr))
