clear all
n = 4;
a = [1 2 -2 6; -3 -5 14 13; -2 -4 5 10; 1 2 -2 -2];
u(1:1:n,1:1:n)=0;
l = eye(n);

for i = 1:1:n
  for j = 1:1:(i-1)
    sum=0;
    for k=1:1:(j-1);
      sum=sum+l(i,k)*u(k,j);
    end
    l(i,j)=(a(i,j)-sum)/u(j,j);
  end
  
for j=i:1:n
  sum=0;
  for k=1:1:(i-1)
    sum=sum+l(i,k)*u(k,j);
  end
u(i,j)=a(i,j)-sum;
end
end


det(l)*det(u)


b=[24 41 20 0];
for i=1:1:n
  sum=0;
  for k=1:1:(i-1)
    sum=sum+l(i,k)*y(k);
  end
  y(i)=b(i)-sum;
end

for i=n:(-1):1
  sum = 0;
  for k = (i+1):1:n
    sum=sum+u(i,k)*x(k);
  end
  x(i)=(y(i)-sum)/u(i,i);
  end
