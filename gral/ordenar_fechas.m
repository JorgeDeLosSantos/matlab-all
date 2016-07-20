clear;clc;
% Datos originales
fid = fopen('0990B1C8.txt','r');
X = {fgetl(fid)};
while ~feof(fid)
    X = [X fgetl(fid)];
end
fclose(fid);

% Ordenando los datos
D = zeros(1,length(X));
for k = 1:length(X)
    curr_date = cell2mat(regexp(X{k},'\d{2}-\w{3}-\d{2}','match'));
    D(k) = datenum(curr_date);
end
[D,idx] = sort(D);

% Datos de salida ordenados
nfid = fopen('sorted.txt','w');
for j = 1:length(D)
    fprintf(nfid,'%s\n',X{idx(j)});
end
fclose(nfid);