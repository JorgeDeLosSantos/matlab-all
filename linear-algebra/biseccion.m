% Bisección Método
clear all;clc;
f='cos(x)';
xi=0;
xs=3;
e=0.1;
hold on
ezplot(f,[xi,xs]);grid;
ea=100;
xa=0;
a=subs(f,'x',xi);
b=subs(f,'x',xs);
inics=a*b;
n=0;

if inics<0
    while ea>e
        n=n+1;
        xr=(xi+xs)/2;
        fxi=subs(f,'x',xi);
        fxr=subs(f,'x',xr);
        ea=abs((xr-xa)/xr)*100;
        comp=fxi*fxr;
        if comp<0
            xs=xr;
        elseif comp>0
            xi=xr;
        else
            break;
        end
        xa=xr;
        XR(n)=xr;
        E(n)=ea;
    end
    plot(xr,0,'ro','MarkerSize',10);
elseif a==0
    xr=a;
elseif b==0
    xr=b;
else
    warndlg('Elija otro intervalo');
end
