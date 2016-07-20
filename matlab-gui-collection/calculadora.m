function calculadora
% Calculadora básica
% 
% $ Por: Jorge De Los Santos $
% $ E-mail: delossantosmfq@gmail.com $
% $ Blog: http://matlab-typ.blogspot.mx $
% $ Rev. 1.0.0 $ 02/01/2014 $

figure('MenuBar','none','NumberTitle','off','Name','Calculadora',...
    'position',[200 200 200 280],'resize','off');
centerfig(gcf);

p=uipanel(gcf,'units','pixels','position',[10 10 180 190]);

% Pantalla
pantalla=uicontrol('style','text','string','',...
    'position',[10 230 180 40],'HorizontalAlignment','right',...
    'FontSize',20,'FontWeight','b','FontName','Courier');

% Botón Limpiar
uicontrol('style','push','string','AC','position',[60 205 40 18],...
    'backgroundcolor','r','callback',@acFcn,'foregroundcolor','w',...
    'fontweight','b');

% Botón OFF (Apagar)
uicontrol('style','push','string','OFF','position',[100 205 40 18],...
    'backgroundcolor','b','callback',@offFcn,'foregroundcolor','w',...
    'fontweight','b');

% Controles numéricos y operadores 
TECLAS = {'0','.','=','+','1','2','3','-','4','5','6','*','7','8','9','/'};
k = 1;
for i=1:length(TECLAS)
    uicontrol(p,'style','push',...
        'string',TECLAS{i},...
        'Units','Normalized',...
        'position',[(k-1)*1/4 floor((i-1)/4)/4 1/4 1/4]);
    if rem(i,4) == 0
        k = 1;
    else
        k = k + 1;
    end
end

set(findobj('parent',p),'callback',@calcFcn,'FontSize',14);

% Guarda y evalua los cálculos 
    function calcFcn(src,~)
        global cnum ceval
        % cnum - Guarda cadena numérica
        % ceval - Guarda cadena a evaluar
        pres=get(src,'str');
        if ~any(strcmp(pres,{'*','/','+','-','='}))
            cnum=[cnum,pres];
            set(pantalla,'str',cnum);
        elseif any(strcmp(pres,{'+','-','*','/'}))
            ceval=[ceval,cnum,pres];
            cnum='';
        elseif strcmp(pres,'=')
            ceval=[ceval,cnum];
            set(pantalla,'str',str2num(ceval));
            ceval=get(pantalla,'str');
            cnum='';
        end
    end

% Borra pantalla y restaura variables
    function acFcn(~,~)
        global cnum ceval
        cnum='';
        ceval='';
        set(pantalla,'str','0');
    end

% "Apaga" la calculadora 
    function offFcn(~,~)
        clearvars('-global','cnum','ceval');
        set(pantalla,'str','');
    end
end