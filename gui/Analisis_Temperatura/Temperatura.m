function varargout = Temperatura(varargin)
% TEMPERATURA M-file for Temperatura.fig
%      TEMPERATURA, by itself, creates a new TEMPERATURA or raises the existing
%      singleton*.
%
%      H = TEMPERATURA returns the handle to a new TEMPERATURA or the handle to
%      the existing singleton*.
%
%      TEMPERATURA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEMPERATURA.M with the given input arguments.
%
%      TEMPERATURA('Property','Value',...) creates a new TEMPERATURA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Temperatura_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Temperatura_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Temperatura

% Last Modified by GUIDE v2.5 07-Sep-2013 14:02:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Temperatura_OpeningFcn, ...
                   'gui_OutputFcn',  @Temperatura_OutputFcn, ...
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


% --- Executes just before Temperatura is made visible.
function Temperatura_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Temperatura (see VARARGIN)

% Choose default command line output for Temperatura
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
h = waitbar(0,'Leyendo archivos de la aplicación, espere un momento...');
for i=1:1000, % computation here %
waitbar(i/1000);
end
close(h);

a=dir('datos/*.dat');
long=length(a);
for n=1:long
St(n)=cellstr(a(n).name);
end
set(handles.selector,'String',St);
movegui('center');

% UIWAIT makes Temperatura wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Temperatura_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in selector.
function selector_Callback(hObject, eventdata, handles)
% hObject    handle to selector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns selector contents as cell array
%        contents{get(hObject,'Value')} returns selected item from selector


% --- Executes during object creation, after setting all properties.
function selector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to selector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in leer.
function leer_Callback(hObject, eventdata, handles)
global Temperatura Fecha;
arch_datos=get(handles.selector,'String');
val=get(handles.selector,'Value');
sel=arch_datos{val};
archivo=strcat('datos\',sel);
A=importdata(archivo);
Temperatura=A.data;
Fecha=A.textdata;
h = waitbar(0,'Leyendo Datos...');
for i=1:100, % computation here %
waitbar(i/100);
end
close(h);



% --- Executes on button press in graficar.
function graficar_Callback(hObject, eventdata, handles)
global Temperatura Fecha;
S=datenum(Fecha);
plot(S,Temperatura);
legend('Temperaturas 2011');
datetick('x','mmm-yyyy');
ylabel('Temperatura °C');
xlabel('Fecha');
datacursormode on;

tm=mean(Temperatura);
ctm=num2str(tm);
tmed=strcat(ctm,' °C');

for a=1:365
    M(a,:)=strcat(Fecha(a),'  ->  ','  ',num2str(Temperatura(a)),' °C');
end
set(handles.tmedia,'String',tmed);
set(handles.lista,'String',M);


% --- Executes on selection change in lista.
function lista_Callback(hObject, eventdata, handles)
% hObject    handle to lista (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns lista contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista


% --- Executes during object creation, after setting all properties.
function lista_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function acerca_Callback(hObject, eventdata, handles)
msgbox({'Por: Jorge De Los Santos','','E-mail: delossantosmfq@gmail.com'},'Acerca de...');

% --------------------------------------------------------------------
function guardar_Callback(hObject, eventdata, handles)
[filename, pathname] = uiputfile('*.jpg','Guardar gráfica...');
if isequal(filename,0) || isequal(pathname,0)
   return;
else
   axes(handles.axes1);
   G=getframe;
   X=frame2im(G);
   nombre=strcat(pathname,filename);
   imwrite(X,nombre);
end


% --------------------------------------------------------------------
function salir_Callback(hObject, eventdata, handles)
close(gcf);
