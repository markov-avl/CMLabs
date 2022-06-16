clear all
n = 4;
a = [1 2 -2 6; -3 -5 14 13; -2 -4 5 10; 1 2 -2 -2];
det(a)
ab=a;
ab0=ab;


  for j = 1:1:(n-1)
  for i = (j+1):1:n
    for k = 1:1:n
      ab0(i,k)=ab(j,k)/ab(j,j)*ab(i,j)-ab(i,k);
    end
    ab=ab0;
    end
  end
  
  for j = n:(-1):2
  for i = (j-1):(-1):1
    for k = 1:1:n
      ab0(i,k)=ab(j,k)/ab(j,j)*ab(i,j)-ab(i,k);
    end
    ab=ab0;
    end
  end


ab(1,1) * ab(2,2) * ab(3,3) * ab(4,4)