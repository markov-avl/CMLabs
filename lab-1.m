clear all

% исходные матрицы
A = [-7 -9 1 -9; -6 -8 -5 2; -3 6 5 -9; -2 0 -5 -9];
B = [29; 42; 11; 75];

printf("1.1 РЕШЕНИЕ СЛАУ МЕТОДОМ ГАУССА\n\n")

printf("Создаем расширенную матрицу:\n")
AB = cat(2, A, B)
AB0 = AB;

for i = 1:1:length(A)
  for j = (i + 1):1:length(A)
    for k = 1:1:length(AB)
      AB0(j, k) = AB(i, k) / AB(i, i) * AB(j, i) - AB(j, k);
    endfor
    AB = AB0;
  endfor
endfor
printf("Получаем треугольный вид матрицы:\n")
AB

for j = length(A):(-1):2
  for i = (j - 1):(-1):1
    for k = 1:1:length(AB)
      AB0(i, k) = AB(j, k) / AB(j, j) * AB(i, j) - AB(i, k);
    endfor
    AB = AB0;
  endfor
endfor
printf("Убираем все коэффициенты, стоящие не на главной диагонали:\n")
AB

for j = 1:1:length(A)
  for k = 1:1:length(AB)
    AB0(j, k) = AB(j, k) / AB(j, j);
  endfor
  AB = AB0;
endfor
printf("Получаем только единицы на главной диагонали:\n")
AB

printf("Так как мы получили в левой матрице только единицы на главной диагонали, то правая матрица есть искомая матрица X:\n")
X = AB'(length(AB), :)'

printf("1.2 ОБРАТНАЯ МАТРИЦА\n\n")