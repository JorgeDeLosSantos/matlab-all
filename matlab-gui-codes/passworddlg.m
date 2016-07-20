function passworddlg(user,pass)
%
% PASSWORDDLG(user,pass)
% 
% Donde:
% 
%       user   -   Nombre de usuario      
%       pass   -   Contrasenia o 'password'
%
%
% Version:  0.0.1
% Date: 02/06/2014
% Author: Jorge De Los Santos
% E-mail: delossantosmfq@gmail.com
% 

if nargin < 2
    % En caso de no pasarse argumentos de entrada (testeo)
    user='user';
    pass='123';
end

if ~isa(user,'char') || ~isa(pass,'char')
    error('Los argumentos de entrada deben ser de tipo char');
end

fpw = figure('MenuBar','none','NumberTitle','off',...
    'Resize','off','Name','Passworddlg 0.0.1',...
    'Position',[0 0 250 120]);
centerfig();


uicontrol(fpw,'style','text',...
    'String','Usuario',...
    'Position',[10 85 70 20],...
    'FontSize',10,...
    'BackgroundColor',get(fpw,'color'));

hUsr=uicontrol(fpw,'style','edit',...
    'String','',...
    'Position',[90 85 130 22]);

uicontrol(fpw,'style','text',...
    'String','Contraseña',...
    'Position',[10 50 70 20],...
    'FontSize',10,...
    'BackgroundColor',get(fpw,'color'));

[hJPw,hPw]=javacomponent({'javax.swing.JPasswordField'},[],fpw);
set(hPw,'Position',[90 50 130 22]);

uicontrol(fpw,'style','push',...
    'String','Aceptar',...
    'Position',[80 10 90 22],...
    'FontSize',10,...
    'FontWeight','Bold',...
    'Callback',@aceptar);

    function aceptar(~,~)
        pass_entrada=get(hJPw,'Text'); % Obtener contrasenia
        user_entrada=get(hUsr,'String'); % Obtener usuario
        if strcmp(pass,pass_entrada) && strcmp(user,user_entrada)
            close(gcf);
        else
            warndlg('Usuario o contraseña incorrecta','LAB DLS');
        end
    end
end