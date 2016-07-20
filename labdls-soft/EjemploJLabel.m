function varargout = EjemploJLabel(varargin)
% EJEMPLOJLABEL MATLAB code for EjemploJLabel.fig
%      EJEMPLOJLABEL, by itself, creates a new EJEMPLOJLABEL or raises the existing
%      singleton*.
%
%      H = EJEMPLOJLABEL returns the handle to a new EJEMPLOJLABEL or the handle to
%      the existing singleton*.
%
%      EJEMPLOJLABEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EJEMPLOJLABEL.M with the given input arguments.
%
%      EJEMPLOJLABEL('Property','Value',...) creates a new EJEMPLOJLABEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EjemploJLabel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EjemploJLabel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EjemploJLabel

% Last Modified by GUIDE v2.5 12-Jan-2016 17:15:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EjemploJLabel_OpeningFcn, ...
                   'gui_OutputFcn',  @EjemploJLabel_OutputFcn, ...
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


% --- Executes just before EjemploJLabel is made visible.
function EjemploJLabel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EjemploJLabel (see VARARGIN)

% Choose default command line output for EjemploJLabel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

import java.awt.Color
import javax.swing.ImageIcon

[hJLabel, hMO] = javacomponent({'javax.swing.JLabel'},[10 100 200 30],gcf());
hJLabel.setBackground(Color.RED);
hJLabel.setIcon(ImageIcon('img.png'));
hJLabel.setText('<html>&alpha+&beta = &zeta</html>');


% UIWAIT makes EjemploJLabel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EjemploJLabel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
