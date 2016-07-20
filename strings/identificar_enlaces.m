clear;clc;
URL =  'http://www.google.mx';
try
    txt= urlread(URL);
catch
    txt = '';
end
patt = 'http(s)?://[a-zA-Z"-/]*';
web_dirs = regexp(txt,patt,'match');
for i=1:length(web_dirs)
    disp(web_dirs{i});
end
