clear all

printf("Решение нелинейных уравнений\n\n")

f=@(x) 3*x.*x.*x + 2*x.*x + 4*x - 5 - exp(x);
df=@(x) 9*x.*x +4*x + 4 - exp(x);

x = [-10:1:10]';
f(x)

x0 = 0;
x2 = x0;
e = 0.000001; k = 0;

# 1
while abs(f(x2)) > e
  k = k + 1;
  x2 = x0 - f(x0) / df(x0);
  x0 = x2;
end

[k x2 f(x2)]

x0 = 100;
x2 = x0;
e = 0.000001; k = 0;

# 2
while abs(f(x2)) > e
  k = k + 1;
  x2 = x0 - f(x0) / df(x0);
  x0 = x2;
end

[k x2 f(x2)]