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

% Last Modified by GUIDE v2.5 08-Sep-2013 06:18:29

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
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global vcont
vcont=1;
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
global vdescripcion vcantidad vpuni vimporte
ancho=21.6;alto=27.9;
fig = figure('Name','Anotaciones','Numbertitle','off','visible','off','menubar','none',...
    'units','centimeter','position',[0 0 ancho alto],'PaperUnits','centimeters','PaperSize',[ancho alto],'PaperPosition',[0 0 ancho alto]);

sp='  ';
Prop='PROP: Giovany Ignacio Martinez';
RFC='RFC: IAMG80120118A';
CURP='CURP: IAMG801201HOCGV08';
Fecha=horzcat('FECHA: ',sp,datestr(now));
Nombre=horzcat('NOMBRE: ',sp,get(handles.nombre,'String'));
Direc=horzcat('DIRECCIÓN: ',sp,get(handles.direccion,'String'));
RFC_C=horzcat('RFC: ',sp,get(handles.rfc,'String'));
Lugar=horzcat('LUGAR: ',sp,get(handles.lugar,'String'));
Tel=horzcat('TELÉFONO: ',sp,get(handles.telefono,'String'));
CP=horzcat('C.P.: ',sp,get(handles.cp,'String'));

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

a_im=axes('Visible','off','units','centimeter','position',[ancho-17 alto-2 7 3]);
set(fig,'Currentaxes',a_im);
imshow(imread('logo.jpg'));

%% Datos y Folio

t_prop=annotation(fig,'textbox','units','centimeter','fontsize',10,'Linestyle','none','string',Prop,'position',[0.5 alto-3 7 1]);
t_rfc=annotation(fig,'textbox','units','centimeter','fontsize',10,'Linestyle','none','string',RFC,'position',[0.5 alto-4 7 1]);
t_curp=annotation(fig,'textbox','units','centimeter','fontsize',10,'Linestyle','none','string',CURP,'position',[12 alto-4 7 1]);
f1=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','FACTURA','backgroundcolor',[0.9 0 0],'position',[17 22 3 0.8]);
f2=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','Folio: 001','backgroundcolor',[0.9 0.9 0.9],'position',[17 21.2 3 0.8]);

%Cliente
fecha=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',Fecha,'linestyle','none','position',[0.5 alto-7 7 1]);
nombre=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',Nombre,'linestyle','none','position',[0.5 alto-8 7 1]);
rfc=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',RFC_C,'linestyle','none','position',[0.5 alto-9 7 1]);
direc=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',Direc,'linestyle','none','position',[0.5 alto-10 7 1]);
lugar=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',Lugar,'linestyle','none','position',[0.5 alto-11 7 1]);

tel=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',Tel,'linestyle','none','position',[12 alto-9 7 1]);
cp=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',CP,'linestyle','none','position',[12 alto-11 7 1]);


%% Encabezado
e1=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','CANTIDAD','backgroundcolor',[0.9 0.9 0.9],'position',[1 15 2 1]);
e2=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','UNIDAD','backgroundcolor',[0.9 0.9 0.9],'position',[3 15 3 1]);
e3=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','DESCRIPCIÓN','backgroundcolor',[0.9 0.9 0.9],'position',[6 15 8 1]);
e4=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','P. UNITARIO','backgroundcolor',[0.9 0.9 0.9],'position',[14 15 3 1]);
e5=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','IMPORTE','backgroundcolor',[0.9 0.9 0.9],'position',[17 15 3 1]);

%% Tab
c_cantidad=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',vcantidad,'position',[1 5 2 10]);
c_unidad=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','NO APLICA','position',[3 5 3 10]);
c_descrip=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',vdescripcion,'position',[6 5 8 10]);
c_puni=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',vpuni,'position',[14 5 3 10]);
c_importe=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',vimporte,'position',[17 5 3 10]);

%% Abajo
s_subt=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','Sub-Total','position',[14 4.5 3 0.5]);
s_iva=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','IVA (16%)','position',[14 4 3 0.5]);
s_tot=annotation(fig,'textbox','units','centimeter','fontsize',10,'string','Total','position',[14 3.5 3 0.5]);

n_subt=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',num2str(subt),'position',[17 4.5 3 0.5]);
n_iva=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',num2str(iva),'position',[17 4 3 0.5]);
n_tot=annotation(fig,'textbox','units','centimeter','fontsize',10,'string',num2str(tot),'position',[17 3.5 3 0.5]);



%% to PDF


print(fig,'-dpdf','factura.pdf');
clearvars -global; 
global vcont;vcont=1;
open('factura.pdf');





function descripcion_Callback(hObject, eventdata, handles)
% hObject    handle to descripcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of descripcion as text
%        str2double(get(hObject,'String')) returns contents of descripcion as a double


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
% hObject    handle to cantidad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cantidad as text
%        str2double(get(hObject,'String')) returns contents of cantidad as a double


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
% hObject    handle to punitario (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of punitario as text
%        str2double(get(hObject,'String')) returns contents of punitario as a double


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
% hObject    handle to iva (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of iva


% --- Executes on button press in guardardb.
function guardardb_Callback(hObject, eventdata, handles)
db1=get(handles.nombre,'String');
db2=get(handles.direccion,'String');
db3=get(handles.rfc,'String');
db4=get(handles.lugar,'String');
db5=get(handles.telefono,'String');
db6=get(handles.cp,'String');
datos={db1,db2,db3,db4,db5,db6};

arch=strcat('database/',db1,'.dat');
ID=fopen(arch,'w');
for i=1:6
    fprintf(ID,'%s \n',datos{:,i});
end
fclose(ID);


% --- Executes on button press in buscardb.
function buscardb_Callback(hObject, eventdata, handles)
global dbnombre dbrfc dbdireccion dblugar dbtelefono dbcp
[A,B]=xlsread('database.xlsx','Clientes','A:F');
B(1,:)=[];
dbnombre=B(:,1);
dbrfc=B(:,2);
dbdireccion=B(:,3);
dblugar=B(:,4);
dbtelefono=B(:,5);
dbcp=B(:,6);
clearvars B;
set(handles.seleccionar,'String',cellstr(dbnombre));

% a=dir('database/*.dat');
% long=length(a);
% for n=1:long
%     St(n)=cellstr(a(n).name);
% end
% set(handles.seleccionar,'String',St);


% --- Executes on selection change in seleccionar.
function seleccionar_Callback(hObject, eventdata, handles)
global dbnombre dbrfc dbdireccion dblugar dbtelefono dbcp
n=get(hObject,'Value');
A={dbnombre(n),dbrfc(n),dbdireccion(n),dblugar(n),dbtelefono(n),dbcp(n)};
set(handles.nombre,'string',char(A{1}));
set(handles.rfc,'string',char(A{2}));
set(handles.direccion,'string',char(A{3}));
set(handles.lugar,'string',char(A{4}));
set(handles.telefono,'string',char(A{5}));
set(handles.cp,'string',char(A{6}));


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
vpuni{1,vcont}=c;
vimporte{1,vcont}=imp;
%whos vdescripcion vcantidad
vcont=vcont+1;
