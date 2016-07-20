function modcb
% Módulo de cálculo básico
%
% $ Por: Jorge De Los Santos $
% $ E-mail: delossantosmfq@gmail.com $
% $ Blog: http://matlab-typ.blogspot.mx $
% $ Rev. 0.0.1 $ 07/06/2014 $

vrs='0.0.1';
figure('MenuBar','none','NumberTitle','off',...
    'Name',['MODCB ',vrs],'Position',[200 200 350 250],...
    'color',[0.8 0.8 0.81]); 
centerfig(gcf);

pdat=uipanel(gcf,'Units','Normalized','Position',[0.02 0.5 0.6 0.45],...
    'BackgroundColor',get(gcf,'color')*0.8);
uicontrol(pdat,'style','text','String','f (x)',...
    'units','normalized','Position',[0.05 0.75 0.15 0.15],...
    'BackgroundColor',get(pdat,'BackgroundColor'),...
    'FontSize',10,'FontWeight','b');
fun=uicontrol(pdat,'style','edit','String','',...
    'units','normalized','Position',[0.24 0.72 0.64 0.20],...
    'FontName','Courier','FontWeight','b');

uicontrol(pdat,'style','text','String','Operación a realizar',...
    'units','normalized','Position',[0.1 0.35 0.80 0.20],...
    'BackgroundColor',get(pdat,'BackgroundColor'));
opers={'Derivar','Integrar','Integrar definidamente','Límite'};
op=uicontrol(pdat,'style','popupmenu','String',opers,...
    'units','normalized','Position',[0.12 0.15 0.76 0.20]);


pbot=uipanel(gcf,'Units','Normalized','Position',[0.65 0.5 0.32 0.45],...
    'BackgroundColor',get(gcf,'color')*0.8);
uicontrol(pbot,'style','push','String','Calcular',...
    'units','normalized','Position',[0.1 0.7 0.8 0.2],...
    'FontSize',9,'FontWeight','b','ForegroundColor',[0 0 0.5],...
    'Callback',@calcular);
uicontrol(pbot,'style','push','String','Graficar',...
    'units','normalized','Position',[0.1 0.4 0.8 0.2],...
    'FontSize',9,'FontWeight','b','ForegroundColor',[0 0 0.5],...
    'Callback',@graficar);
uicontrol(pbot,'style','push','String','Salir',...
    'units','normalized','Position',[0.1 0.1 0.8 0.2],...
    'FontSize',9,'FontWeight','b','ForegroundColor',[0 0 0.5],...
    'Callback',@salir);




p=uipanel(gcf,'units','normalized','position',[0.02 0.02 0.96 0.45],...
    'BackgroundColor','w');
ax=axes('parent',p,'units','normalized','position',[0 0 1 1],...
    'visible','off');
set(ax,'XLim',[0 1],'YLim',[0 1]);

    function calcular(~,~)
        cla;
        set(ax,'visible','off');
        fx=sym(get(fun,'String'));
        tipo=get(op,'String');
        switch tipo{get(op,'Value')}
            case 'Derivar'
                fo=['\frac{d}{dx}','(',latex(fx),')','='];
                r=diff(fx);
            case 'Integrar'
                fo=['\int{',latex(fx),'\,\,dx}='];
                r=int(fx);
            case 'Integrar definidamente'
                iev=inputdlg({'a','b'},'Intervalo',1,{'0','1'});
                a=str2double(iev{1});
                b=str2double(iev{2});
                fo=['\int_',num2str(a),'^',num2str(b),'{',latex(fx),'\,\,dx}='];
                r=int(fx,a,b);
            case 'Límite'
                val=inputdlg('Valor al que tiende x');
                val=cell2mat(val);
                fo=['\lim_{x \to ',num2str(val),'}','(',latex(fx),')','='];
                r=limit(fx,val);
            otherwise
                % pass: NO DEFAULT CASE
        end
        exprs=[fo,latex(r)];
        txt=horzcat('$$',exprs,'$$'); % Concatenar expresión
        text(0.5,0.5,txt,'interpreter','latex','FontSize',14,...
            'units','normalized','Horizontal','center');
    end

    function graficar(~,~)
        fx=sym(get(fun,'String'));
        intervalo=inputdlg({'a','b'},'Inserte el intervalo',1,{'0','5'});
        a=str2double(intervalo{1});
        b=str2double(intervalo{2});
        figure();
        ezplot(fx,[a b]);
    end

    function salir(~,~)
        close(gcf);
    end
end