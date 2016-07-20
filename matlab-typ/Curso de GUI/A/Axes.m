function varargout = Axes(varargin)
% AXES MATLAB code for Axes.fig
%      AXES, by itself, creates a new AXES or raises the existing
%      singleton*.
%
%      H = AXES returns the handle to a new AXES or the handle to
%      the existing singleton*.
%
%      AXES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AXES.M with the given input arguments.
%
%      AXES('Property','Value',...) creates a new AXES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Axes_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Axes_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Axes

% Last Modified by GUIDE v2.5 17-Sep-2013 17:42:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Axes_OpeningFcn, ...
                   'gui_OutputFcn',  @Axes_OutputFcn, ...
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


% --- Executes just before Axes is made visible.
function Axes_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Axes (see VARARGIN)

% Choose default command line output for Axes
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Axes wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Axes_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
x=linspace(0,10,100);
axes(handles.axes2);
imshow(imread('imagen.png'));
axes(handles.axes1);
ezsurf('sin(x)+cos(y)');
