clear all
n=6
x=[1 2 3 5 6 7]';
y=[4 1 2 -1 -1 -1]';
x0=4;
sum=0;
for i=1:1:n
  pr=1;
  for j=1:1:(i-1)
    pr=pr*(x0-x(j))/(x(i)-x(j));
  end
for j=(i+1):1:n
  pr=pr*(x0-x(j))/(x(i)-x(j));
end
sum=sum+pr*y(i);
end
sum