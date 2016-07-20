function enviar_email

f=figure('Numbertitle','off','MenuBar','none',...
    'Name','Enviar e-mail','position',[200 200 600 500]);
centerfig();

et_email=uicontrol('style','text','string','E-mail','position',[10 360 80 20]);
et_cont=uicontrol('style','text','string','Contraseña','position',[360 360 80 20]);

email=uicontrol('style','edit','string','','position',[100 360 240 20]);
cont=uicontrol('style','edit','string','','position',[450 360 120 20]);

et_para=uicontrol('style','text','string','Para: ','position',[10 320 80 20]);
et_asunto=uicontrol('style','text','string','Asunto: ','position',[10 290 80 20]);

para=uicontrol('style','edit','string','','position',[100 320 300 20]);
asunto=uicontrol('style','edit','string','','position',[100 290 300 20]);

et_mensaje=uicontrol('style','text','string','Mensaje: ','position',[10 70 80 20]);
mensaje=uicontrol('style','edit','string','','position',[10 50 580 20],'max',1);

enviar=uicontrol('style','pushbutton','string','Enviar','position',[250 10 100 25],...
    'callback',@enviarfcn);

    function enviarfcn(src,event)
        e_email = get(email,'String');
        e_cont = get(cont,'String');
        e_para = get(para,'String');
        e_asunto = get(asunto,'String');
        e_mensaje = get(mensaje,'String');
        
%         [filename, pathname] = uigetfile('*.txt', 'Seleccione...');
%         if isequal(filename,0)
%             return;
%         else
%             narch=fullfile(pathname, filename);
%         end

        
        setpref('Internet','E_mail',e_email);
        setpref('Internet','SMTP_Server','smtp.gmail.com');
        setpref('Internet','SMTP_Username',e_email);
        setpref('Internet','SMTP_Password',e_cont);
        
        props = java.lang.System.getProperties;
        props.setProperty('mail.smtp.auth','true');
        props.setProperty('mail.smtp.socketFactory.class', ...
            'javax.net.ssl.SSLSocketFactory');
        props.setProperty('mail.smtp.socketFactory.port','465');
        
        e_mensaje
        e_asunto
        
        sendmail(e_para, e_asunto, e_mensaje);
    end
end