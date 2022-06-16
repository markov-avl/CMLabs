% Марков Андрей Владимирович - Б9119-02.03.03техпро (3-й курс)

clear all

% исходные матрицы
printf("\nМатрица А:\n\n")
A = [12 -3 -1 3; 5 20 9 1; 6 -3 -21 -7; 8 -7 3 -27];
printf("\nМатрица B:\n\n")
B = [-31; 90; 119; 71];
n = length(A);
E = 0.00001;

printf("\n1.1 РЕШЕНИЕ СЛАУ МЕТОДОМ ЯКОБИ\n\n\n")

k = 0;
X0 = zeros(n, 1);
X = X0;

while (abs(max(A * X - B)) > E)
  for i = 1:1:n
    j = [1: i - 1, i + 1: n];
    X(i) = (B(i) - A(i, j) * X0(j)) / A(i, i);
  end
  X0 = X;
  ++k;
end

printf("Решение (%d итерац.):\n\n", k)
X

printf("\n1.2 РЕШЕНИЕ СЛАУ МЕТОДОМ ГАУССА-ЗЕЙДЕЛЯ\n\n\n")

k = 0;
X0 = zeros(n, 1);
X = X0;

while (abs(max(A * X - B)) > E)
  for i = 1:1:n
    j = [1: i - 1, i + 1: n];
    X(i) = (B(i) - A(i,j) * X(j)) / A(i,i);
  end
  X0 = X;
  ++k;
end

printf("Решение (%d итерац.):\n\n", k)
X