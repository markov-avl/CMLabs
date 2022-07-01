% Марков Андрей Владимирович - Б9119-02.03.03техпро (3-й курс)

clear all

printf("\n1.1 РЕШЕНИЕ СЛАУ МЕТОДОМ ПРОГОНКИ\n\n")

% исходные матрицы
printf("\nМатрица А:\n\n")
A = [8 -4 0 0 0; -2 12 -7 0 0; 0 2 -9 1 0; 0 0 -8 17 -4; 0 0 0 -7 13]
printf("\nМатрица B:\n\n")
B = [32; 15; -10; 133; -76]
n = length(A);

di = [diag(A, 1); 0];
bi = [0; diag(A, -1)];
ci = diag(A);
ri = B;

delta(1) = -di(1) / ci(1);
lambda(1) = ri(1) / ci(1);

for i = 2:1:n
    delta(i) = -di(i) / (bi(i) * delta(i - 1) + ci(i));
    lambda(i) = (ri(i) - bi(i) * lambda(i - 1)) / (bi(i) * delta(i - 1) + ci(i));
end

X(n) = lambda(n);

for i = n:-1:2
    X(i - 1) = delta(i - 1) * X(i) + lambda(i - 1);
end

printf("Решение:\n\n")
X = X'