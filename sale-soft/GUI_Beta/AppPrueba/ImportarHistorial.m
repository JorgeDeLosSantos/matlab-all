clear;clc;
formato='%s%s%s%s';
delimiter={'/','/'};
fid=fopen('database/hist/hventas.dat','r');
A=textscan(fid,formato,'delimiter',delimiter,'Multipledelimsasone',1);
fclose(fid);
for i=1:4
    for j=1:size(A{1},1)
        datos(i,j)=A{i}(j);
    end
end
datos=datos';

