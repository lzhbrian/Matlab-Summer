function varargout = music_syn_gui(varargin)
% MUSIC_SYN_GUI MATLAB code for music_syn_gui.fig
%      MUSIC_SYN_GUI, by itself, creates a new MUSIC_SYN_GUI or raises the existing
%      singleton*.
%
%      H = MUSIC_SYN_GUI returns the handle to a new MUSIC_SYN_GUI or the handle to
%      the existing singleton*.
%
%      MUSIC_SYN_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MUSIC_SYN_GUI.M with the given input arguments.
%
%      MUSIC_SYN_GUI('Property','Value',...) creates a new MUSIC_SYN_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before music_syn_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to music_syn_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help music_syn_gui

% Last Modified by GUIDE v2.5 23-Jul-2016 12:47:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @music_syn_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @music_syn_gui_OutputFcn, ...
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


% --- Executes just before music_syn_gui is made visible.
function music_syn_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to music_syn_gui (see VARARGIN)


set(handles.listbox1, 'string', {'guitar', 'violin', 'piano'});



% Choose default command line output for music_syn_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes music_syn_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = music_syn_gui_OutputFcn(hObject, eventdata, handles) 
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



tones = str2num(get(handles.edit1,'string'));
len = str2num(get(handles.edit2,'string'));

playmusic(tones, len);





% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% return an array of volume strength
function volume_array = generate_volume_for3(len_divide_speed,sample_rate)
    unit = sample_rate * len_divide_speed;
    x1 = linspace(0,len_divide_speed/6,unit/18);
    x2 = linspace(0,len_divide_speed/6,unit/36);
    x3 = linspace(1,1,unit/9);
    x4 = linspace(0,len_divide_speed/3,unit-length([x1,x2,x3]));
    volume_array = [6/len_divide_speed*x1, 1-1.2/len_divide_speed*x2,...
        0.8*x3, 0.8*exp(-(100-90*len_divide_speed)*x4)];
    % plot(volume_array);



function playmusic(tones, len)
    load guitar.mat
    
    speed = 2;
    sample_rate = 8000;
    len = len / speed;
    
    % Volume
    volume_array =[];
    for i=1:length(len)
       volume_array = [volume_array, generate_volume_for3(len(i),sample_rate)];
    end
    
    %      F(1), G(2), A(3),  B-(4),  C(5),   D(6),   E(7)
    f = [349.23, 392,  440,  466.16, 523.25, 587.33, 659.25];
    tone = f(tones);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Generate Harmonic Sin Signal
    
    y = [];
    for i = 1:length(tone)
        t = linspace(0,len(i),len(i)*sample_rate);
        
        [val, index] = min( abs(tone(i) - base) );
        
        y = [y, [1, two_standard(index), three_standard(index), four_standard(index)] * ...
            [sin(2*pi*tone(i)*t); sin(2*pi*2*tone(i)*t);...
            sin(2*pi*3*tone(i)*t); sin(2*pi*4*tone(i)*t)]];
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % y suppressed by volume
    y = y .* volume_array;
    
    % Make sound
    sound(y, sample_rate);
