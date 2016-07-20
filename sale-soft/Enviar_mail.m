clear all;close all;clc;
e_mail = 'delossantosmfq@gmail.com';
password = '1304912511';

setpref('Internet','E_mail',e_mail);
setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','SMTP_Username',e_mail);
setpref('Internet','SMTP_Password',password);

props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', ...
                  'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');

sendmail('delossantos_aries@hotmail.com', 'MATLAB TYP',['Hola buen día' 10 '' 10 'Saludos']);