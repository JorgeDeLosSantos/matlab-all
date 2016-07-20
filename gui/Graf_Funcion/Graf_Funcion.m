function varargout = Graf_Funcion(varargin)
% GRAF_FUNCION M-file for Graf_Funcion.fig
%      GRAF_FUNCION, by itself, creates a new GRAF_FUNCION or raises the existing
%      singleton*.
%
%      H = GRAF_FUNCION returns the handle to a new GRAF_FUNCION or the handle to
%      the existing singleton*.
%
%      GRAF_FUNCION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAF_FUNCION.M with the given input arguments.
%
%      GRAF_FUNCION('Property','Value',...) creates a new GRAF_FUNCION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Graf_Funcion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Graf_Funcion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Graf_Funcion

% Last Modified by GUIDE v2.5 19-Aug-2013 23:23:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Graf_Funcion_OpeningFcn, ...
                   'gui_OutputFcn',  @Graf_Funcion_OutputFcn, ...
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


% --- Executes just before Graf_Funcion is made visible.
function Graf_Funcion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Graf_Funcion (see VARARGIN)

% Choose default command line output for Graf_Funcion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Graf_Funcion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Graf_Funcion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function funcion_Callback(hObject, eventdata, handles)
% hObject    handle to funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of funcion as text
%        str2double(get(hObject,'String')) returns contents of funcion as a double


% --- Executes during object creation, after setting all properties.
function funcion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in graficar.
function graficar_Callback(hObject, eventdata, handles)
f=get(handles.funcion,'String');
ezplot(handles.axes1,f,[0 10]);

