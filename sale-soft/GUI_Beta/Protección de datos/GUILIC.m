function varargout = GUILIC(varargin)
% GUILIC MATLAB code for GUILIC.fig
%      GUILIC, by itself, creates a new GUILIC or raises the existing
%      singleton*.
%
%      H = GUILIC returns the handle to a new GUILIC or the handle to
%      the existing singleton*.
%
%      GUILIC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUILIC.M with the given input arguments.
%
%      GUILIC('Property','Value',...) creates a new GUILIC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUILIC_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUILIC_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUILIC

% Last Modified by GUIDE v2.5 16-Sep-2013 11:13:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUILIC_OpeningFcn, ...
                   'gui_OutputFcn',  @GUILIC_OutputFcn, ...
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


% --- Executes just before GUILIC is made visible.
function GUILIC_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUILIC (see VARARGIN)

% Choose default command line output for GUILIC
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
load init.mat
if init==1
[filename, pathname] = uigetfile('*.dat', 'Seleccione el archivo de licencia');
    if isequal(filename,0)
       close(gcf);
    else
       lic=fullfile(pathname, filename);
       val=importdata(lic);
       if val~=123
           msgbox('Licencia inválida, por favor solicite una en PC Concepts');
           close(gcf);
           delete(lic);
       else
           init=2;
           save('init.mat','init');
           clearvars('filename','pathname','val','init');
           h=msgbox('Bienvenido... Ahora puede utilizar este programa');
           uiwait(h);
           delete(lic);
       end
    end
end


% UIWAIT makes GUILIC wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUILIC_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
% varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on edit1 and none of its controls.
function edit1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%get(gcf,'CurrentPoint')


% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% eventdata,
% handles,
% hObject