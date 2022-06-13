clear all;
n = 7;
x = [1:1:7];
y = [3 6 3 3 2 2 3]';

for i=1:1:n
  for j=1:1:n
    a(i,j)=x(i)^(j-1);
  end
end

k = a ^ (-1) * y;
x2 = [1:0.01:7]';
n2 = length(x2);
y2 = zeros(n2);

for i=1:1:n
  y2 = y2 + k(i).* x2.^(i-1);
end

plot(x, y,'s','MarkerEdgeColor','k','MarkerSize',20, x2,y2,'-','LineWidth',2)

# Сплайн-интерполяция  y = a1 + b1(x - x1) + c1(x - x1)**2