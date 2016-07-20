function n = nvocales(cad)
if ~isa(cad,'char')
    error('Introduzca un argumento de tipo char');
end
n=nnz(cad=='a' | cad=='e' | cad=='i' | cad=='o' | cad=='u' |...
    cad=='A' | cad=='E' | cad=='I' | cad=='O' | cad=='U');
end
