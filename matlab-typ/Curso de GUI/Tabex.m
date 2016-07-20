function varargout = Tabex(varargin)
% TABEX MATLAB code for Tabex.fig
%      TABEX, by itself, creates a new TABEX or raises the existing
%      singleton*.
%
%      H = TABEX returns the handle to a new TABEX or the handle to
%      the existing singleton*.
%
%      TABEX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TABEX.M with the given input arguments.
%
%      TABEX('Property','Value',...) creates a new TABEX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Tabex_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Tabex_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Tabex

% Last Modified by GUIDE v2.5 20-Sep-2013 13:40:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Tabex_OpeningFcn, ...
                   'gui_OutputFcn',  @Tabex_OutputFcn, ...
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


% --- Executes just before Tabex is made visible.
function Tabex_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Tabex (see VARARGIN)

% Choose default command line output for Tabex
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
D=[1 2;3 4];
set(handles.uitable1,'data',D);

% UIWAIT makes Tabex wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Tabex_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when selected cell(s) is changed in uitable1.
function uitable1_CellSelectionCallback(hObject, eventdata, handles)
A=eventdata.Indices;
C=get(hObject,'data');
S=C(A(1),A(2));
set(handles.text1,'String',S);
