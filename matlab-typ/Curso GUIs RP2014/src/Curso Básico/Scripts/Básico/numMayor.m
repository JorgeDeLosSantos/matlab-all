% Indentifica el numero mas grande de un vector
clear all;clc;
vector=[1 2 9 10 22 11 0 -2 9];
mayor=vector(1);
for i=2:length(vector)
    if vector(i) > mayor
        mayor=vector(i);
    end
end
fprintf('Mayor: %g \n',mayor);