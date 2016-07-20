function V = volrev(f,a,b,eje)
n=100;
f=sym(f);
if strcmpi(eje,'x')
    V=pi*double(int(f^2,'x',a,b));
    x=a:(b-a)/n:b;
    [X,Y,Z]=cylinder(eval(f));
    axis([min(Z(:))*(b-a) max(Z(:))*(b-a) min(X(:)) max(X(:)) min(Y(:)) max(Y(:))]);
    surf((Z*(b-a))+a,X,Y);
elseif strcmpi(eje,'y')
    V=(2*pi)*double(int(sym('x')*f,'x',a,b));
else
    error('Eje incorrecto');
end
xlabel('x'),ylabel('y'),zlabel('z');
view(3)
end