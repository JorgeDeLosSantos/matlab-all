function passwordGUI(pass)
pass='123';
f=figure('MenuBar','none',...
    'Resize','off',...
    'Position',[0 0 200 100]);
centerfig();

[hJPw,hPw]=javacomponent({'javax.swing.JPasswordField'},[],f);
set(hPw,'Position',[40 60 120 25]);

uicontrol('style','push',...
    'String','Continuar',...
    'Position',[50 20 100 25],...
    'Callback',@verificar);

    function verificar(~,~)
        passinsert=get(hJPw,'Text');
        if strcmp(pass,passinsert)
            close(gcf);
        else
            warndlg('Contraseña incorrecta','Password');
        end
    end
end