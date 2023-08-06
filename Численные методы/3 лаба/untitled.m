eps=0.01;
F = @(x) (x+1).^2-1./x;

x=[-10:1:10];
plot(x, F(x))%построение графика
a=-2.1;
b=2;
a1=a;
a2=a;
b1=b;
b2=b;
x0=(a+b)/2;
ii=0
while 1
ii_max=100;
kor3 = x0;
ii=ii+1;
df = (F(kor3+eps)-F(kor3-eps))/eps;
g = -1/(df+1);
if ii>ii_max
break;
elseif abs(F(kor3)) <=eps
break;
else
x0 = kor3 + g*F(kor3);
kor3=x0;
end

end
kor3 % корень
ii % кол-во итераций

%Метод половинного деления
while(abs(b1-a1)>eps)%сокращаем область нахождения решения, пока не будет достигнута заданная точность
x0=(a1+b1)/2;%середина отрезка
if(F(x0)*F(a1)<0)%проверяем уловие 
b1=x0;%выбираем отрезок который содержит корень
else
a1=x0;
end
end

kor1=(a1+b1)/2;
%метод ньютона

[d1,d2]=Derivative(sym(F));
if (F(a)*d2(a)) > 0
x0 = a;
else
x0 = b;
end

kor2=x0;
xi = b;
while abs(kor2-xi)>eps
xi = kor2;
kor2 = xi - (F(xi) / d1(xi));
end
kor2

function [d1,d2]=Derivative(F)
d1=matlabFunction(diff(F));
d2=matlabFunction(diff(F, 2));
end