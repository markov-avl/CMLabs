printf("Метод сопряженных градиентов")

clear all

n = 4
A = [19 -4 -9 -1; -2 20 -2 -7; 6 -5 -25 9; 0 -3 -9 12]
B = [100; -5; 34; 69]
X = A^(-1) * B

X0 = zeros(n, 1);
E0 = B - A * X0
p = E0;

for k = 1:1:4
    q = A * p;
    alpha = (E0' * p) / (q' * p);
    X = X0 + alpha * p;
    E = E0 - alpha * q;
    beta_ = (E' * q) / (p' * q);
    p = E - beta_ * p;
    X0 = X;
    E0 = E;
endfor

X