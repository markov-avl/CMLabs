printf("Метод Якоби")

clear all

n = 4;
A = [19 -4 -9 -1; -2 20 -2 -7; 6 -5 -25 9; 0 -3 -9 12]
B = [100; -5; 34; 69]

X = A^(-1) * B

X0 = [0; 0; 0; 0];
X = X0;

for k = 1:1:50
    for i = 1:1:n
        sum = 0;
        for j = 1:1:(i - 1)
            sum = sum + A(i, j) * X0(j);
        endfor
        for j = (i + 1):1:n
            sum = sum + A(i, j) * X0(j);
        endfor
        X(i) = -sum / A(i, i) + B(i) / A(i, i);
    endfor
    X0 = X;
    [k max(abs(A * X - B))]
endfor

X

printf("На 36 итерации погрешность уже меньше одной тысячной\n\n")

printf("\nМетод Гаусса-Зейделя\n\n\n")

clear all

n = 4;
A = [19 -4 -9 -1; -2 20 -2 -7; 6 -5 -25 9; 0 -3 -9 12]
B = [100; -5; 34; 69]

X = A^(-1) * B

X0 = [0; 0; 0; 0];
X = X0;

for k = 1:1:50
    for i = 1:1:n
        sum = 0;
        for j = 1:1:(i - 1)
            sum = sum + A(i, j) * X(j);
        endfor
        for j = (i + 1):1:n
            sum = sum + A(i, j) * X(j);
        endfor
        X(i) = -sum / A(i, i) + B(i) / A(i, i);
    endfor
    X0 = X;
    [k max(abs(A * X - B))]
endfor

X

