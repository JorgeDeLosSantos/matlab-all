clear all;clc;
load('datos/Acapulco.dat');
A=datenum('01-Ene-2011');
B=datenum('31-Dec-2011');
k=1;
for i=A:B
    c(k,:)={datestr(i)};
    k=k+1;
end

for a=1:365
    M(a,:)=horzcat(c(a),Temp(a));
end

f=fopen('Acapulco.dat','wt');
for m=1:365
    fprintf(f,'%s %d\n',M{m,:});
end
fclose(f);
