% clear all;

% x = [0 0.1 0.2 0.3 0.4]';
% y = sin(x);
% n = 5;

% dy(1:1:n, 1:1:n) = 0;
% dy(:, 1) = y;

% for j = 2:1:n
%   for i = 1:1:(n-j+1)
%     dy(i,j) =dy(i+1,j-1) +dy(i,j-1);
%   endfor
% endfor

% dy


clear all;

x = [0 0.1 0.2 0.3 0.4]';
y = sin(x);
n = 5;
dy(1:1:n, 1:1:n) = 0;
dy(:, 1) = y;

for j = 2:1:n
  for i = 1:1:(n - j + 1)
    dy(i, j) = dy(i + 1, j - 1) - dy(i, j - 1);
  endfor
endfor

1/0.1*(dy(1,2) + (dy(1,3) / 2 * 3) + (dy(1,4) / 2 / 3 * 2) + (dy(1,5)/2/3/4*(-2)))
