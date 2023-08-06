function yy=lagrange(x,y,xx)
% вычисление интерполяционного полинома в форме Лагранжа
% x - массив координат узлов
% y - массив значений интерполируемой функции
% xx - массив значений аргумента, для которых надо вычислить значения полинома
% yy - массив значений полинома в точках xx 

% узнаем число узлов интерполяции (N=n+1)
N=length(x);
% создаем нулевой массив значений интерполяционного полинома
yy=zeros(size(xx));
% в цикле считаем сумму по узлам
for k=1:N
    % вычисляем произведения, т.е. функции Psi_k
    t=ones(size(xx));
    for j=[1:k-1, k+1:N]
        t=t.*(xx-x(j))/(x(k)-x(j));
    end
    % накапливаем сумму
    yy = yy + y(k)*t;
end




