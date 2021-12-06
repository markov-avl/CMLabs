clear all

n = 4;
a = [-7 -9 1 -9; -6 -8 -5 2; -3 6 5 -9; -2 0 -5 -9];
b = [29 42 11 75]';
x = a^(-1)*b;

ab = cat(2, a, b);

ab0 = ab

for j = 1:1:(n - 1)
  for i = (j + 1):1:n
    for k = 1:1:(n + 1)
      ab0(i, k) = ab(j, k) / ab(j, j) * ab(i, j) - ab(i, k);
    endfor
    ab = ab0;
  endfor
endfor

for j = n:(-1):2
  for i = (j - 1):(-1):1
    for k = 1:1:(n + 1)
      ab0(i, k) = ab(j, k) / ab(j, j) * ab(i, j) - ab(i, k);
    endfor
    ab = ab0;
  endfor
endfor

for j = 1:1:n
  for k = 1:1:(n+1)
    ab0(j, k) = ab(j, k) / ab(j, j);
  endfor
  ab = ab0;
endfor

ab