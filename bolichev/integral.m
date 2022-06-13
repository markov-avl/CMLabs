clear all
dx = pi/12;
x=[0:dx:pi];
y=sin(x);
dx*sum(y)
dx/2*(y(1)+y(end)+2*sum(y(2:1:(end-1))))
dx/3*(y(1)+y(end)+4*sum(y(2:1:(end-1)))-2*sum(y(3:2:(end-2))))