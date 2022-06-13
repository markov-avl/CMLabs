clear all
n=6;
x=[1 2 3 5 6 7]';
y=[4 1 2 -1 -1 -1]';
dx=1;
x0=4;
dy=zeros(n,n);
dy(:,1)=y;
for j=2:1:n
  for i=1:1:(n-j+1)
    dy(i,j)=(dy(i+1,j-1)-dy(i,j-1))/(x(i+j-1)-x(i))
  end
end
sum=0;
for i=1:1:n
  pr=1;
  for j=1:1:(i-1)
    pr=pr*(x0-x(j));
  end
  sum=sum+dy(1,i)*pr;
end
sum
