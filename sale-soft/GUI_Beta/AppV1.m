function varargout = AppV1(varargin)
% APPV1 MATLAB code for AppV1.fig
%      APPV1, by itself, creates a new APPV1 or raises the existing
%      singleton*.
%
%      H = APPV1 returns the handle to a new APPV1 or the handle to
%      the existing singleton*.
%
%      APPV1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPV1.M with the given input arguments.
%
%      APPV1('Property','Value',...) creates a new APPV1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AppV1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AppV1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AppV1

% Last Modified by GUIDE v2.5 16-Sep-2013 19:28:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AppV1_OpeningFcn, ...
                   'gui_OutputFcn',  @AppV1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before AppV1 is made visible.
function AppV1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AppV1 (see VARARGIN)

% Choose default command line output for AppV1
%% Init cond
% h=msgbox('Bienvenido');
% uiwait(h)
%%
handles.output = hObject;
movegui('center');
% Update handles structure
guidata(hObject, handles);

global vcont
vcont=1;
set(handles.axes1,'Visible','off');
imshow(imread('programdata/info.jpg'));
set(handles.cantidad,'String','1');
% UIWAIT makes AppV1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AppV1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function nombre_Callback(hObject, eventdata, handles)
% hObject    handle to nombre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nombre as text
%        str2double(get(hObject,'String')) returns contents of nombre as a double


% --- Executes during object creation, after setting all properties.
function nombre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nombre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rfc_Callback(hObject, eventdata, handles)
% hObject    handle to rfc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rfc as text
%        str2double(get(hObject,'String')) returns contents of rfc as a double


% --- Executes during object creation, after setting all properties.
function rfc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rfc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function direccion_Callback(hObject, eventdata, handles)
% hObject    handle to direccion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of direccion as text
%        str2double(get(hObject,'String')) returns contents of direccion as a double


% --- Executes during object creation, after setting all properties.
function direccion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to direccion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lugar_Callback(hObject, eventdata, handles)
% hObject    handle to lugar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lugar as text
%        str2double(get(hObject,'String')) returns contents of lugar as a double


% --- Executes during object creation, after setting all properties.
function lugar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lugar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function telefono_Callback(hObject, eventdata, handles)
% hObject    handle to telefono (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of telefono as text
%        str2double(get(hObject,'String')) returns contents of telefono as a double


% --- Executes during object creation, after setting all properties.
function telefono_CreateFcn(hObject, eventdata, handles)
% hObject    handle to telefono (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cp_Callback(hObject, eventdata, handles)
% hObject    handle to cp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cp as text
%        str2double(get(hObject,'String')) returns contents of cp as a double


% --- Executes during object creation, after setting all properties.
function cp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global vdescripcion vcantidad vpuni vimporte answer
ancho=21.6;alto=27.9;
fig = figure('Name','Anotaciones','Numbertitle','off','visible','off','menubar','none',...
    'units','centimeter','position',[0 0 ancho alto],'PaperUnits','centimeters','Papersize'...
    ,[ancho alto],'PaperPosition',[0 0 ancho alto]);

%% Datos del propietario
load('programdata/datosprop.mat');
nombrep=Nombre;
rfcp=RFC;
curpp=CURP;
clearvars Nombre RFC CURP

et_prop=annotation(fig,'textbox','units','centimeter','fontsize',10,'fontweight','bold','Linestyle','none','string','PROP: ','position',[1 alto-3 2.5 1]);
et_rfc=annotation(fig,'textbox','units','centimeter','fontsize',10,'fontweight','bold','Linestyle','none','string','RFC: ','position',[1 alto-4 2.5 1]);
et_curp=annotation(fig,'textbox','units','centimeter','fontsize',10,'fontweight','bold','Linestyle','none','string','CURP: ','position',[12 alto-4 2.5 1]);    

t_prop=annotation(fig,'textbox','units','centimeter','fontsize',10,'Linestyle','none','string',nombrep,'position',[3.3 alto-3 7 1]);
t_rfc=annotation(fig,'textbox','units','centimeter','fontsize',10,'Linestyle','none','string',rfcp,'position',[3.3 alto-4 7 1]);
t_curp=annotation(fig,'textbox','units','centimeter','fontsize',10,'Linestyle','none','string',curpp,'position',[14.8 alto-4 7 1]);

%% Datos del cliente
Fecha=datestr(now);
Nombre_c=get(handles.nombre,'String');
Direc=get(handles.direccion,'String');
RFC_c=get(handles.rfc,'String');
Lugar=get(handles.lugar,'String');
Tel=get(handles.telefono,'String');
CP=get(handles.cp,'String');

et_fechac=annotation(fig,'textbox','units','centimeter','fontsize',10,'fontweight','bold','string','FECHA: ','linestyle','none','position',[1 alto-7 2.5 1]);
et_nombre=annotation(fig,'textbox','units','centimeter','fontsize',10,'fontweight','bold','string','NOMBRE: ','linestyle','none','position',[1 alto-8 2.5 1]);
et_rfcc=annotation(fig,'textbox','units','centimeter','fontsize',10,'fontweight','bold','string','RFC: ','linestyle','none','position',[1 alto-9 2.5 1]);
et_direcc=annotation(fig,'textbox','units','centimeter','fontsize',10,'fontweight','bold','string','DIRECCIÓN: ','linestyle','none','position',[1 alto-10 2.5 1]);
et_lugarc=annotation(fig,'textbox','units','centimeter','fontsize',10,'fontweight','bold','string','LUGAR: ','linestyle','none','position',[1 alto-11 2.5 1]);
et_telc=annotation(fig,'textbox','units','centimeter','fontsize',10,'fontweight','bold','string','TELÉFONO: ','linestyle','none','position',[12 alto-9 2.5 1]);
et_cpc=annotation(fig,'textbox','units','centimeter','fontsize',10,'fontweight','bold','string','CP: ','linestyle','none','position',[12 alto-11 2.5 1]);

t_fechac=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',Fecha,'linestyle','none','position',[3.5 alto-7 7 1]);
t_nombrec=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',Nombre_c,'linestyle','none','position',[3.5 alto-8 15 1]);
t_rfcc=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',RFC_c,'linestyle','none','position',[3.5 alto-9 7 1]);
t_direcc=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',Direc,'linestyle','none','position',[3.5 alto-10 15 1]);
t_lugarc=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',Lugar,'linestyle','none','position',[3.5 alto-11 7 1]);
t_telc=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',Tel,'linestyle','none','position',[14 alto-9 6 1]);
t_cpc=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',CP,'linestyle','none','position',[13.5 alto-11 6 1]);

%% Generar Folio
load('programdata/folio.mat');
str_folio=horzcat('FOLIO:  ',num2str(folio));
fo1=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','FACTURA','backgroundcolor',[0.9 0 0],'position',[17 22 3 0.8]);
fo2=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',str_folio,'backgroundcolor',[0.9 0.9 0.9],'position',[17 21.2 3 0.8]);

%% Venta
veriva=get(handles.iva,'Value');

if veriva==1
    subt=sum(cell2mat(vimporte));
    iva=subt*0.16;
    tot=subt+iva;
else
    subt=sum(cell2mat(vimporte));
    iva=0;
    tot=subt+iva;
end

%% Logo

a_im=axes('Visible','off','units','centimeter','position',[ancho-10 alto-3 7 2.5]);
set(fig,'Currentaxes',a_im);
imshow(imread('programdata/logo.jpg'));


%% Encabezado de tabla
e1=annotation(fig,'textbox','units','centimeter','fontsize',10,'fontweight','bold','string','CANTIDAD','backgroundcolor',[0.9 0.9 0.9],...
    'HorizontalAlignment','center','position',[1 15 2 1]);
e2=annotation(fig,'textbox','units','centimeter','fontsize',10,'fontweight','bold','string','UNIDAD','backgroundcolor',[0.9 0.9 0.9],...
    'HorizontalAlignment','center','position',[3 15 3 1]);
e3=annotation(fig,'textbox','units','centimeter','fontsize',10,'fontweight','bold','string','DESCRIPCIÓN','backgroundcolor',[0.9 0.9 0.9],...
    'HorizontalAlignment','center','position',[6 15 8 1]);
e4=annotation(fig,'textbox','units','centimeter','fontsize',10,'fontweight','bold','string','P. UNITARIO','backgroundcolor',[0.9 0.9 0.9],...
    'HorizontalAlignment','center','position',[14 15 3 1]);
e5=annotation(fig,'textbox','units','centimeter','fontsize',10,'fontweight','bold','string','IMPORTE','backgroundcolor',[0.9 0.9 0.9],...
    'HorizontalAlignment','center','position',[17 15 3 1]);

%% Tabla
c_cantidad=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',vcantidad,'position',[1 5 2 10]);
c_unidad=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','NO APLICA','position',[3 5 3 10]);
c_descrip=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',vdescripcion,'position',[6 5 8 10]);
c_puni=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',cur2str(cell2mat(vpuni)),'position',[14 5 3 10]);
c_importe=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',cur2str(cell2mat(vimporte)),'position',[17 5 3 10]);

%% Abajo
s_subt=annotation(fig,'textbox','units','centimeter','fontsize',9,'fontweight','bold','string','Sub-Total','position',[14 4.5 3 0.5]);
s_iva=annotation(fig,'textbox','units','centimeter','fontsize',9,'fontweight','bold','string','IVA (16%)','position',[14 4 3 0.5]);
s_tot=annotation(fig,'textbox','units','centimeter','fontsize',9,'fontweight','bold','string','Total','position',[14 3.5 3 0.5]);

n_subt=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',cur2str(subt),'position',[17 4.5 3 0.5]);
n_iva=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',cur2str(iva),'position',[17 4 3 0.5]);
n_tot=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',cur2str(tot),'position',[17 3.5 3 0.5]);

%% Total con letras, forma de pago
fp=get(handles.panel_fpago,'SelectedObject');
str_fpago=get(fp,'String');
str_numcta=answer;
pre_letras=num2letras(tot);

s_pletras=annotation(fig,'textbox','units','centimeter','fontsize',10,'HorizontalAlignment','center','string','TOTAL CON LETRAS',...
    'position',[1 5 13 0.5],'backgroundcolor',[0.9 0.9 0.9]);
pletras=annotation(fig,'textbox','units','centimeter','fontsize',8,'HorizontalAlignment','center','string',pre_letras,'position',[1 4.5 13 0.5]);

et_fpago=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','FORMA DE PAGO: ','position',[1 4 5 0.5]);
et_numcta=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','No. CUENTA: ','position',[1 3.5 5 0.5]);

n_fpago=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',str_fpago,'position',[6 4 8 0.5]);
n_numcta=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',str_numcta,'position',[6 3.5 8 0.5]);


%% Guardar historial ventas

fecha_h=datestr(now,'dd-mmm-yyyy');
A={num2str(folio),Nombre_c,cur2str(tot),fecha_h};
fid=fopen('database/hist/hventas.dat','at+');
fprintf(fid,'\n%s//%s//%s//%s',A{:,:});
fclose(fid);

%% to PDF

ffecha=datestr(now,'mmm-yyyy');
carp=strcat('database/facturas/',ffecha);
if isdir(carp)==0
    mkdir(carp);
end
nomb_fact=strcat(carp,'/',num2str(folio),'.pdf');

folio=folio+1;
save('programdata/folio.mat','folio');
print(fig,'-dpdf',nomb_fact);
clearvars -global; 
global vcont;vcont=1;
winopen(nomb_fact);





function descripcion_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function descripcion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to descripcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function cantidad_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function cantidad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cantidad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function punitario_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function punitario_CreateFcn(hObject, eventdata, handles)
% hObject    handle to punitario (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in iva.
function iva_Callback(hObject, eventdata, handles)



% --- Executes on button press in guardardb.
function guardardb_Callback(hObject, eventdata, handles)
db1=get(handles.nombre,'String');
db2=get(handles.direccion,'String');
db3=get(handles.rfc,'String');
db4=get(handles.lugar,'String');
db5=get(handles.telefono,'String');
db6=get(handles.cp,'String');
datos={db1,db2,db3,db4,db5,db6};

arch=strcat('database/clientes/',db1,'.dat');
ID=fopen(arch,'w');
for i=1:6
    fprintf(ID,'%s \n',datos{:,i});
end
fclose(ID);


% --- Executes on button press in buscardb.
function buscardb_Callback(hObject, eventdata, handles)
prompt = {'Nombre del cliente: '};
dlg_title = 'Buscar ...';
num_lines = 1;
def = {''};
answer = inputdlg(prompt,dlg_title,num_lines,def);
if ~isempty(answer)
    a=dir('database/clientes/*.dat');
    long=length(a);
    for n=1:long
        St=cellstr(a(n).name);
        arch=cell2mat(strcat('database/clientes/',St));
        fid=fopen(arch,'r');
        i=1;
        tline = fgetl(fid);
        while ischar(tline)
            A(i,n)={tline};
            tline = fgetl(fid);
            i=i+1;
        end
        fclose(fid);
    end
    datos=A';
    S=strfind(datos(:,1),upper(cell2mat(answer)));
    s=strfind(datos(:,1),lower(cell2mat(answer)));
    if isempty(S)
        k=0;
        for i=1:length(s)
            if ~isempty(s{i,1})
                k=k+1;
                pos(k)=i;
            end
        end
    else
        k=0;
        for i=1:length(S)
            if ~isempty(S{i,1})
                k=k+1;
                pos(k)=i;
            end
        end
    end
    if exist('pos')
        set(handles.seleccionar,'String',datos(pos,1));
    else
        msgbox('No encontrado');
    end
else
    return;
end

% a=dir('database/clientes/*.dat');
% long=length(a);
% for n=1:long
%     St(n)=cellstr(a(n).name);
% end
% set(handles.seleccionar,'String',St);


% --- Executes on selection change in seleccionar.
function seleccionar_Callback(hObject, eventdata, handles)
arr=get(hObject,'String');
nselect=arr(get(hObject,'Value'));
nselect=cell2mat(nselect);
arch=strcat('database/clientes/',nselect,'.dat')
% arch=cell2mat(arch);
ID2=fopen(arch,'r');
i=1;
tline = fgetl(ID2);
while ischar(tline)
    A(i)={tline};
    tline = fgetl(ID2);
    i=i+1;
end
fclose(ID2);
set(handles.nombre,'string',char(A(1)));
set(handles.rfc,'string',char(A(2)));
set(handles.direccion,'string',char(A(3)));
set(handles.lugar,'string',char(A(4)));
set(handles.telefono,'string',char(A(5)));
set(handles.cp,'string',char(A(6)));


% --- Executes during object creation, after setting all properties.
function seleccionar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to seleccionar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in agregar.
function agregar_Callback(hObject, eventdata, handles)
global vdescripcion vcantidad vpuni vimporte vcont
a=get(handles.descripcion,'String');
b=get(handles.cantidad,'String');
c=get(handles.punitario,'String');
imp=str2double(b)*str2double(c);

vdescripcion{1,vcont}=a;
vcantidad{1,vcont}=b;
vpuni{1,vcont}=str2double(c);
vimporte{1,vcont}=imp;
msj=strcat(num2str(vcont),' productos agregados');
msgbox(msj,'PA');
vcont=vcont+1;


% --------------------------------------------------------------------
function configuracionprog_Callback(hObject, eventdata, handles)
% hObject    handle to configuracionprog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function config_datprop_Callback(hObject, eventdata, handles)
run('addpropietario.m');

% --------------------------------------------------------------------
function accion_salir_Callback(hObject, eventdata, handles)
% hObject    handle to accion_salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function acerca_de_Callback(hObject, eventdata, handles)
run('acercade.m');


% --------------------------------------------------------------------
function add_logotipo_Callback(hObject, eventdata, handles)
msgbox({'Por favor seleccione una imagen en formato jpg','','Presione OK para continuar...'});
uiwait;
[filename, pathname] = uigetfile('*.jpg', 'Seleccione una imagen');
if isequal(filename,0)
   return;
else
   logo=fullfile(pathname, filename)
   [p,n,ext]=fileparts(logo);
   dest=strcat('programdata/logo',ext);
   copyfile(logo,dest);
end



% --------------------------------------------------------------------
function archivo_Callback(hObject, eventdata, handles)
% hObject    handle to archivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
selection = questdlg('¿Desea salir?',...
          'Salir',...
          'Sí','No','No'); 
       switch selection 
          case 'Sí',
%             h = waitbar(0,'Cerrando...');
%             steps = 500;
%             for step = 1:steps
%             waitbar(step / steps)
%             end
%             close(h) 
            delete(hObject);
          case 'No'
            return; 
       end


% --------------------------------------------------------------------
function basedatos_Callback(hObject, eventdata, handles)
% hObject    handle to basedatos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ayuda_Callback(hObject, eventdata, handles)
% hObject    handle to ayuda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function abrir_facturas_Callback(hObject, eventdata, handles)
winopen('database/facturas');


% --------------------------------------------------------------------
function agregar_cliente_Callback(hObject, eventdata, handles)
run('addcliente.m');


% --------------------------------------------------------------------
function agregar_prodserv_Callback(hObject, eventdata, handles)
run('addprodserv.m');


% --- Executes on button press in buscar_prodserv.
function buscar_prodserv_Callback(hObject, eventdata, handles)
a=dir('database/prodserv/*.dat');
long=length(a);
for n=1:long
    St(n)=cellstr(a(n).name);
end
set(handles.seleccionar_prodserv,'String',St);


% --- Executes on selection change in seleccionar_prodserv.
function seleccionar_prodserv_Callback(hObject, eventdata, handles)
arr=get(hObject,'String');
nselect=arr(get(hObject,'Value'));
arch=strcat('database/prodserv/',nselect);
arch=cell2mat(arch);
ID3=fopen(arch,'r');
i=1;
tline = fgetl(ID3);
while ischar(tline)
    A(i)={tline};
    tline = fgetl(ID3);
    i=i+1;
end
fclose(ID3);
set(handles.descripcion,'string',char(A(1)));
set(handles.punitario,'string',char(A(2)));



% --- Executes during object creation, after setting all properties.
function seleccionar_prodserv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to seleccionar_prodserv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function ver_historialventas_Callback(hObject, eventdata, handles)
run('verhistv.m');


% --------------------------------------------------------------------
function ver_tablaclientes_Callback(hObject, eventdata, handles)
run('verlistaclientes.m');


% --------------------------------------------------------------------
function asignar_folio_Callback(hObject, eventdata, handles)
prompt = {'Asigne un número de folio '};
dlg_title = 'Asignar folio';
num_lines = 1;
def = {'001'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
if ~isempty(answer)
    folio=str2num(cell2mat(answer));
    save('programdata/folio.mat','folio');
    clearvars folio;
else
    return;
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
winopen('database/facturas');


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
run('addcliente.m');


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
run('addprodserv.m');


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
run('verlistaclientes.m');


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
run('verhistv.m');


% --- Executes on button press in vistaprevia_venta.
function vistaprevia_venta_Callback(hObject, eventdata, handles)
run('vistaprevia.m');


% --- Executes on button press in nueva_venta.
function nueva_venta_Callback(hObject, eventdata, handles)
clearvars global;clear all;
global vcont
vcont=1;


% --- Executes on button press in ver_datos_excel.
function ver_datos_excel_Callback(hObject, eventdata, handles)
run('export2excel.m');


% --- Executes when selected object is changed in panel_fpago.
function panel_fpago_SelectionChangeFcn(hObject, eventdata, handles)
global answer
switch get(hObject,'String')
    case 'EFECTIVO'
    case 'CHEQUE'
        answer = inputdlg('Número de cheque: ','...',1,{'-'});
        answer=cell2mat(answer);
    case 'CRÉDITO'
        answer = inputdlg('Número de cheque: ','...',1,{'-'});
        answer=cell2mat(answer);
    case 'DÉBITO'
        answer = inputdlg('Número de cheque: ','...',1,{'-'});
        answer=cell2mat(answer);
    case 'TRANSFERENCIA BANCARIA'
        answer = inputdlg('Número de cheque: ','...',1,{'-'});
        answer=cell2mat(answer);
end
