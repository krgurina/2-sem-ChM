X =[ 10 12 15 18 20 22 25 30 32 37];
Y = [-3 -5 -7 -11 -13 -18 -19 -23 -28 -32];
n=10;
SumX=sum(X);
SumY=sum(Y);
SumXY=sum(X.*Y);
SumX2=sum(X.^2);
XQv=SumX.^2;
A1=(SumY.*SumX-n.*SumXY)./(XQv-n.*SumX2)
A=(SumY-A1.*SumX)/n;

L=polyfit(X,Y,1);
% определение массива для построения графика функции
t= X(1):0.1:X(length(X));
ff=polyval(L, t);

% выводим график
plot(X, Y, 'ko', t, ff, 'r-');
legend('Y=-1.0973*x+8.3512')