clear all;clc;
M=[0 0 -2  0 7  12;
   2 4 -10 6 12 28;
   2 4 -5  6 -5 -1];
if all(M(:,1)==0)
    M(:,1:2)=M(:,2:-1:1);
end
if M(1,1)==0
    M(1:2,:)=M(2:-1:1,:);
end
M(1,:)=M(1,:)*(1/M(1,1));
for i=2:size(M,1)
    if M(i,1)~=0
        k=-M(i,1);
        M(i,:)=M(i,:)+k*(M(1,:));
    end
end

