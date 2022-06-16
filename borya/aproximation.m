# апроксимация, прямая

clear all;
n = 14;
x = (1:1:14)';
y = [3, 3, 5, 4, 5, 3, 3, 3, 4, 5, 5, 5, 6, 5]';

B = [sum(y.*x) sum(y)]';
A = [sum(x.*x) sum(x); sum(x) n];
X = A^(-1) * B;
x2 = (1:0.1:14)';
y2 = X(1) * x2 + X(2);

plot(x, y,'s','MarkerEdgeColor','k','MarkerSize',20, x2,y2,'-','LineWidth',2)