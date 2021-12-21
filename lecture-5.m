clear all

printf("Решение нелинейных уравнений\n\n")

f=@(x) 3*x.*x.*x + 2*x.*x + 4*x - 5 - exp(x);

x = [-10: 1: 10]';
f(x)

e = 0.0000001;
k = 0;
a = 0;
b = 1;
c = (a+b)/2;
while abs(f(c)) > e
  k = k + 1;
  c = (a + b) / 2;
  if f(a) * f(c) < 0
    b = c;
  end
  if f(c) * f(b) < 0
    a = c;
  end
end
[k c f(c)]

k = 0;
a = 7;
b = 8;
c = (a + b) / 2;
while abs(f(c)) > e
  k = k + 1;
  c = (a + b) / 2;
  if f(a) * f(c) < 0
    b = c;
  end
  if f(c) * f(b) < 0
    a = c;
  end
end
[k c f(c)]

k = 0;
a = 7;
b = 8;
c = (a + b) / 2;
while abs(f(c)) > e
  k = k + 1;
  c = a - (b - a) * f(a) / (f(b) - f(a));
  if f(a) * f(c) < 0
    b = c;
  end
  if f(c) * f(b) < 0
    a = c;
  end
end
[k c f(c)]