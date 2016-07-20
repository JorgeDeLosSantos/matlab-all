function M = fsepia(X)
R = X(:,:,1);
G = X(:,:,2);
B = X(:,:,3);

NR=0.93*R+0.769*G+0.189*B;
NG=0.349*R+0.686*G+0.168*B;
NB=0.272*R+0.534*G+0.131*B;

M = cat(3,NR,NG,NB);

end