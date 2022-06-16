clear all;

f=@(x) 3*x.*x.*x+2*x.*x+4*x-5-exp(x);
x=[-10: 1: 10]'
[x f(x)]

e=0.000001;
a=7;
b=8;
c=(a+b)/2;

k=0;
while abs(f(c))>e
  k=k+1;
  c=(a+b)/2;
  if f(a)*f(c)<0
    b=c;
  endif
  if f(c)*f(b)<0
    a=c;
  endif
endwhile

[k c f(c)]
