clear;clc;
A=input('Ingrese la matriz: ');
[m,n]=size(A);
P=[];N=[];C=[];
kp=1;kn=1;kc=1;
for i=1:m
    for j=1:n
        val=A(i,j);
        if val>0
            P(kp)=val;
            posP(kp,:)=strcat(num2str(i),num2str(j));
            kp=kp+1;
        elseif val<0
            N(kn)=val;
            posN(kn,:)=strcat(num2str(i),num2str(j));
            kn=kn+1;
        else
            C(kc)=val;
            posC(kc,:)=strcat(num2str(i),num2str(j));
            kc=kc+1;
        end
    end
end

disp(A);
if ~isempty(P)
    fprintf('\nLa matriz contiene %d números positivos en las posiciones: ',length(P));
    for i=1:size(posP,1),fprintf('%s, ',posP(i,:));end;
end
if ~isempty(N)
fprintf('\nLa matriz contiene %d números negativos en las posiciones: ',length(N));
for i=1:size(posN,1),fprintf('%s, ',posN(i,:));end;
end
if ~isempty(C)
fprintf('\nLa matriz contiene %d ceros en las posiciones :',length(C));
for i=1:size(posC,1),fprintf('%s, ',posC(i,:));end;
end
fprintf('\n\n');
