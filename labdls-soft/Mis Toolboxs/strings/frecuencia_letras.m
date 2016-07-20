function r = frecuencia_letras
archivo='texto.txt';
txt=leerArchivo(archivo);
MC=contarLetras(txt);
mostrarTabla(MC);
if nargout==1
    r=MC;
end
    function T=leerArchivo(arch)
        fid=fopen(arch,'r');
        k=1;
        while ~feof(fid)
            T{k}=fgetl(fid);
            k=k+1;
        end
        fclose(fid);
        T=cell2mat(T);
        T=lower(T);
        % Remover acentos
        T(T=='á')='a';
        T(T=='é')='e';
        T(T=='í')='i';
        T(T=='ó')='o';
        T(T=='ú')='u';
    end
    function MC=contarLetras(texto)
        cars=unique(texto);
        cars(~isletter(cars))='';
        for i=1:length(cars)
            if isletter(cars(i))
                cfrec=length(strfind(texto,cars(i)));
                MC{i,1}=cars(i);
                MC{i,2}=cfrec;
            end
        end
        MC=flipud(sortrows(MC,2));
    end

    function mostrarTabla(X)
        fprintf('\n=====================\n');
        fprintf('CARACTER    CANTIDAD\n');
        fprintf('=====================\n');
        for i=1:size(X,1)
            fprintf('%5s     %7d\n',X{i,1},X{i,2});
        end
        fprintf('=====================\n\n');
    end
end