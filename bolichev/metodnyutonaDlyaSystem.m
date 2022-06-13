clear all;
F=@(x) [x(1)-cos(x(2))-1 ; x(2) - log(x(1)+1)-2];
dF = @(x)[1 sin(x(2)) ; -1/(x(1)+1) 1 ];
x0 = [0 0]';
x00 = [0 0]';
x2 = x0;
for (k=1:1:100)
  x2=x0-dF(x00)^(-1)*F(x0);
  x0=x2;
end
x2