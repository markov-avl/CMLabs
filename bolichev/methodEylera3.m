clear all;
f = @(x, y) (y*cos(x)-0.5*sin(2*x));
dx = 2;
x = [0:dx:5];
y(1) = 2;
for i = 1:1:(length(x) - 1)
yt = y(i)+f(x(i),y(i))*dx;
y(i+1) = y(i) + f(x(i+1), yt)*dx;
endfor
yr = exp(sin(x)) + sin(x) + 1;
mean(abs(y-yr))