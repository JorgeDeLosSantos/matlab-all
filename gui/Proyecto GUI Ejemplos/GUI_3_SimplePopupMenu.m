function varargout = GUI_3_SimplePopupMenu(varargin)
% GUI_3_SIMPLEPOPUPMENU M-file for GUI_3_SimplePopupMenu.fig
%      GUI_3_SIMPLEPOPUPMENU, by itself, creates a new GUI_3_SIMPLEPOPUPMENU or raises the existing
%      singleton*.
%
%      H = GUI_3_SIMPLEPOPUPMENU returns the handle to a new GUI_3_SIMPLEPOPUPMENU or the handle to
%      the existing singleton*.
%
%      GUI_3_SIMPLEPOPUPMENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_3_SIMPLEPOPUPMENU.M with the given input arguments.
%
%      GUI_3_SIMPLEPOPUPMENU('Property','Value',...) creates a new GUI_3_SIMPLEPOPUPMENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_3_SimplePopupMenu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_3_SimplePopupMenu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_3_SimplePopupMenu

% Last Modified by GUIDE v2.5 28-Aug-2013 03:20:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_3_SimplePopupMenu_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_3_SimplePopupMenu_OutputFcn, ...
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


% --- Executes just before GUI_3_SimplePopupMenu is made visible.
function GUI_3_SimplePopupMenu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_3_SimplePopupMenu (see VARARGIN)

% Choose default command line output for GUI_3_SimplePopupMenu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
datos={'Perro','Gato','Vaca','Caballo','Lobo','Tigre'};
set(handles.selector,'String',datos);


% UIWAIT makes GUI_3_SimplePopupMenu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_3_SimplePopupMenu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in selector.
function selector_Callback(hObject, eventdata, handles)
contenido=get(hObject,'String');
animal_selec=contenido(get(hObject,'value'));
set(handles.text1,'String',animal_selec);



% --- Executes during object creation, after setting all properties.
function selector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to selector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


