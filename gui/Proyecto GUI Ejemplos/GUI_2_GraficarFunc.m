function varargout = GUI_2_GraficarFunc(varargin)
% GUI_2_GRAFICARFUNC M-file for GUI_2_GraficarFunc.fig
%      GUI_2_GRAFICARFUNC, by itself, creates a new GUI_2_GRAFICARFUNC or raises the existing
%      singleton*.
%
%      H = GUI_2_GRAFICARFUNC returns the handle to a new GUI_2_GRAFICARFUNC or the handle to
%      the existing singleton*.
%
%      GUI_2_GRAFICARFUNC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_2_GRAFICARFUNC.M with the given input arguments.
%
%      GUI_2_GRAFICARFUNC('Property','Value',...) creates a new GUI_2_GRAFICARFUNC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_2_GraficarFunc_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_2_GraficarFunc_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_2_GraficarFunc

% Last Modified by GUIDE v2.5 28-Aug-2013 03:11:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_2_GraficarFunc_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_2_GraficarFunc_OutputFcn, ...
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


% --- Executes just before GUI_2_GraficarFunc is made visible.
function GUI_2_GraficarFunc_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_2_GraficarFunc (see VARARGIN)

% Choose default command line output for GUI_2_GraficarFunc
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_2_GraficarFunc wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_2_GraficarFunc_OutputFcn(hObject, eventdata, handles) 
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
axes(handles.axes1);
ezplot(f,[0 10]);



