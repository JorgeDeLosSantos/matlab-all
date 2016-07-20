function varargout = imagen_run_m(varargin)
% IMAGEN_RUN_M MATLAB code for imagen_run_m.fig
%      IMAGEN_RUN_M, by itself, creates a new IMAGEN_RUN_M or raises the existing
%      singleton*.
%
%      H = IMAGEN_RUN_M returns the handle to a new IMAGEN_RUN_M or the handle to
%      the existing singleton*.
%
%      IMAGEN_RUN_M('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGEN_RUN_M.M with the given input arguments.
%
%      IMAGEN_RUN_M('Property','Value',...) creates a new IMAGEN_RUN_M or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imagen_run_m_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imagen_run_m_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imagen_run_m

% Last Modified by GUIDE v2.5 13-Feb-2016 00:36:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imagen_run_m_OpeningFcn, ...
                   'gui_OutputFcn',  @imagen_run_m_OutputFcn, ...
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


% --- Executes just before imagen_run_m is made visible.
function imagen_run_m_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imagen_run_m (see VARARGIN)

% Choose default command line output for imagen_run_m
handles.output = hObject;

img = imread('C:/Users/User/Pictures/matlab_logo.png');
imshow(img);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imagen_run_m wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = imagen_run_m_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
run('borrar_grafica_3D');