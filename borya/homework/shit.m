%метод наименьших квадратов (линейная функция)
%
%clear all
%X=[23 25 27 29 31]';
%Y=[-9 -5 -12 -3 -11]';
%x=(23:0.1:31)';
%nn=size(X);
%n=nn(1);
%
%D=[sum(X.*X) sum(X); sum(X) n];
%F=[sum(Y.*X) sum(Y)]';
%E=D^(-1)*F;
%a=E(1);
%b=E(2);
%
%plot(X,Y,x,a*x+b)




%метод наименьших квадратов (полином второго порядка)
%
%clear all
%X=[23 25 27 29 31]';
%Y=[-9 -5 -12 -3 -11]';
%x=(23:0.1:31)';
%nn=size(X);
%n=nn(1);
%
%D=[sum(X.^4) sum(X.^3) sum(X.^2); sum(X.^3) sum(X.^2) sum(X); sum(X.^2) sum(X) n];
%F=[sum(Y.*X.*X) sum(Y.*X) sum(Y)]';
%E=D^(-1)*F;
%a=E(1);
%b=E(2);
%c=E(3);
%
%plot(x,a*x.*x+b*x+c,'-','LineWidth',2)
%hold
%plot(X,Y,'s','MarkerEdgeColor','k','MarkerSize',20)




%сплайн интерполяция (функция)
%
%function [l] = PolinSpline(x, X, Y)
%
%nn=size(X);
%n = nn(1)-1;
%B(1:1:2*n)=0;
%Z(1:1:2*n)=0;
%A(1:1:2*n,1:1:2*n)=0;
%
%for i=1:1:n
%B(i)=Y(i+1)-Y(i);
%A(i,i)=(X(i+1)-X(i))^2;
%A(i,i+n)=X(i+1)-X(i);
%A(i+n,i)=2*(X(i+1)-X(i));
%A(i+n,i+n)=1;
%end
%for i=1:1:(n-1)
%A(i+n,i+n+1)=-1;
%end
%l=A
%n
%end



%сплайн интерполяция (процедура)
%
%clear all
%
%X=[16 18 20 22]';
%Y=[0 -5 -7 -4]';
%x=(16:0.1:31)';
%y=PolinSpline(x,X,Y);



%сплайн интерполяция (функция)
%
%function [l] = PolinSpline(x, X, Y)
%
%nn=size(X);
%n = nn(1)-1;
%B(1:1:2*n)=0;
%Z(1:1:3*n)=0;
%A(1:1:2*n,1:1:2*n)=0;
%
%for i=1:1:n
%B(i)=Y(i+1)-Y(i);
%A(i,i)=(X(i+1)-X(i))^2;
%A(i,i+n)=X(i+1)-X(i);
%A(i+n,i)=2*(X(i+1)-X(i));
%A(i+n,i+n)=1;
%end
%for i=1:1:(n-1)
%A(i+n,i+n+1)=-1;
%end
%Z=cat(1,A^(-1)*B',Y(1:1:n));
%% l=Z
%nn=size(x);
%n2=nn(1);
%y(1:1:n2)=0;
%
%for i=1:1:n
%clear s
%s=find((x>=X(i))&(x<=X(i+1)));
%y(s)=Z(i)*(x(s)-X(i)).^2+Z(i+n)*(x(s)-X(i))+Z(i+2*n);
%
%
%end
%
%l=y;
%
%end


%сплайн интерполяция (процедура)
%
%clear all
%% X=[16 18 19 22 23 25 26 28 30 31]';
%% Y=[0 -5 -7 -4 -3 -3 -4 -9 -7 -7]';
%% x=(16:0.1:31)';
%X=[16 18 20 22]';
%Y=[0 -5 -7 -4]';
%x=(16:0.1:22)';
%y=PolinSpline(x,X,Y);
%% clear figure(1)
%%figure(1)
%plot(x,y,'-','LineWidth',2)
%hold
%plot(X,Y,'s','MarkerEdgeColor','k','MarkerSize',20)