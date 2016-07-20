function bisec
% Calcula raíces de una ecuación mediante el 
% método de bisección.
%
% $ Por: Jorge De Los Santos $
% $ E-mail: delossantosmfq@gmail.com $
% $ Blog: http://matlab-typ.blogspot.mx $
% $ Rev. 1.0.0 $ 11/05/2014 $

figure('MenuBar','none','NumberTitle','off','resize','off',...
    'position',[200 200 600 350],'Name','Método de bisección');
centerfig(gcf);

axes('parent',gcf,'units','pixels','position',[250 40 340 280]);

pde=uipanel(gcf,'units','pixels','position',[10 190 200 150],...
    'title','Datos de entrada');
pds=uipanel(gcf,'units','pixels','position',[10 50 200 130],...
    'title','Datos de salida');

uicontrol(pde,'style','text','str','Ecuación','Pos',[10 100 50 20],...
    'fontweight','b');
df=uicontrol(pde,'style','edit','str','cos(x)','Pos',[70 105 110 20]);

uicontrol(pde,'style','text','str','xi','Pos',[10 70 50 20],...
    'fontweight','b');
dxi=uicontrol(pde,'style','edit','str','0','Pos',[70 75 40 20]);

uicontrol(pde,'style','text','str','xs','Pos',[10 40 50 20],...
    'fontweight','b');
dxs=uicontrol(pde,'style','edit','str','3','Pos',[70 45 40 20]);

uicontrol(pde,'style','text','str','% Error','Pos',[10 10 50 20],...
    'fontweight','b');
de=uicontrol(pde,'style','edit','str','0.1','Pos',[70 15 40 20]);

% Datos de salida
uicontrol(pds,'style','text','str','Raíz','Pos',[10 80 70 20],...
    'fontweight','b');
dxr=uicontrol(pds,'style','text','str','','Pos',[90 85 60 20],...
    'backgroundcolor',[0.5 1 1]);

uicontrol(pds,'style','text','str','Iteraciones','Pos',[10 50 70 20],...
    'fontweight','b');
dit=uicontrol(pds,'style','text','str','','Pos',[90 55 40 20],...
    'backgroundcolor',[0.5 1 1]);
uicontrol(pds,'style','push','str','Ver tabla','pos',[60 10 70 22],...
    'FontSize',9,'callback',@tabla,'BackgroundColor',[0.9 0.8 0.7]);

uicontrol('style','push','str','Calcular','pos',[30 10 70 22],...
    'FontSize',10,'callback',@calcularFcn);
uicontrol('style','push','str','Borrar','pos',[120 10 70 22],...
    'FontSize',10,'callback',@borrarFcn);

    function calcularFcn(~,~)
        % Algoritmo de bisección ...
        global XR E n
        cla;
        f=get(df,'str');
        xi=str2double(get(dxi,'str'));
        xs=str2double(get(dxs,'str'));
        e=str2double(get(de,'str'));
        hold on
        ezplot(f,[xi xs]);
        grid;
        ea=100;
        xa=0;
        a=subs(f,'x',xi);
        b=subs(f,'x',xs);
        inics=a*b;
        n=0;
        
        if inics<0
            while ea>e
                n=n+1;
                xr=(xi+xs)/2;
                fxi=subs(f,'x',xi);
                fxr=subs(f,'x',xr);
                ea=abs((xr-xa)/xr)*100;
                comp=fxi*fxr;
                if comp<0
                    xs=xr;
                elseif comp>0
                    xi=xr;
                else
                    break;
                end
                xa=xr;
                XR(n)=xr;
                E(n)=ea;
            end
            plot(xr,0,'ro','MarkerSize',10);
        elseif a==0
            xr=a;
            n=1;
            plot(xr,0,'ro','MarkerSize',10);
        elseif b==0
            xr=b;
            n=1;
            plot(xr,0,'ro','MarkerSize',10);
        else
            xr='';
            warndlg('Elija otro intervalo');
        end
        set(dxr,'str',xr);
        set(dit,'str',n);
    end

    function tabla(~,~)
        % Muestra una tabla con la información correspondiente
        % al error y raíz calculada en cada iteración.
        global XR E n
        fgt=figure('MenuBar','none','NumberTitle','off','Name','Tabla',...
            'position',[400 300 240 240],'resize','off');
        datos=[(1:n)',XR',E'];
        cnames={'Iteración','Raíz','% Error'};
        uitable('Parent',fgt,'Data',datos,'ColumnName',cnames,...
            'Position',[10 10 220 220],'rowname','','FontSize',8,...
            'FontWeight','b','ColumnWidth',{60,70,70});
    end

    function borrarFcn(~,~)
        % Limpia el espacio de trabajo
        cla;
        A=findobj('style','edit');
        set(A,'str','');
        set(dxr,'str','');
        set(dit,'str','');
    end
end