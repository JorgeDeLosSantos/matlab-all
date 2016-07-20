clear;clc;
a=dir('database/clientes/*.dat');
long=length(a);
for n=1:long
    St=cellstr(a(n).name);
    arch=cell2mat(strcat('database/clientes/',St));
    fid=fopen(arch,'r');
    i=1;
    tline = fgetl(fid);
    while ischar(tline)
        A(i,n)={tline};
        tline = fgetl(fid);
        i=i+1;
    end
    fclose(fid);
end
datos=A';
k=1;
    
s=strfind(datos(:,1),'MARTINEZ');
k=0;
for i=1:length(s)
    if ~isempty(s{i,1})
        k=k+1;
        pos(k)=i;
    end
end

co=datos(pos,1);
co=cell2mat(co);
for i=1:k
    n=strcat('database/clientes/',co(i,:),'.dat');
    type(n);
end


