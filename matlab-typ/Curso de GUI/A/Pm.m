function varargout = Pm(varargin)
% PM MATLAB code for Pm.fig
%      PM, by itself, creates a new PM or raises the existing
%      singleton*.
%
%      H = PM returns the handle to a new PM or the handle to
%      the existing singleton*.
%
%      PM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PM.M with the given input arguments.
%
%      PM('Property','Value',...) creates a new PM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Pm_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Pm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Pm

% Last Modified by GUIDE v2.5 18-Sep-2013 20:58:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Pm_OpeningFcn, ...
                   'gui_OutputFcn',  @Pm_OutputFcn, ...
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


% --- Executes just before Pm is made visible.
function Pm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Pm (see VARARGIN)

% Choose default command line output for Pm
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Pm wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Pm_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
contenido=get(hObject,'String');
a=get(hObject,'Value');
color=contenido(a);
switch cell2mat(color)
    case 'Rojo'
        c=[1 0 0];
    case 'Azul'
        c=[0 0 1];
    case 'Verde'
        c=[0 1 0];
end
set(handles.text1,'Backgroundcolor',c);


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


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
contenido=get(hObject,'String');
a=get(hObject,'Value');
oper=contenido(a);
n1=5;
n2=10;
switch cell2mat(oper)
    case 'Suma'
        res=n1+n2;
    case 'Resta'
        res=n1-n2;
    case 'División'
        res=n1/n2;
    case 'Multiplicación'
        res=n1*n2;
end
set(handles.text1,'String',res);


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
