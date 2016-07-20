clear;clc;
URL =  'https://mail.google.com/mail/u/0/?tab=wm#inbox';
try
    txt= urlread(URL);
catch
    txt = '';
end
expr = '\w+@\w*.\w*';
regexp(txt,expr,'match')