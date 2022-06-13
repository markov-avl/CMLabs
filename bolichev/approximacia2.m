clear all
x=(1:1:10)';
y=[3 3 5 4 5 3 3 3 4 5]';
n=1;

for i=1:1:(n+1)
  B(i) = sum(y.* (x.^ (n - i + 1)));
end

for i=1:1:(n+1)
  for j=1:1:(n+1)
    A(i,j)=sum(x.^(2*n-i-j+2));
  end
end

X = A^(-1)*B';
x2=(1:0.1:10)';
y2=zeros(length(x2), 1);
for i=1:1:(n+1)
  y2 = y2 + X(i) * x2.^(n - i + 1);
end
A
plot(x, y,'s','MarkerEdgeColor','k','MarkerSize',5, x2,y2,'-','LineWidth',2)