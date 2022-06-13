clear all
n=7;
x=[1 2 3 4 5 6 7 8]';
y=[3 6 3 3 -2 2 3 9]';
A=zeros(2*n,2*n)';
B=zeros(1,2*n)';
for i=1:1:n
  A(i,i*2-1)=x(i+1)-x(i);
  A(i,i*2)=(x(i+1)-x(i))^2;
end
for i=1:1:(n-1)
  A(n+i,2*i-1)=1;
  A(n+i,2*i)=2*(x(i+1)-x(i));
  A(n+i,2*i+1)=-1;
end
A(2*n,1)=1;
#A(2*n,2*n-1)=1;
#A(2*n,2*n)=2*(x(n)-x(n-1));
for i=1:1:n
  B(i)=y(i+1)-y(i);
end
X=A^(-1)*B
for i=1:1:n
  a(i)=y(i);
  b(i)=X(2*i-1);
  c(i)=X(2*i)
end
k=0;
for i=1:1:n
  for x0=x(i):0.1:x(i+1)
    k=k+1;
    x2(k)=x0;
    y2(k)=a(i)+b(i)*(x0-x(i))+c(i)*(x0-x(i))^2;
  end
end

plot(x, y,'s','MarkerEdgeColor','k','MarkerSize',20, x2,y2,'-','LineWidth',2)
