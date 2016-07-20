function varargout = Revision_SE(varargin)
% REVISION_SE MATLAB code for Revision_SE.fig
%      REVISION_SE, by itself, creates a new REVISION_SE or raises the existing
%      singleton*.
%
%      H = REVISION_SE returns the handle to a new REVISION_SE or the handle to
%      the existing singleton*.
%
%      REVISION_SE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REVISION_SE.M with the given input arguments.
%
%      REVISION_SE('Property','Value',...) creates a new REVISION_SE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Revision_SE_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Revision_SE_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Revision_SE

% Last Modified by GUIDE v2.5 22-Feb-2016 20:52:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Revision_SE_OpeningFcn, ...
                   'gui_OutputFcn',  @Revision_SE_OutputFcn, ...
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


% --- Executes just before Revision_SE is made visible.
function Revision_SE_OpeningFcn(hObject, eventdata, handles, varargin)
scrsz=get(0,'ScreenSize');
pos_act=get(gcf,'posi');
xr=scrsz (3)-pos_act(3);
xp=round(xr/2);
yr=scrsz(4)-pos_act(4);
yp=round(yr/2);
set(gcf,'position',[xp yp pos_act(3) pos_act(4)]);

% a=imread('Logo.png');
% imshow(a)

% axes(handles.axes1)
% a=imread('Logo.png');
% image(a)
% axis off

% a=imread('guardar.png');
% set(handles.pushbutton1,'CData',a)
set(handles.pushbutton1,'Enable','on')
set(handles.pushbutton1,'TooltipString',sprintf('Guardar'))
 
% a=imread('atras.png');
% set(handles.pushbutton2,'CData',a)
set(handles.pushbutton2,'Enable','on')
 set(handles.pushbutton2,'TooltipString',sprintf('Atrás'))
 
% a=imread('agregar.png');
% set(handles.pushbutton3,'CData',a)
set(handles.pushbutton3,'Enable','on')
 set(handles.pushbutton3,'TooltipString',sprintf('Agregar'))
 
% a=imread('eliminarr.png');
% set(handles.pushbutton4,'CData',a)
set(handles.pushbutton4,'Enable','off')
 set(handles.pushbutton4,'TooltipString',sprintf('Eliminar'))

% a=imread('interrogacion2.png');
% set(handles.pushbutton5,'CData',a)
set(handles.pushbutton5,'Enable','on')
 set(handles.pushbutton5,'TooltipString',sprintf('Ayuda'))
 
% a=imread('continuar.png');
% set(handles.pushbutton6,'CData',a)
set(handles.pushbutton6,'Enable','on')
 set(handles.pushbutton6,'TooltipString',sprintf('Continuar'))
 
% a=imread('cancelar.png');
% set(handles.pushbutton7,'CData',a)
set(handles.pushbutton7,'Enable','on')
 set(handles.pushbutton7,'TooltipString',sprintf('Cancelar'))
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Revision_SE (see VARARGIN)

% Choose default command line output for Revision_SE
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

noma=6; % Número de mantenimientos por defecto

% --------------------------- Configuración de la información para la tabla

% load Vehiculos_SE
% datos=listavehiculose(:,1:2); % Configura las dos primeras columnas de la tabla
% nove=length(listavehiculose); % Número de vehículos

load Revision_servicio_ejecutivo

ma2=mantenimiento(:,3:end); % Tipo Cell
ma2(find(cell2mat(ma2)==0))={367}; % Reemplaza los ceros por 367
mantenimiento(:,3:end)=ma2;

if noma ~= ma2
    noma = size(ma2, 2);
end

% load fecha
% b=fechan(:,1);

% datos(:,3:noma+2)=b(cell2mat(mantenimiento(:,3:end)));

% load pico_y_placa
% c=picoyp(:,1);
% c(end+1)=fechan(end,1);


% ----------------------------------------------- Configuración de la tabla

columnas={'VEHÍCULO NO.'  'NÚMERO INTERNO'}; % Nombre de las columnas de la tabla en función del número de mantenimientos
% for ii=1:noma
%   columnas{ii+2}=char(strcat({'MANTENIMIENTO'},{' '},{num2str(ii)})); 
% end
% 
% anchocolumnas={90 120}; % Ancho de las columnas
% for ii=3:noma+2
%    anchocolumnas{ii}=[150];
% end
% 
formato={'numeric' 'numeric'}; % Formato de las columnas
% for ii=3:noma+2
%   formato{ii}=b';
% end

set(handles.uitable1,'ColumnName',columnas) % Seleccionar los nombres de columna en la tabla
set(handles.uitable1,'ColumnEditable',true(1,noma+2))
% set(handles.uitable1,'Data',datos,'ColumnWidth',anchocolumnas)
set(handles.uitable1,'ColumnFormat',formato)


% UIWAIT makes Revision_SE wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Revision_SE_OutputFcn(hObject, eventdata, handles) 

% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% GUARDAR DATOS
mantenimiento=get(handles.uitable1,'Data');
load fecha
b=fechan(:,1);
b2=fechan(:,2);
for ii=1:size(mantenimiento,1)
    for jj=3:size(mantenimiento,2)
        mantenimiento(ii,jj)=b2(find(strcmp(b,mantenimiento(ii,jj))));
    end
end
save('Revision_servicio_ejecutivo','mantenimiento')



msgbox('¡Datos guardados exitosamente!','Listo')
registro(mfilename,3,9)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
close(gcf)
Disponibilidad_vehiculos_recorridos
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% AGREGAR COLUMNA
datos=get(handles.uitable1,'Data');
columnas=get(handles.uitable1,'ColumnName');
ancho=length(columnas);
noma=ancho-1; % Número de mantenimientos aumentados en 1
if noma>6
    set(handles.pushbutton4,'Enable','on')
else
    set(handles.pushbutton4,'Enable','off')
end
columnas{noma+2}=char(strcat({'MANTENIMIENTO'},{' '},{num2str(noma)}));
set(handles.uitable1,'ColumnName',columnas) % Seleccionar los nombres de columna en la tabla
set(handles.uitable1,'ColumnEditable',true(1,noma+2))
for ii=1:length(datos)
    datos{ii,noma+2}='N/A';
end
anchocolumnas={90 120};
for ii=3:noma+2
    anchocolumnas{ii}=[150];
end
load fecha % Carga fechan
load pico_y_placa % Carga picoyp anno bis
c=picoyp(:,1);
c(end+1)=fechan(end,1);
formato={'numeric' 'numeric'};
for ii=3:noma+2
    formato{ii}=c';
end
set(handles.uitable1,'Data',datos,'ColumnWidth',anchocolumnas)
set(handles.uitable1,'ColumnFormat',formato)
registro(mfilename,1,6)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% ELIMINAR COLUMNA - MÍNIMO DE 6
datos=get(handles.uitable1,'Data');
columnas=get(handles.uitable1,'ColumnName');
ancho=length(columnas); % Número de columnas actuales
anchocolumnas=get(handles.uitable1,'ColumnWidth');
formato=get(handles.uitable1,'ColumnFormat');

if ancho>8
    set(handles.pushbutton4,'Enable','on')
    columnas(end)=[];
    datos(:,end)=[];
    anchocolumnas(end)=[];
    formato(end)=[];
else
    set(handles.pushbutton4,'Enable','off')
end

set(handles.uitable1,'ColumnName',columnas)
set(handles.uitable1,'Data',datos,'ColumnWidth',anchocolumnas)
set(handles.uitable1,'ColumnFormat',formato)
registro(mfilename,2,6)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
msgbox('Por favor ingrese las fechas de las revisiones preventivas para cada vehículo.' ,' MENSAJE ');

% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
close(gcf)
vehiculos_disponibles_grupo
msgbox('Paso 16: Por favor seleccione la fecha de programación y recuerde guardar los cambios realizados' ,' MENSAJE ');

% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
close(gcf)
aplicacion
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
