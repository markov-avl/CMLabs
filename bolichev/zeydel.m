clear all
n=4
a=[ 19 -4 -9 -1; -2 20 -2 -7; 6 -5 -25 9; 0 -3 -9 12];
b=[ 100 -5 34 69]';
a^(-1)*b
x0 = [0 0 0 0]';
x=x0;

for k=1:1:100
for i=1:1:n
  sum = 0;
  for j=1:1:(i-1)
    sum = sum + a(i,j)*x(j);
  end
  for j=(i+1):1:n
    sum=sum+a(i,j)*x0(j);
  end
  x(i)=-sum/a(i,i)+b(i)/a(i,i);
end
x0=x;
[k max(abs(a*x-b))]
end
x
  