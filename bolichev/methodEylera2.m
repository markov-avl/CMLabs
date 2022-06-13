clear all;
f = @(x,y)(y*cos(x)-0.5*sin(2*x));
dx=0.1;
x=[0:dx:5];
y(1)=2;
for i=1:1:(length(x)-1)
  y(i+1)=(y(i)-0.5*dx*sin(2*x(i+1)))/(1-dx*cos(x(i+1)));
end
yr=exp(sin(x))+sin(x)+1;
mean(abs(y-yr))