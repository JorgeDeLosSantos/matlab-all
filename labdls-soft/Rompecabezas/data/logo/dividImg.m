A=imread('Logo MATLAB.png');
p=100;
a{1,1}=A(1:p,1:p,:);
a{1,2}=A(1:p,p:2*p,:);
a{1,3}=A(1:p,2*p:3*p,:);
a{1,4}=A(1:p,3*p:4*p,:);
a{2,1}=A(p:2*p,1:p,:);
a{2,2}=A(p:2*p,p:2*p,:);
a{2,3}=A(p:2*p,2*p:3*p,:);
a{2,4}=A(p:2*p,3*p:4*p,:);
a{3,1}=A(2*p:3*p,1:p,:);
a{3,2}=A(2*p:3*p,p:2*p,:);
a{3,3}=A(2*p:3*p,2*p:3*p,:);
a{3,4}=A(2*p:3*p,3*p:4*p,:);
a{4,1}=A(3*p:4*p,1:p,:);
a{4,2}=A(3*p:4*p,p:2*p,:);
a{4,3}=A(3*p:4*p,2*p:3*p,:);
a{4,4}=A(3*p:4*p,3*p:4*p,:);
k=1;
for i=1:4
    for j=1:4
%         subplot(4,4,k)
%         imshow(a{i,j})
        imwrite(a{i,j},['a',num2str(i),num2str(j),'.png'],'png')
%         k=k+1;
    end
end
