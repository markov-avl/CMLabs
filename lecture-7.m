% x - cos(x) = 1
% y - ln(x + 1) = 2

% метод простых итераций!!!

clear all

h = @(x, y) cos(y) + 1;
d = @(x, y) log(x + 1) + 2;

f = @(x, y) x - cos(y) - 1;
g = @(x, y) y - log(x + 1) - 2;

x0 = 0;
y0 = 0;
xz = x0;
yz = y0;

for x = 1:1:10
    x2 = h(x0, y0);
    y2 = d(x0, y0);
    x0 = x2;
    y0 = y2;
end

f(x2, y2)
g(x2, y2)

% ---------------------------

clear all

h = @(x, y) cos(y) + 1;
d = @(x, y) log(x + 1) + 2;

%h = @

f = @(x, y) x - cos(y) - 1;
g = @(x, y) y - log(x + 1) - 2;

x0 = 0;
y0 = 0;
x2 = x0;
y2 = y0;
k = 0;
e = 0.000001;

while (abs(f(x2, y2)) + abs(g(x2, y2))) > e
  k = k+1;
  x2 = h(x0, y0);
  y2 = d(x2, y0);
  x0 = x2;
  y0 = y2;
end

[k x2 y2]

% # for x = 1:1:10
% #    x2 = h(x0, y0);
% #    y2 = d(x0, y0);
% #    x0 = x2;
% #    y0 = y2;
% # end

% #f(x2, y2)
% #g(x2, y2)

% ------------------------------------

% x - cos(x) = 1
% y - ln(x + 1) = 2

% метод простых итераций!!!

clear all

% h = @(x, y) cos(y) + 1;
% d = @(x, y) log(x + 1) + 2;

h = @(x, y) 1 + exp(y-2);
d = @(x, y) acos(x-1);

f = @(x, y) x - cos(y) - 1;
g = @(x, y) y - log(x + 1) - 2;

x0 = 0;
y0 = 0;
x2 = x0;
y2 = y0;
k = 0;
e = 0.000001;

% #while (abs(f(x2, y2)) + abs(g(x2, y2))) > e
% #  k = k+1;
% #  x2 = h(x0, y0);
% #  y2 = d(x0, y0);
% #  x0 = x2;
% #  y0 = y2;
% #endwhile

% #[k x2 y2]

 for x = 1:1:10
    x2 = h(x0, y0);
    y2 = d(x0, y0);
    x0 = x2;
    y0 = y2;
 endfor

[k x2 y2]

% f(x2, y2)
% g(x2, y2)