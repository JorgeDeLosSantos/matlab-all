function Anotaciones
ancho=21.6;alto=27.9;
fig = figure('Name','Anotaciones','Numbertitle','off','visible','off','toolbar','none',...
    'units','centimeters','position',[0 0 ancho alto],'resize','on');
a=1/ancho;b=1/alto;

Prop='PROP: Giovany Ignacio Martinez';
RFC='RFC: IAMG80120118A';
CURP='CURP: IAMG801201HOCGV08';
Fecha=strcat('FECHA: ',datestr(now));
Nombre='NOMBRE: SA de CV';
Direc='DIRECCIÓN: Calle Bla Bla Bla Bla y Bla';
RFC_C='RFC: RMN001220303003JK1';
Lugar='LUGAR: Oaxaca, Oaxaca';
Tel='TEL: 9661210300';
CP='CP: 22000';
% a_im=axes('Visible','off','units','centimeter','position',[ancho-17 alto-2 5 2]);
% set(fig,'Currentaxes',a_im);
% imshow(imread('logo.jpg'));

%% Datos y Folio

t_prop=annotation(fig,'textbox','units','centimeter','fontsize',10,'Linestyle','none','string',Prop,'position',[0.5 alto-3 7 1]);
t_rfc=annotation(fig,'textbox','units','centimeter','fontsize',10,'Linestyle','none','string',RFC,'position',[0.5 alto-4 7 1]);
t_curp=annotation(fig,'textbox','units','centimeter','fontsize',10,'Linestyle','none','string',CURP,'position',[12 alto-4 7 1]);
f1=annotation(fig,'textbox','fontsize',10,'string','FACTURA','backgroundcolor',[0.9 0 0],'position',[17*a 22*b 3*a 0.8*b]);
f2=annotation(fig,'textbox','fontsize',10,'string','Folio: 001','backgroundcolor',[0.9 0.9 0.9],'position',[17*a 21.2*b 3*a 0.8*b]);

%Cliente
fecha=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',Fecha,'linestyle','none','position',[0.5 alto-7 7 1]);
nombre=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',Nombre,'linestyle','none','position',[0.5 alto-8 7 1]);
rfc=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',RFC_C,'linestyle','none','position',[0.5 alto-9 7 1]);
direc=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',Direc,'linestyle','none','position',[0.5 alto-10 7 1]);
lugar=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',Lugar,'linestyle','none','position',[0.5 alto-11 7 1]);

tel=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',Tel,'linestyle','none','position',[12 alto-9 7 1]);
cp=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',CP,'linestyle','none','position',[12 alto-11 7 1]);


%% Encabezado
e1=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','CANTIDAD','backgroundcolor',[0.9 0.9 0.9],'position',[1 15 3 1]);
e2=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','UNIDAD','backgroundcolor',[0.9 0.9 0.9],'position',[4 15 3 1]);
e3=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','DESCRIPCIÓN','backgroundcolor',[0.9 0.9 0.9],'position',[7 15 7 1]);
e4=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','P. UNITARIO','backgroundcolor',[0.9 0.9 0.9],'position',[14 15 3 1]);
e5=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','IMPORTE','backgroundcolor',[0.9 0.9 0.9],'position',[17 15 2 1]);

% Tab

c1=annotation(fig,'textbox','fontsize',10,'string','','position',[1*a 5*b 3*a 10*b]);
c2=annotation(fig,'textbox','fontsize',10,'string','','position',[4*a 5*b 3*a 10*b]);
c3=annotation(fig,'textbox','fontsize',10,'string','','position',[7*a 5*b 7*a 10*b]);
c4=annotation(fig,'textbox','fontsize',10,'string','','position',[14*a 5*b 3*a 10*b]);
c5=annotation(fig,'textbox','fontsize',10,'string','','position',[17*a 5*b 2*a 10*b]);


%% to PDF


print(fig,'-dpdf','factura.pdf');
open('factura.pdf');
close(h);
end