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
% arch=strcat('database/clientes/',St);
% A=importdata(cell2mat(arch));