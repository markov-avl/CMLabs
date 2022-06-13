clear all;
f = @(x, y) (y*cos(x)-0.5*sin(2*x));
dfdx = @(x, y) (-y*sin(x)-cos(2*x));
dfdy = @(x,y) (cos(x))
dx = 0.1;
x = [0:dx:500];
y(1) = 2;
for i = 1:1:(length(x) - 1)
    y(i+1)= y(i) + f(x(i), y(i)) * dx + 0.5 * (dfdx(x(i), y(i)) + dfdy(x(i), y(i)) * f(x(i),y(i))) * dx * dx;
end
yr = exp(sin(x)) + sin(x) + 1;
mean(abs(y-yr))