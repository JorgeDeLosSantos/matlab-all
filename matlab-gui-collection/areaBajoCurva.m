function areaBajoCurva
% Aproxima el área bajo la curva de una función f(x),
% mostrando la animación de la misma.
%
% $ Por: Jorge De Los Santos $
% $ E-mail: delossantosmfq@gmail.com $
% $ Blog: http://matlab-typ.blogspot.mx $
% $ Rev. 1.0.0 $ 15/02/2014 $

COLOR=[0.8 0.9 0.9];
figure('MenuBar','none','NumberTitle','off','Name','Área Bajo la Curva',...
    'position',[300 200 700 400],'color',COLOR*0.8,'resize','off');

axes('parent',gcf,'units','pixels','position',[30 40 420 350]);
plot(NaN);
p=uipanel(gcf,'units','pixels','position',[470 40 220 350],...
    'BackgroundColor',COLOR,'BorderType','line');

uicontrol(p,'style','text','String','f (x)','position',[20 300 40 20],...
    'fontsize',12,'fontweight','bold','backgroundcolor',COLOR);
fun=uicontrol(p,'style','edit','String','cos(x)','position',[65 300 120 20],...
    'fontsize',10,'fontweight','bold','backgroundcolor',[1 1 1]);

uicontrol(p,'style','text','String','Intervalo',...
    'position',[60 250 100 20],'fontsize',10,'fontweight',...
    'bold','backgroundcolor',COLOR);

uicontrol(p,'style','text','String','a','position',[20 220 20 20],...
    'fontsize',12,'fontweight','bold','backgroundcolor',COLOR);
da=uicontrol(p,'style','edit','String','0','position',[50 220 40 20],...
    'fontsize',10,'fontweight','bold','backgroundcolor',[1 1 1]);

uicontrol(p,'style','text','String','b','position',[120 220 20 20],...
    'fontsize',12,'fontweight','bold','backgroundcolor',COLOR);
db=uicontrol(p,'style','edit','String','3','position',[140 220 40 20],...
    'fontsize',10,'fontweight','bold','backgroundcolor',[1 1 1]);


uicontrol(p,'style','text','String','Número de Particiones',...
    'position',[40 150 150 20],'fontsize',10,'fontweight',...
    'bold','backgroundcolor',COLOR);
part=uicontrol(p,'style','slider','min',0,'max',100,...
    'position',[15 120 190 20],'callback',@calcular,...
    'sliderstep',[0.01 0.1],'value',10);
numpart=uicontrol(p,'style','text','String','','position',[105 95 30 20],...
    'fontsize',10,'fontweight','bold','backgroundcolor',[0.9 0.9 0.9]);


uicontrol(p,'style','text','String','Área aprox.','pos',[15 40 80 20],...
    'fontsize',8,'fontweight','bold','backgroundcolor',COLOR);
areaAp=uicontrol(p,'style','text','String','','position',[100 40 80 20],...
    'fontsize',10,'fontweight','bold','backgroundcolor',[0.95 0.7 0.7]);

uicontrol(p,'style','text','String','Área real','position',[15 10 80 20],...
    'fontsize',8,'fontweight','bold','backgroundcolor',COLOR);
areaRe=uicontrol(p,'style','text','String','','position',[100 10 80 20],...
    'fontsize',10,'fontweight','bold','backgroundcolor',[0.95 0.7 0.7]);

    function calcular(src,event)
        cla;
        y=get(fun,'String');
        a=str2double(get(da,'String'));
        b=str2double(get(db,'String'));
        n=get(part,'Value');
        % Integral área real
        Ar=double(int(sym(get(fun,'String')),a,b));
        % Área aproximada
        if n>0
            dx=(b-a)/round(n); % Divide el intervalo
            x=a:dx:b; 
            y=subs(y,'x',x); 
            ezplot(sym(get(fun,'String')),[a,b]);
            title('');
            legend(get(fun,'Str'));
            hold on
            for i=1:length(x)-1
                plot([x(i) x(i+1)],[y(i) y(i)],'r');
                plot([x(i) x(i)],[0 y(i)],'r');
                plot([x(i+1) x(i+1)],[0 y(i)],'r');
                A(i)=(y(i))*(x(i+1)-x(i));
            end
            set(numpart,'String',num2str(round(n)));
            set(areaAp,'String',num2str(sum(A)));
            set(areaRe,'String',num2str(Ar));
        else
            warndlg('Número de partición no válido');
            set(numpart,'String',num2str(round(n)));
            set(areaAp,'String','0');
            set(areaRe,'String',num2str(Ar));
        end
    end
end
