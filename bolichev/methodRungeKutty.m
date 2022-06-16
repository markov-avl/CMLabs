clear all;
f = @(x, y) (y*cos(x)-0.5*sin(2*x));
dfdx = @(x, y) (-y*sin(x)-cos(2*x));
dfdy = @(x,y) (cos(x))
dx = 0.1;
x = [0:dx:500];
y(1) = 2;


c = 1.1;
for i = 1:1:(length(x) - 1)
  y(i+1) = y(i) + ((1-c)*f(x(i),y(i))+c*f(x(i)+0.5*dx/c,y(i)+0.5*f(x(i),y(i))*dx/c))*dx;
end
yr = exp(sin(x))+sin(x)+1;
mean(abs(y-yr))