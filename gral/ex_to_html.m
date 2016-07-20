function varargout = ex_to_html(varargin)
% EX_TO_HTML MATLAB code for ex_to_html.fig
%      EX_TO_HTML, by itself, creates a new EX_TO_HTML or raises the existing
%      singleton*.
%
%      H = EX_TO_HTML returns the handle to a new EX_TO_HTML or the handle to
%      the existing singleton*.
%
%      EX_TO_HTML('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EX_TO_HTML.M with the given input arguments.
%
%      EX_TO_HTML('Property','Value',...) creates a new EX_TO_HTML or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ex_to_html_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ex_to_html_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ex_to_html

% Last Modified by GUIDE v2.5 12-Nov-2015 21:31:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ex_to_html_OpeningFcn, ...
                   'gui_OutputFcn',  @ex_to_html_OutputFcn, ...
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


% --- Executes just before ex_to_html is made visible.
function ex_to_html_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ex_to_html (see VARARGIN)

% Choose default command line output for ex_to_html
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ex_to_html wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ex_to_html_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
table2html(handles.uitable1,'Ejemplo.html');
