% y' = 2y - 3x^2, y(0) = 0
clear all;
Dif1 = @(X, Y)(2*Y - 3*X.^2);
Dif1init = 0;
dF1dx = @(X)(-6*X);
dF1dy = @()(2);
dx = 0.01;
C = -3/4;
points = [0:dx:10];
Dif1Solution = @(X)(-(3*e.^(2*X))./4 + (3*X.^2)./2 + 3*X./2 + 3./4);

function res = Yavniy(Func, points, Y)
  Size = size(points)(2);
  dx = points(2) - points(1);
  res(Size) = 0;
  res(1) = Y;
  for i = 2:Size
    res(i) = res(i - 1) + Func(points(i - 1), res(i - 1)) * dx;
  end
end

function res = NeYavniy(Func, points, Y)
  Size = size(points)(2);
  dx = points(2) - points(1);
  res(Size) = 0;
  res(1) = Y;
  for i = 2:Size
    res(i) = res(i - 1) + Func(points(i - 1), res(i - 1)) * dx;
    res(i) = res(i - 1) + Func(points(i - 1), res(i)) * dx;
  end
end

function res = Trepez(Func, points, Y)
  Size = size(points)(2);
  dx = points(2) - points(1);
  res(Size) = 0;
  res(1) = Y;
  for i = 2:Size
    res(i) = res(i - 1) + dx/2*(Func(points(i - 1), res(i - 1)) + Func(points(i), res(i - 1) + Func(points(i - 1), res(i - 1)) * dx));
  end
end

function res = Utoncheniy(Func, points, Y)
  Size = size(points)(2);
  dx = points(2) - points(1);
  res(Size) = 0;
  res(1) = Y;
  res(2) = res(1) + Func(points(1), res(1)) * dx;
  for i = 3:Size
    res(i) = res(i - 2) + 2*(Func(points(i - 1), res(i - 1)))*dx;
  end
end

function res = ispravleniy(Func, points, Y, dFdx, dFdy)
  Size = size(points)(2);
  dx = points(2) - points(1);
  res(Size) = 0;
  res(1) = Y;
  for i = 2:Size
    X = points(i - 1);
    Y = res(i - 1);
    res(i) = Y + Func(X, Y)*dx + dx*dx/2*(dFdx(X, Y) + dFdy(X, Y)*Func(X, Y));
  end
end

function res = RungeKutta(Func, points, Y, Alpha)
  Size = size(points)(2);
  dx = points(2) - points(1);
  res(Size) = 0;
  res(1) = Y;
  for i = 2:Size
    FirstTerm = (1 - Alpha)*Func(points(i - 1), res(i - 1));
    SecondTerm = Alpha*Func(points(i - 1) + dx/(2*Alpha), points(i - 1) + dx/(2*Alpha)*Func(points(i - 1), res(i - 1)));
    res(i) = res(i - 1) + dx*(FirstTerm + SecondTerm);
  end
end

function res = AdamsOrder2(Func, points, Y)
  Size = size(points)(2);
  dx = points(2) - points(1);
  res(Size) = 0;
  res(1) = Y;
  res(2) = res(1) + Func(points(1), res(1)) * dx;
  for i = 3:Size
    res(i) = res(i-1) + dx*(3/2*Func(points(i-1), res(i-1)) - 1/2*Func(points(i-2), res(i-2)));
  end
end

function res = AdamsOrder3(Func, points, Y)
  Size = size(points)(2);
  dx = points(2) - points(1);
  res(Size) = 0;
  res(1) = Y;
  res(2) = res(1) + Func(points(1), res(1)) * dx;
  res(3) = res(2) + dx*(3/2*Func(points(2), res(2)) - 1/2*Func(points(1), res(1)));
  for i = 4:Size
    res(i) = res(i-1) + dx*(23/12*Func(points(i-1), res(i-1)) - 16/12*Func(points(i-2), res(i-2)) + 5/12*Func(points(i-3), res(i-3)));
  end
end

function res = AdamsOrder4(Func, points, Y)
  Size = size(points)(2);
  dx = points(2) - points(1);
  res(Size) = 0;
  res(1) = Y;
  res(2) = res(1) + Func(points(1), res(1)) * dx;
  res(3) = res(2) + dx*(3/2*Func(points(2), res(2)) - 1/2*Func(points(1), res(1)));
  res(4) = res(3) + dx*(23/12*Func(points(3), res(3)) - 16/12*Func(points(2), res(2)) + 5/12*Func(points(1), res(1)));
  for i = 5:Size
    res(i) = res(i-1) + dx*(55/24*Func(points(i-1), res(i-1)) - 59/24*Func(points(i-2), res(i-2)) + 37/24*Func(points(i-3), res(i-3)) - 9/24*Func(points(i-4), res(i-4)));
  end
end

printf("First eq, Euler\n")
printf("Explicit Euler ");
mean(abs(Dif1Solution(points) - Yavniy(Dif1, points, Dif1init)))
printf("implicit Euler ");
mean(abs(Dif1Solution(points) - NeYavniy(Dif1, points, Dif1init)))
printf("Trapezoid Euler ");
mean(abs(Dif1Solution(points) - Trepez(Dif1, points, Dif1init)))
printf("Refined Euler ");
mean(abs(Dif1Solution(points) - Utoncheniy(Dif1, points, Dif1init)))
printf("Corrected Euler ");
mean(abs(Dif1Solution(points) - ispravleniy(Dif1, points, Dif1init, dF1dx, dF1dy)))

figure(1);
plot(points, Yavniy(Dif1, points, Dif1init), "linewidth", 2,
     points, NeYavniy(Dif1, points, Dif1init), "linewidth", 2,
     points, Trepez(Dif1, points, Dif1init), "linewidth", 2,
     points, Utoncheniy(Dif1, points, Dif1init), "linewidth", 2,
     points, ispravleniy(Dif1, points, Dif1init, dF1dx, dF1dy), "linewidth", 2,
     points, Dif1Solution(points), "linewidth", 2
     );
legend("Explicit Euler", "implicit Euler", "Trapezoid Euler", "Refined Euler", "Corrected Euler", "Real Solution");

printf("\n")
printf("First eq, RungeKutta\n")

printf("Alpha = 0.2 ")
mean(abs(Dif1Solution(points) - RungeKutta(Dif1, points, Dif1init, 0.2)))
printf("Alpha = 0.1 ")
mean(abs(Dif1Solution(points) - RungeKutta(Dif1, points, Dif1init, 0.1)))
printf("Alpha = 0.075 ")
mean(abs(Dif1Solution(points) - RungeKutta(Dif1, points, Dif1init, 0.075)))
printf("Alpha = 0.05 ")
mean(abs(Dif1Solution(points) - RungeKutta(Dif1, points, Dif1init, 0.05)))

figure(2);
plot(points, RungeKutta(Dif1, points, Dif1init, 0.2), "linewidth", 2,
  points, RungeKutta(Dif1, points, Dif1init, 0.1), "linewidth", 2,
  points, RungeKutta(Dif1, points, Dif1init, 0.075), "linewidth", 2,
  points, RungeKutta(Dif1, points, Dif1init, 0.05), "linewidth", 2,
  points, Dif1Solution(points), "linewidth", 2);
legend("0.2", "0.1", "0.075", "0.05", "RealSolution");

printf("\n");
printf("First eq, Adams-Bashforth\n");
printf("Second order ")
mean(abs(Dif1Solution(points) - AdamsOrder2(Dif1, points, Dif1init)))
printf("Third order ")
mean(abs(Dif1Solution(points) - AdamsOrder3(Dif1, points, Dif1init)))
printf("Fourth order ")
mean(abs(Dif1Solution(points) - AdamsOrder4(Dif1, points, Dif1init)))
