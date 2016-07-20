function varargout = borrar_grafica_3D(varargin)
% BORRAR_GRAFICA_3D MATLAB code for borrar_grafica_3D.fig
%      BORRAR_GRAFICA_3D, by itself, creates a new BORRAR_GRAFICA_3D or raises the existing
%      singleton*.
%
%      H = BORRAR_GRAFICA_3D returns the handle to a new BORRAR_GRAFICA_3D or the handle to
%      the existing singleton*.
%
%      BORRAR_GRAFICA_3D('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BORRAR_GRAFICA_3D.M with the given input arguments.
%
%      BORRAR_GRAFICA_3D('Property','Value',...) creates a new BORRAR_GRAFICA_3D or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before borrar_grafica_3D_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to borrar_grafica_3D_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help borrar_grafica_3D

% Last Modified by GUIDE v2.5 13-Feb-2016 00:24:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @borrar_grafica_3D_OpeningFcn, ...
                   'gui_OutputFcn',  @borrar_grafica_3D_OutputFcn, ...
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


% --- Executes just before borrar_grafica_3D is made visible.
function borrar_grafica_3D_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to borrar_grafica_3D (see VARARGIN)

% Choose default command line output for borrar_grafica_3D
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes borrar_grafica_3D wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = borrar_grafica_3D_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[X,Y] = meshgrid(0:0.1:5);
Z = exp(X).*sin(Y);
surf(X,Y,Z);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
superficie = findobj('type','surface');
delete(superficie);
