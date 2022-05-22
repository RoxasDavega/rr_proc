function varargout = cpu(varargin)
% CPU MATLAB code for cpu.fig
%      CPU, by itself, creates a new CPU or raises the existing
%      singleton*.
%
%      H = CPU returns the handle to a new CPU or the handle to
%      the existing singleton*.
%
%      CPU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CPU.M with the given input arguments.
%
%      CPU('Property','Value',...) creates a new CPU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cpu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cpu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cpu

% Last Modified by GUIDE v2.5 22-May-2022 00:02:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cpu_OpeningFcn, ...
                   'gui_OutputFcn',  @cpu_OutputFcn, ...
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


% --- Executes just before cpu is made visible.
function cpu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cpu (see VARARGIN)

% Choose default command line output for cpu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cpu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cpu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in harga1.
function harga1_Callback(hObject, eventdata, handles)
% hObject    handle to harga1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of harga1


% --- Executes on button press in harga2.
function harga2_Callback(hObject, eventdata, handles)
% hObject    handle to harga2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of harga2


% --- Executes on button press in harga3.
function harga3_Callback(hObject, eventdata, handles)
% hObject    handle to harga3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of harga3


% --- Executes on button press in rekomendasi.
function rekomendasi_Callback(hObject, eventdata, handles)
global w1 w2 w3 w4 w5 w6;
% hObject    handle to rekomendasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch get(get(handles.uibuttongroup1,'SelectedObject'),'Tag')
  case 'harga1',  w1 = 1;
  case 'harga2',  w1 = 3;
  case 'harga3',  w1 = 5;
end
switch get(get(handles.uibuttongroup5,'SelectedObject'),'Tag')
  case 'cpubenchmark1',  w2 = 1;
  case 'cpubenchmark2',  w2 = 3;
  case 'cpubenchmark3',  w2 = 5;
end
switch get(get(handles.uibuttongroup6,'SelectedObject'),'Tag')
  case 'cpuvalue1',  w3 = 1;
  case 'cpuvalue2',  w3 = 3;
  case 'cpuvalue3',  w3 = 5;
end
switch get(get(handles.uibuttongroup7,'SelectedObject'),'Tag')
  case 'threadmark1',  w4 = 1;
  case 'threadmark2',  w4 = 3;
  case 'threadmark3',  w4 = 5;
end
switch get(get(handles.uibuttongroup8,'SelectedObject'),'Tag')
  case 'threadvalue1',  w5 = 1;
  case 'threadvalue2',  w5 = 3;
  case 'threadvalue3',  w5 = 5;
end
switch get(get(handles.uibuttongroup9,'SelectedObject'),'Tag')
  case 'tdp1',  w6 = 1;
  case 'tdp2',  w6 = 3;
  case 'tdp3',  w6 = 5;
end

result = wp_cpu(w1,w2,w3,w4,w5,w6);
disp(w1)
disp(w2)
disp(w3)
disp(w4)
disp(w5)
disp(w6)

set(handles.bestchoice, 'String', result.CPUname(1));
set(handles.uitablehasil, 'Data', table2cell(result));
set(handles.uitablehasil, 'ColumnName', result.Properties.VariableNames);


% --- Executes on button press in readdata.
function readdata_Callback(hObject, eventdata, handles)
% hObject    handle to readdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uitabledata_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitabledata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
dataset = get_dataset();
datasetCell = table2cell(dataset);
set(hObject, 'Data', datasetCell);
set(hObject, 'ColumnName', dataset.Properties.VariableNames);


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on key press with focus on radiobutton2 and none of its controls.
function radiobutton2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in uitabledata.
function uitabledata_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitabledata (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uibuttongroup1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
global w1;
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes when selected object is changed in uibuttongroup5.
function uibuttongroup5_SelectionChangedFcn(hObject, eventdata, handles)
global w2;
% hObject    handle to the selected object in uibuttongroup5 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in uibuttongroup6.
function uibuttongroup6_SelectionChangedFcn(hObject, eventdata, handles)
global w3;
% hObject    handle to the selected object in uibuttongroup6 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes when selected object is changed in uibuttongroup7.
function uibuttongroup7_SelectionChangedFcn(hObject, eventdata, handles)
global w4;
% hObject    handle to the selected object in uibuttongroup7 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in uibuttongroup8.
function uibuttongroup8_SelectionChangedFcn(hObject, eventdata, handles)
global w5;
% hObject    handle to the selected object in uibuttongroup8 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes when selected object is changed in uibuttongroup9.
function uibuttongroup9_SelectionChangedFcn(hObject, eventdata, handles)
global w6;
% hObject    handle to the selected object in uibuttongroup9 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uibuttongroup5_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global w2;

% --------------------------------------------------------------------
function uibuttongroup1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global w1;


% --- Executes when uibuttongroup1 is resized.
function uibuttongroup1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
