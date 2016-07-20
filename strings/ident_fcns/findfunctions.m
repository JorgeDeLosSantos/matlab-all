% function r = findfunctions(filename)
clear;clc;
filename = 'C:\Users\User\Documents\MATLAB\graficasBarras.m';

txt = fileread(filename);
patt = '\w+\([\w+,@'']*\)';
r_all = regexp(txt,patt,'match');
for i=1:length(r_all)
    r{i}=regexprep(r_all{i},'\([\w+,@'']*\)','');
end
% end