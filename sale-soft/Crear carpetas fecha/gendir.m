clear;clc;
fecha=datestr(now,'mmm-yyyy');
carp=strcat('facturas/',fecha);
a=3;
if isdir(carp)==0
mkdir(carp);
file=strcat(carp,'/f12.mat');
save(file,'a')
else
file=strcat(carp,'/f11.mat');
save(file,'a')
end