function S = sumadigitos(N)
N=201;
N=num2str(N);
S=[];
for i=1:length(N)
    M(i)=str2num(N(i));
end
S=sum(M);
end