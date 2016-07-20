function varargout = GUI_4_CheckBoxRejilla(varargin)
% GUI_4_CHECKBOXREJILLA M-file for GUI_4_CheckBoxRejilla.fig
%      GUI_4_CHECKBOXREJILLA, by itself, creates a new GUI_4_CHECKBOXREJILLA or raises the existing
%      singleton*.
%
%      H = GUI_4_CHECKBOXREJILLA returns the handle to a new GUI_4_CHECKBOXREJILLA or the handle to
%      the existing singleton*.
%
%      GUI_4_CHECKBOXREJILLA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_4_CHECKBOXREJILLA.M with the given input arguments.
%
%      GUI_4_CHECKBOXREJILLA('Property','Value',...) creates a new GUI_4_CHECKBOXREJILLA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_4_CheckBoxRejilla_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_4_CheckBoxRejilla_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_4_CheckBoxRejilla

% Last Modified by GUIDE v2.5 28-Aug-2013 03:32:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_4_CheckBoxRejilla_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_4_CheckBoxRejilla_OutputFcn, ...
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


% --- Executes just before GUI_4_CheckBoxRejilla is made visible.
function GUI_4_CheckBoxRejilla_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_4_CheckBoxRejilla (see VARARGIN)

% Choose default command line output for GUI_4_CheckBoxRejilla
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_4_CheckBoxRejilla wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_4_CheckBoxRejilla_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in graficar.
function graficar_Callback(hObject, eventdata, handles)
x=linspace(0,10,100);
axes(handles.axes1);
y=x.*sin(3.*x);
plot(x,y,'*r');


% --- Executes on button press in rejilla.
function rejilla_Callback(hObject, eventdata, handles)
rej=get(hObject,'Value');
if rej==1
    grid on;
else
    grid off;
end


