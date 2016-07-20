function varargout = GUI_8_Tabla(varargin)
% GUI_8_TABLA M-file for GUI_8_Tabla.fig
%      GUI_8_TABLA, by itself, creates a new GUI_8_TABLA or raises the existing
%      singleton*.
%
%      H = GUI_8_TABLA returns the handle to a new GUI_8_TABLA or the handle to
%      the existing singleton*.
%
%      GUI_8_TABLA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_8_TABLA.M with the given input arguments.
%
%      GUI_8_TABLA('Property','Value',...) creates a new GUI_8_TABLA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_8_Tabla_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_8_Tabla_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_8_Tabla

% Last Modified by GUIDE v2.5 28-Aug-2013 19:01:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_8_Tabla_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_8_Tabla_OutputFcn, ...
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


% --- Executes just before GUI_8_Tabla is made visible.
function GUI_8_Tabla_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_8_Tabla (see VARARGIN)

% Choose default command line output for GUI_8_Tabla
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_8_Tabla wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_8_Tabla_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when entered data in editable cell(s) in tabla.
function tabla_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to tabla (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in mostrar.
function mostrar_Callback(hObject, eventdata, handles)
n_filas=randi([1,3],1,1);
n_columnas=randi([1,3],1,1);
datos=randi([0,9],n_filas,n_columnas);
set(handles.tabla,'Data',datos);
