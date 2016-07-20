function S = F%(t,y)
% Sistema ED:
%  x' = 2*x+3*y;
%  y' = 2*x+y;
% 
F1=@(x,y) 2*x+3*y;
F2=@(x,y) 2*x+y;
S={F1,F2};
% S=zeros(2,1);
% S(1)=2*y(1)+3*y(2);
% S(2)=2*y(1)+y(2);
end