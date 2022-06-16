clear all
n=7;
x=[1 2 3 4 5 6 7]';
y=[4 1 2 3 -1 -1 -1]';
dx=1;
x0=2.5;
dy=zeros(n,n);
dy(:,1)=y;
for j=2:1:n
  for i=1:1:(n-j+1)
    dy(i,j)=dy(i+1,j-1)-dy(i,j-1)
  end
end
sum=0;
for i=1:1:n
  pr=1;
  for j=1:1:(i-1)
    pr=pr*(x0-x(j));
  end
  sum=sum+dy(1,i)/(factorial(i-1)*dx^(i-1))*pr;
end
sum
