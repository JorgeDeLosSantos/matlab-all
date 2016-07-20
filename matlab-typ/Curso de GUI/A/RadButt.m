function varargout = RadButt(varargin)
% RADBUTT MATLAB code for RadButt.fig
%      RADBUTT, by itself, creates a new RADBUTT or raises the existing
%      singleton*.
%
%      H = RADBUTT returns the handle to a new RADBUTT or the handle to
%      the existing singleton*.
%
%      RADBUTT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RADBUTT.M with the given input arguments.
%
%      RADBUTT('Property','Value',...) creates a new RADBUTT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RadButt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RadButt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RadButt

% Last Modified by GUIDE v2.5 19-Sep-2013 09:54:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RadButt_OpeningFcn, ...
                   'gui_OutputFcn',  @RadButt_OutputFcn, ...
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


% --- Executes just before RadButt is made visible.
function RadButt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RadButt (see VARARGIN)

% Choose default command line output for RadButt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RadButt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RadButt_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when selected object is changed in uipanel1.
function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
A=get(hObject,'String');
switch A
    case 'Seno'
        ezplot('sin(x)',[0 10]);
    case 'Coseno'
        ezplot('cos(x)',[0 10]);
    case 'Tangente'
        ezplot('tan(x)',[0 10]);
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
valor=get(hObject,'Value');
if valor==1
    grid on;
else
    grid off;
end


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1
