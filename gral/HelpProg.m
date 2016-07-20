clear;clc;
simb='*';
A='';
A(1,1)='[';
A(1,12)=']';
for i=1:10
    if i<10
    A(2,6)='0';
    A(2,7)='%';
    A(2,5)=num2str(i);
    A(1,i+1)=simb;
    disp(A);
    pause(0.2)
    clc
    else
        A(2,6:7)='0';
        A(2,8)='%';
        A(2,5)='1';
        A(1,i+1)=simb;
        disp(A);
    end
end