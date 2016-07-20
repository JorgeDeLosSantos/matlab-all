clear all;clc
hold on
for i=1:10
    prismaHex([0 0 i],11-i,0.5,rand(1,3));
end