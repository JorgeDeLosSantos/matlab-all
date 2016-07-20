clear all;clc;
ST = {'def fun():';'return 10'};
fid = fopen('pfile.py','w');
for i=1:length(ST)
    fprintf(fid,'%s\n',ST{i});
end
fclose(fid);