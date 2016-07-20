function salida=simplecript(M,opcion)
E=[1:1:length(M)];
if opcion==1
    salida=double(M).*E;
elseif opcion==2
    s=M./E;
    salida=char(s);
else
    error(':S');
end
end
