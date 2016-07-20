function varargout = Leer_Texto(varargin)
% LEER_TEXTO M-file for Leer_Texto.fig
%      LEER_TEXTO, by itself, creates a new LEER_TEXTO or raises the existing
%      singleton*.
%
%      H = LEER_TEXTO returns the handle to a new LEER_TEXTO or the handle to
%      the existing singleton*.
%
%      LEER_TEXTO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LEER_TEXTO.M with the given input arguments.
%
%      LEER_TEXTO('Property','Value',...) creates a new LEER_TEXTO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Leer_Texto_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Leer_Texto_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Leer_Texto

% Last Modified by GUIDE v2.5 19-Aug-2013 23:56:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Leer_Texto_OpeningFcn, ...
                   'gui_OutputFcn',  @Leer_Texto_OutputFcn, ...
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


% --- Executes just before Leer_Texto is made visible.
function Leer_Texto_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Leer_Texto (see VARARGIN)

% Choose default command line output for Leer_Texto
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Leer_Texto wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Leer_Texto_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in leer.
function leer_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile({'*.txt';'*.dat'}, 'Abrir archivo de texto');
if isequal(filename,0)
   return;
else
   archivo= fullfile(pathname, filename);
end

Dat = fopen(archivo,'r');
n=1;
while ~feof(Dat) 
   leer_linea = fgetl(Dat);
   if isempty(leer_linea) | ~ischar(leer_linea), break, end
   C(n)= cellstr(leer_linea);
   n=n+1;
end
fclose(Dat);
C=C';
set(handles.texto,'String',C);


