function varargout = GUI_5_RadioButton_Group(varargin)
% GUI_5_RADIOBUTTON_GROUP M-file for GUI_5_RadioButton_Group.fig
%      GUI_5_RADIOBUTTON_GROUP, by itself, creates a new GUI_5_RADIOBUTTON_GROUP or raises the existing
%      singleton*.
%
%      H = GUI_5_RADIOBUTTON_GROUP returns the handle to a new GUI_5_RADIOBUTTON_GROUP or the handle to
%      the existing singleton*.
%
%      GUI_5_RADIOBUTTON_GROUP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_5_RADIOBUTTON_GROUP.M with the given input arguments.
%
%      GUI_5_RADIOBUTTON_GROUP('Property','Value',...) creates a new GUI_5_RADIOBUTTON_GROUP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_5_RadioButton_Group_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_5_RadioButton_Group_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_5_RadioButton_Group

% Last Modified by GUIDE v2.5 28-Aug-2013 03:45:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_5_RadioButton_Group_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_5_RadioButton_Group_OutputFcn, ...
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


% --- Executes just before GUI_5_RadioButton_Group is made visible.
function GUI_5_RadioButton_Group_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_5_RadioButton_Group (see VARARGIN)

% Choose default command line output for GUI_5_RadioButton_Group
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_5_RadioButton_Group wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_5_RadioButton_Group_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when selected object is changed in uipanel1.
function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
sel=get(hObject,'Tag');
syms x;
switch sel
    case 'seno'
        y=sin(x);
        ezplot(y,[0 10]);
    case 'coseno'
        y=cos(x);
        ezplot(y,[0 10]);
    case 'tangente'
        y=tan(x);
        ezplot(y,[0 10]);
    case 'cotangente'
        y=cot(x);
        ezplot(y,[0 10]);
    case 'secante'
        y=sec(x);
        ezplot(y,[0 10]);
    case 'cosecante'
        y=csc(x);
        ezplot(y,[0 10]);
end
        
        

