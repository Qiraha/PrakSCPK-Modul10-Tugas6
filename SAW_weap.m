function varargout = SAW_weap(varargin)
% SAW_WEAP MATLAB code for SAW_weap.fig
%      SAW_WEAP, by itself, creates a new SAW_WEAP or raises the existing
%      singleton*.
%
%      H = SAW_WEAP returns the handle to a new SAW_WEAP or the handle to
%      the existing singleton*.
%
%      SAW_WEAP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SAW_WEAP.M with the given input arguments.
%
%      SAW_WEAP('Property','Value',...) creates a new SAW_WEAP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SAW_weap_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SAW_weap_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SAW_weap

% Last Modified by GUIDE v2.5 23-Jun-2021 13:59:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SAW_weap_OpeningFcn, ...
                   'gui_OutputFcn',  @SAW_weap_OutputFcn, ...
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


% --- Executes just before SAW_weap is made visible.
function SAW_weap_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SAW_weap (see VARARGIN)

% Choose default command line output for SAW_weap
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SAW_weap wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SAW_weap_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file='weap_data.xlsx';
A=xlsread(file,'Sheet1','A:G');
set(handles.uitable1,'data', A);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file='weap_data.xlsx';
x=xlsread(file,'Sheet1','A:G');
k=[1,1,1,1,1,1,1];
w=[0.20,0.175,0.15,0.15,0.05,0.15,0.125];

[m n]=size (x);
R=zeros (m,n);
Y=zeros (m,n);
for j=1:n,
 if k(j)==1, %statement untuk kriteria dengan atribut keuntungan
  R(:,j)=x(:,j)./max(x(:,j));
 else
  R(:,j)=min(x(:,j))./x(:,j);
 end;
end;

for i=1:m,
 V(i)= sum(w.*R(i,:))
end;
result1=V;
result = num2str(result1);
set(handles.result1,'string', (result));
