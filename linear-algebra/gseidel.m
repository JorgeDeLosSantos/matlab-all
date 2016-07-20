a=1;
while (a==1)  clear all; clc;   
opcion=input('¿Desea resolver por el metodo de gauss-seidel? Presione 1 para continuar y 2 para salir: ');
 switch opcion
    case 1
        fprintf('\n\nIngrese la dimensión del sistema de ecuaciones \n');
        x=input('De cuantas lineas tiene la matriz: '); y=x+1;       
        fprintf('\n\nSistema de ecuaciones \n');
        for e=1:x
            for h=1:y
              if(h<=(y-1))  fprintf('Coeficiente de X%.f para ecuacion %.f : ',h,e);
              else fprintf('Resultado para ecuacion %.f: ',e);end
              z(e,h)=input('');
            end
        end
w = 1;
v = size(z,1);
a = size(z,2);
        disp('Sistema de ecuaciones expresado como matriz:');disp(z); zz=z;       
        for e=1:x
            for h=1:x
                B(e,h)=z(e,h);
            end
        end
        for e=1:x
                d(e)=z(e,y);
        end  
        dd=d;
        determinante=det(B);
        if(determinante==0)
            disp('El sistema no tiene solucion o posee infinidad de soluciones')
        else
            if(determinante>-0.01 & determinante<.01)
               disp('El sistema es mal condicionado')
               disp('El sistema se resolvera pero no se garantiza que los resultados obtenidos sean los correctos')
            end           
        fprintf('\nAsigne valores para iniciar las iteraciones\n')
        for e=1:x
            fprintf('Valor para X%.f : ',e)
            V(e)=input('');
        end
        for e=1:x
            for h=e+1:x
                if(z(e,e)<z(h,e)) b=z(e,:);z(e,:)=z(h,:);z(h,:)=b;h=x;end
            end        
        end
        Num=input('\nNúmero de Iteraciones: ');
        Cp=input('\nEscriba el error: ');  Er=Cp+1; I=0;        
    for e = 1:size(B,1)
        w = w*B(e,e);
    end
    if w ~= 0
        D = diag(diag(B));
        E = -(tril(B)-D);
        F = -(triu(B)-D);        
        DE1 = (D-E)^(-1);
        L1 = DE1*F;       
        R = round(norm(eig(L1),inf)*10^13)/10^(13);
        if R >= 1
            disp('El método no es convergente.')
        else       
        while (Er>Cp & I<Num)
            I=I+1;anterior=V;
            fprintf('\nResultados de la iteracion %.f : \n',I);
            for e=1:x
                    C(e)=z(e,y);
            end
            for e=1:x
                suma=0;
                for h=1:x
                    if (e~=h)
                    suma=suma+((z(e,h))*(V(h)));
                    end
                end
                V(e)=(C(e)-suma)/z(e,e);
            end     
            for e=1:x
                    Error(e)=abs(((V(e)-anterior(e))/V(e))*100);
            end
            for e=1:x
                fprintf('Valor obtenido para X%.f =%.5f       Valor anterior de X%.f =%.5f         Error en X%.f =%.5f  \n',e,V(e),e,anterior(e),e,Error(e));
            end 
            suma=0;
            for e=1:x
                suma=suma+(Error(e));
            end
            Errorprom=suma/x;
            if(Errorprom<=Cp) Er=Cp-1; end
            if(Er<Cp||I==Num)
            fprintf('\nVALORES DE LAS INCOGNITAS: \n');
            for e=1:x
                fprintf('X%.f = %.5f \n',e,V(e));
            end
            for e=1:x
                suma=0;
                for h=1:x 
                    suma=suma+(zz(e,h)*V(h));
                end
                D(e)=suma;
            end
            for e=1:x
                Err(e)=abs(((D(e)-C(e))/D(e))*100);
            end
            fprintf('\nCOMPROBACION EN EL SISTEMA ORIGINAL:\n')
             for e=1:x
                fprintf('Valores de comprobacion en ec.%.f =%.5f                Error en la ec.%.f =%.5f  \n',e,D(e),e,Err(e));
             end                   
            end
        end
        end
    end              
        end
           case 2
         clc;clear all;a=2;
    otherwise
      fprintf('\t\tESA OPCION NO EXISTE, VERIFIQUE SU MARCACION\n');  a=1;  system('pause');               
 end     
end
fprintf('\n Integrantes del Equipo: \n\n Eduardo Coutiño Cabrera \n Pedro Jorge De Los Santos Lara \n Jose Gustavo Mendez Lara \n Oswaldo Mendoza De La Torre \n Mario Alfredo Molina Espinosa \n Kevin Alejandro Niño Vazquez \n')