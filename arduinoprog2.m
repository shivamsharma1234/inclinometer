function varargout = arduinoprog2(varargin)
% ARDUINOPROG2 MATLAB code for arduinoprog2.fig
%      ARDUINOPROG2, by itself, creates a new ARDUINOPROG2 or raises the existing
%      singleton*.
%
%      H = ARDUINOPROG2 returns the handle to a new ARDUINOPROG2 or the handle to
%      the existing singleton*.
%
%      ARDUINOPROG2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARDUINOPROG2.M with the given input arguments.
%
%      ARDUINOPROG2('Property','Value',...) creates a new ARDUINOPROG2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before arduinoprog2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to arduinoprog2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help arduinoprog2

% Last Modified by GUIDE v2.5 13-Feb-2014 23:45:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @arduinoprog2_OpeningFcn, ...
                   'gui_OutputFcn',  @arduinoprog2_OutputFcn, ...
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


% --- Executes just before arduinoprog2 is made visible.
function arduinoprog2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to arduinoprog2 (see VARARGIN)

% Choose default command line output for arduinoprog2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes arduinoprog2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
comPort = input('Enter the com port attached to arduino :    ','s');

delete(instrfind({'Port'},{''}))
%clear a;
%global a;
global s;
s=serial(comPort);
fopen(s);
global pos;

set(handles.edit2,'visible','off');
pos=0;
set(handles.edit2,'visible','on');
set(handles.edit2,'String',[num2str(pos) '  degree']);
%a=arduino('COM8');
%a.pinMode(13,'output');

% --- Outputs from this function are returned to the command line.
function varargout = arduinoprog2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global a;
%a.digitalWrite(13,1);
global pos s ;

set(handles.edit2,'visible','off');

pos=pos+1;

set(handles.edit2,'visible','on');
 set(handles.edit2,'String',[num2str(pos) '  degree']);
fprintf(s,'%s','U');

%fprintf(s,'%s',pos);

%disp(pos);
%fprintf(s,'aaaaaaaaaa');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pos s ;
     %if (pos>0)||(pos==0)
    
      set(handles.edit2,'visible','off');
        pos = pos-1;
       
        set(handles.edit2,'visible','on');
        set(handles.edit2,'String',[num2str(pos) '  degree']);
        fprintf(s,'%s','D');
      
      

        %fprintf(s,'%s',pos);

        %disp(pos);
        %fprintf(s,'bbbbbbbbbbb');
     %end
        
%a.digitalWrite(13,0);



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
%set(handles.edit2,'String',pos);
% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
global pos posAlpha posBeta posGama s;

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editAlpha3_Callback(hObject, eventdata, handles)
% hObject    handle to editAlpha3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAlpha3 as text
%        str2double(get(hObject,'String')) returns contents of editAlpha3 as a double


% --- Executes during object creation, after setting all properties.
function editAlpha3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAlpha3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
global pos posAlpha posBeta posGama s;
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editBeta4_Callback(hObject, eventdata, handles)
% hObject    handle to editBeta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBeta4 as text
%        str2double(get(hObject,'String')) returns contents of editBeta4 as a double


% --- Executes during object creation, after setting all properties.
function editBeta4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBeta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
global pos posAlpha posBeta posGama s;
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonAlpha3.
function pushbuttonAlpha3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonAlpha3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pos posAlpha posBeta posGama s;
     set(handles.editAlpha3,'visible','off');
     set(handles.editAlpha3,'visible','on');
     set(handles.editAlpha3,'String',[num2str(pos) '  degree']);
     posAlpha = pos;
     pos=0;
     set(handles.edit2,'visible','off');
     set(handles.edit2,'visible','on');
     set(handles.edit2,'String',[num2str(pos) '  degree']);
     fprintf(s,'%s','G');

% --- Executes on button press in pushbuttonBeta4.
function pushbuttonBeta4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonBeta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pos posAlpha posBeta posGama s;
     set(handles.editBeta4,'visible','off');
     set(handles.editBeta4,'visible','on');
     set(handles.editBeta4,'String',[num2str(pos) '  degree']);
     posBeta = abs(pos);
     pos=0;
     set(handles.edit2,'visible','off');
     set(handles.edit2,'visible','on');
     set(handles.edit2,'String',[num2str(pos) '  degree']);
     fprintf(s,'%s','G');
     
% --- Executes on button press in pushbuttonGama5.
function pushbuttonGama5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonGama5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pos posAlpha posBeta posGama s;
     set(handles.editGama5,'visible','off');
     
     set(handles.editGama5,'visible','on');
     fprintf(s,'%s','E');
    
     h2 = str2double(fscanf(s)); 
     set(handles.editGama5,'String',[num2str(h2) '  cm']);
     
     base = h2 / tand(posBeta);
     h1 = base * tand(posAlpha);
     fprintf("\nh1=%f h2=%f base%f\n",h1,h2,base);
     posGama = pos;
     set(handles.editDistance7,'visible','off');
     set(handles.editDistance7,'visible','on');
     %set(handles. editDistance7,'String',[num2str(20*(tan(posAlpha)+tan(posBeta))/tan(posGama)) '  cm']);
     
     set(handles. editDistance7,'String',[num2str(h1+h2) '  cm']);
     pos=0;
     set(handles.edit2,'visible','off');
     set(handles.edit2,'visible','on');
     set(handles.edit2,'String',[num2str(pos) '  degree']);
     fprintf(s,'%s','G');

function editGama5_Callback(hObject, eventdata, handles)
% hObject    handle to editGama5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editGama5 as text
%        str2double(get(hObject,'String')) returns contents of editGama5 as a double


% --- Executes during object creation, after setting all properties.
function editGama5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editGama5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
global pos posAlpha posBeta posGama s;
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editDistance7_Callback(hObject, eventdata, handles)
% hObject    handle to editDistance7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editDistance7 as text
%        str2double(get(hObject,'String')) returns contents of editDistance7 as a double


% --- Executes during object creation, after setting all properties.
function editDistance7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editDistance7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
