clear all
r = [20 22.5 19.5 17 17.5 18 19 20 19 19.5];
m = mean(r)
std(r)
std(r)/sqrt(10)
s = sqrt((std(r)/sqrt(10))^2 + 5^2)
m-s
m+s