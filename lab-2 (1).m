% Марков Андрей Владимирович - Б9119-02.03.03техпро (3-й курс)

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
    end
    AB = AB0;
  end
end
AB

printf("Убираем все коэффициенты, стоящие не на главной диагонали:\n")
for j = length(A):(-1):2
  for i = (j - 1):(-1):1
    for k = 1:1:length(AB)
      AB0(i, k) = AB(j, k) / AB(j, j) * AB(i, j) - AB(i, k);
    end
    AB = AB0;
  end
end
AB

printf("Получаем только единицы на главной диагонали:\n")
for j = 1:1:length(A)
  for k = 1:1:length(AB)
    AB0(j, k) = AB(j, k) / AB(j, j);
  end
  AB = AB0;
end
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
    end
    AA = AA0;
  end
end

for j = length(A):(-1):2
  for i = (j - 1):(-1):1
    for k = 1:1:length(AA)
      AA0(i, k) = AA(j, k) / AA(j, j) * AA(i, j) - AA(i, k);
    end
    AA = AA0;
  end
end

for j = 1:1:length(A)
  for k = 1:1:length(AA)
    AA0(j, k) = AA(j, k) / AA(j, j);
  end
  AA = AA0;
end

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
    end
    A0 = A1;
  end
end
A0

printf("Теперь просто перемножаем все значения на главной диагонали и получаем определитель матрицы A:\n")
detA = A0(1, 1);
for i = 2:1:length(A)
  detA *= A0(i, i);
end
detA


printf("\n\n2.1 UL-РАЗЛОЖЕНИЕ МАТРИЦЫ A\n\n\n")


L = zeros(length(A), length(A));
U = zeros(length(A), length(A));
for i = 1:1:length(A)
  L(i, i) = 1;
end

for i = 1:1:length(A)
  for j = 1:1:length(A)
    if i <= j
      U(i, j) = A(i, j) - sum(L(i, 1 : i - 1) * U(1: i - 1, j));
    end
    if i>j
      L(i,j) = (A(i, j) - sum(L(i, 1:j - 1) * U(1:j - 1, j))) / U(j, j);
    end
  end
end

L
U


printf("\n2.2 ОПРЕДЕЛИТЕЛЬ МАТРИЦЫ A С ПОМОЩЬЮ UL-РАЗЛОЖЕНИЯ\n\n\n")


detA = prod(diag(L)) * prod(diag(U))


printf("\n\n2.3 РЕШИТЬ СЛАУ С ПОМОЩЬЮ UL-РАЗЛОЖЕНИЯ\n\n")

LB = cat(2, L, B);

Y = zeros(4,1);
Y(1) = LB(1,5) / LB(1,1);
Y(2) = (LB(2,5) - LB(2,1) * Y(1)) / LB(2,2);
Y(3) = (LB(3,5) - LB(3,1) * Y(1) - LB(3,2) * Y(2)) /LB(3,3);
Y(4) = (LB(4,5) - LB(4,1) * Y(1) - LB(4,2) * Y(2) -LB(4,3) * Y(3)) / LB(4,4)

X = zeros(4,1);
X(4) = AB(4,5) / AB(4,4);
X(3) = (AB(3,5) - AB(3,4) * X(4)) / AB(3,3);
X(2) = (AB(2,5) - AB(2,3) * X(3) - AB(2,4) * X(4)) / AB(2,2);
X(1) = (AB(1,5) - AB(1,2) * X(2) - AB(1,3) * X(3) - AB(1,4) * X(4)) / AB(1,1)