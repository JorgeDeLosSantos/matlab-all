% Ordena palabras alfabeticamente
clear all;clc;
N=input('N�mero de Palabras: ');
for i=1:N
    M{i}=input(sprintf('Palabra %s: ',num2str(i)),'s');
end
MS=sort(M);
fprintf('\n*** Palabras ordenadas alfab�ticamente ***\n');
for i=1:N
    fprintf('%s. %s\n',num2str(i),MS{i});
end