clear all;clc
val=1200.1;
c=num2str(val-floor(val));
for k=1:100
    s=strcat(num2str(k/100));
    cent=strcat(num2str(k),'/100 M.N.');
    if strcmp(c,s)==1,break,end;
end
    
