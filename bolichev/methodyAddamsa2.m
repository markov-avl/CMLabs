clear all;
fx = @ (x,y) (y*cos(x)-0.5*sin(2*x));
dx = 0.1;
x = [0:dx:5];
y(1) = 2;

f(1)=fx(x(1),y(1));
y(2)=y(1)+f(1)*dx;
f(2)=fx(x(2),y(2));
y(3)=y(2)+((3/2)*f(2)-(1/2)*f(1))*dx;
f(3)=fx(x(3),y(3));




for i=3:1:(length(x)-1)
  y(i+1)=y(i)+((23/12)*f(i)-(16/12)*f(i-1)+(5/12)*f(i-2))*dx;
  f(i+1)=fx(x(i+1),y(i+1));
end
yr = exp(sin(x))+sin(x)+1;
mean(abs(y-yr))