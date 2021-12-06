clear all

% исходные матрицы
A = [-7 -9 1 -9; -6 -8 -5 2; -3 6 5 -9; -2 0 -5 -9]
B = [29; 42; 11; 75]


printf("\n1.1 РЕШЕНИЕ СЛАУ МЕТОДОМ ГАУССА\n\n\n")


printf("Создаем расширенную матрицу, где слева матрица A, а справа - B:\n")
AB = cat(2, A, B)
AB0 = AB;

printf("Получаем треугольный вид матрицы:\n")
for i = 1:1:length(A)
  for j = (i + 1):1:length(A)
    for k = 1:1:length(AB)
      AB0(j, k) = AB(i, k) / AB(i, i) * AB(j, i) - AB(j, k);
    endfor
    AB = AB0;
  endfor
endfor
AB

printf("Убираем все коэффициенты, стоящие не на главной диагонали:\n")
for j = length(A):(-1):2
  for i = (j - 1):(-1):1
    for k = 1:1:length(AB)
      AB0(i, k) = AB(j, k) / AB(j, j) * AB(i, j) - AB(i, k);
    endfor
    AB = AB0;
  endfor
endfor
AB

printf("Получаем только единицы на главной диагонали:\n")
for j = 1:1:length(A)
  for k = 1:1:length(AB)
    AB0(j, k) = AB(j, k) / AB(j, j);
  endfor
  AB = AB0;
endfor
AB

printf("Так как мы получили в левой матрице только единицы на главной диагонали, то правая матрица есть искомая матрица X:\n")
X = AB'(length(AB), :)'


printf("\n1.2 ОБРАТНАЯ МАТРИЦА\n\n\n")


printf("По своей сути мы должны проделать всё то же самое, что и в методе Гаусса, только иначе создать расширенную матрицу - слева будет матрица A, а справа - единичная матрица:\n")
AA = cat(2, A, [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1])
AA0 = AA;

for i = 1:1:length(A)
  for j = (i + 1):1:length(A)
    for k = 1:1:length(AA)
      AA0(j, k) = AA(i, k) / AA(i, i) * AA(j, i) - AA(j, k);
    endfor
    AA = AA0;
  endfor
endfor

for j = length(A):(-1):2
  for i = (j - 1):(-1):1
    for k = 1:1:length(AA)
      AA0(i, k) = AA(j, k) / AA(j, j) * AA(i, j) - AA(i, k);
    endfor
    AA = AA0;
  endfor
endfor

for j = 1:1:length(A)
  for k = 1:1:length(AA)
    AA0(j, k) = AA(j, k) / AA(j, j);
  endfor
  AA = AA0;
endfor

printf("Наша расширенная матрица после проделывания всех шагов, что и в методе Гаусса:\n")
AA

printf("Таким образом, мы получаем обратную матрицу справа:\n")
invA = AA'([5, 6, 7, 8], :)'


printf("\n1.3 ОПРЕДЕЛИТЕЛЬ МАТРИЦЫ A\n\n\n")


A0 = A;
A1 = A;

printf("Получаем треугольный вид матрицы A:\n")
for i = 1:1:length(A)
  for j = (i + 1):1:length(A)
    for k = 1:1:length(A)
      A1(j, k) = A0(i, k) / A0(i, i) * A0(j, i) - A0(j, k);
    endfor
    A0 = A1;
  endfor
endfor
A0

printf("Теперь просто перемножаем все значения на главной диагонали и получаем определитель матрицы A:\n")
detA = A0(1, 1);
for i = 2:1:length(A)
  detA *= A0(i, i);
endfor
detA


printf("\n\n2.1 UL-РАЗЛОЖЕНИЕ МАТРИЦЫ A\n\n\n")