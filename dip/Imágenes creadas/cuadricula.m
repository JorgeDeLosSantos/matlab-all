clear all;clc;
% ancho=300;
% alto=300;

A={1,0,1,0,1;
   0,1,0,1,0;
   1,0,1,0,1;
   0,1,0,1,0;
   1,0,1,0,1};
for i=1:size(A,1)
    for j=1:size(A,2)
        if A{i,j}==1
            A{i,j}=ones(100);
        else
            A{i,j}=zeros(100);
        end
    end
end
A=cell2mat(A);
imshow(A');