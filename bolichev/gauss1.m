clear all
n = 4;
a = [1 2 -2 6; -3 -5 14 13; -2 -4 5 10; 1 2 -2 -2];
b = [24 41 20 0]';
x = a^(-1)*b;
ab = cat(2,a,b);
ab0=ab;

for j = n:(-1):2
  for i = (j-1):(-1):1
    for k = 1:1:(n+1)
      ab0(i,k)=ab(j,k)/ab(j,j)*ab(i,j)-ab(i,k);
    end
    ab=ab0;
    end
  end

  for j = 1:1:(n-1)
  for i = (j+1):1:n
    for k = 1:1:(n+1)
      ab0(i,k)=ab(j,k)/ab(j,j)*ab(i,j)-ab(i,k);
    end
    ab=ab0;
    end
  end
  
  for j=1:1:n
    for k=1:1:(n+1)
      ab0(j,k)=ab(j,k)/ab(j,j);
    end
    ab=ab0;
  end
