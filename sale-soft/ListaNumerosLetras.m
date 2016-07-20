close all;clear all;clc;
for i=1:100
    c(i,:)={ToLetras(i)};
end
f=fopen('N.txt','wt');
for k=1:100
    fprintf(f,'%s \n',c{k,:});
end
fclose(f);