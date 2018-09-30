function varargout = tonegeneration(varargin)
% TONEGENERATION MATLAB code for tonegeneration.fig
%      TONEGENERATION, by itself, creates a new TONEGENERATION or raises the existing
%      singleton*.
%
%      H = TONEGENERATION returns the handle to a new TONEGENERATION or the handle to
%      the existing singleton*.
%
%      TONEGENERATION('CALLBACK',hObject,eventData,h,...) calls the local
%      function named CALLBACK in TONEGENERATION.M with the given input arguments.
%
%      TONEGENERATION('Property','Value',...) creates a new TONEGENERATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tonegeneration_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tonegeneration_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tonegeneration

% Last Modified by GUIDE v2.5 31-May-2014 13:03:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tonegeneration_OpeningFcn, ...
                   'gui_OutputFcn',  @tonegeneration_OutputFcn, ...
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


% --- Executes just before tonegeneration is made visible.
function tonegeneration_OpeningFcn(hObject, eventdata, h, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
% varargin   command line arguments to tonegeneration (see VARARGIN)

% Choose default command line output for tonegeneration
h.output = hObject;

% Update h structure
guidata(hObject, h);

% UIWAIT makes tonegeneration wait for user response (see UIRESUME)
% uiwait(h.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tonegeneration_OutputFcn(hObject, eventdata, h) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)

% Get default command line output from h structure
varargout{1} = h.output;



function Frequency_Callback(hObject, eventdata, h)
% hObject    handle to Frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function Frequency_CreateFcn(hObject, eventdata, h)
% hObject    handle to Frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    empty - h not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, h)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)


%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, h)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    empty - h not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function ampslider_Callback(hObject, eventdata, h)
% hObject    handle to ampslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)

maxval=get(h.ampslider,'Value');
strmax=num2str(maxval);
set(h.Amplitude,'String',strmax);


% --- Executes during object creation, after setting all properties.
function ampslider_CreateFcn(hObject, eventdata, h)
% hObject    handle to ampslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    empty - h not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in choosewave.
function choosewave_Callback(hObject, eventdata, h)
% hObject    handle to choosewave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
h.index=get(hObject,'Value');
guidata(hObject,h)
% Hints: contents = cellstr(get(hObject,'String')) returns choosewave contents as cell array
%        contents{get(hObject,'Value')} returns selected item from choosewave


% --- Executes during object creation, after setting all properties.
function choosewave_CreateFcn(hObject, eventdata, h)
% hObject    handle to choosewave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    empty - h not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in generatetone.
function generatetone_Callback(hObject, eventdata, h)
% hObject    handle to generatetone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
Fs = 100000;      % Samples per second
toneFreqString = get(h.Frequency,'String');  
toneFreq=str2num(toneFreqString); % Tone frequency, in Hertz
nSeconds = 2;   % Duration of the sound
switch h.index
    case 1
y = sin(linspace(0, nSeconds*toneFreq*2*pi, round(nSeconds*Fs)));
sound(y, Fs);  % Play sound at sampling rate Fs
axes(h.graph)
ampString=get(h.Amplitude,'String');
amp=str2num(ampString);
x=linspace(0,2*pi);
y1=amp*sin(2*pi*toneFreq*x);
plot(x,y1);
axis([0 2*pi -1 1])
    case 2
        y = square(linspace(0, nSeconds*toneFreq*2*pi, round(nSeconds*Fs)));
sound(y, Fs);  % Play sound at sampling rate Fs
axes(h.graph)
ampString=get(h.Amplitude,'String');
amp=str2num(ampString);
x=linspace(0,2*pi);
y1=amp*square(2*pi*toneFreq*x);
plot(x,y1);
axis([0 2*pi -1 1])
    case 3
        y = sawtooth(linspace(0, nSeconds*toneFreq*2*pi, round(nSeconds*Fs)));
sound(y, Fs);  % Play sound at sampling rate Fs
axes(h.graph)
ampString=get(h.Amplitude,'String');
amp=str2num(ampString);
x=linspace(0,2*pi);
y1=amp*sawtooth(2*pi*toneFreq*x);
plot(x,y1);
axis([0 2*pi -1 1])
end
guidata(hObject,h)


function Frequency_Callback(hObject, eventdata, h)
% hObject    handle to Frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Frequency as text
%        str2double(get(hObject,'String')) returns contents of Frequency as a double


% --- Executes during object creation, after setting all properties.
function Frequency_CreateFcn(hObject, eventdata, h)
% hObject    handle to Frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    empty - h not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function ampslider_Callback(hObject, eventdata, h)
% hObject    handle to ampslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function ampslider_CreateFcn(hObject, eventdata, h)
% hObject    handle to ampslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    empty - h not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in choosewave.
function choosewave_Callback(hObject, eventdata, h)
% hObject    handle to choosewave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)

h.str = get(hObject,'String') %returns choosewave contents as cell array
guidata(hObject,h)

% --- Executes during object creation, after setting all properties.
function choosewave_CreateFcn(hObject, eventdata, h)
% hObject    handle to choosewave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    empty - h not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in generatetone.
function generatetone_Callback(hObject, eventdata, h)
% hObject    handle to generatetone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chopping_OpeningFcn, ...
                   'gui_OutputFcn',  @chopping_OutputFcn, ...
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


% --- Executes just before chopping is made visible.
function chopping_OpeningFcn(hObject, eventdata, h, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
% varargin   command line arguments to chopping (see VARARGIN)

% Choose default command line output for chopping
h.output = hObject;

% Update h structure
guidata(hObject, h);

% UIWAIT makes chopping wait for user response (see UIRESUME)
% uiwait(h.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = chopping_OutputFcn(hObject, eventdata, h) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)

% Get default command line output from h structure
varargout{1} = h.output;


% --- Executes on slider movement.
function startslider_Callback(hObject, eventdata, h)
% hObject    handle to startslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
startTime=get(hObject,'Value');
startTimeLabel=num2str(startTime);
set(h.start,'String',startTimeLabel);
guidata(hObject,h)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function startslider_CreateFcn(hObject, eventdata, h)
% hObject    handle to startslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    empty - h not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function stopslider_Callback(hObject, eventdata, h)
% hObject    handle to stopslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
stopTime=get(hObject,'Value');
stopTimeLabel=num2str(stopTime);
set(h.stop,'String',stopTimeLabel);
guidata(hObject,h)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function stopslider_CreateFcn(hObject, eventdata, h)
% hObject    handle to startslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    empty - h not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Apply.
function Apply_Callback(hObject, eventdata, h)
% hObject    handle to Apply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
numSec=length(h.New)/h.fsNew;
startIndex=startTime*numSec;
stopIndex=stopTime*numSec;
x=length(h.New);
disp(x)
h.NewNew=h.New(startIndex:stopIndex,:);
y=length(h.NewNew);
disp(y)
guidata(hObject,h)


function varargout = effectsDeux(varargin)
% EFFECTSDEUX MATLAB code for effectsDeux.fig
%      EFFECTSDEUX, by itself, creates a new EFFECTSDEUX or raises the existing
%      singleton*.
%
%      H = EFFECTSDEUX returns the handle to a new EFFECTSDEUX or the handle to
%      the existing singleton*.
%
%      EFFECTSDEUX('CALLBACK',hObject,eventData,h,...) calls the local
%      function named CALLBACK in EFFECTSDEUX.M with the given input arguments.
%
%      EFFECTSDEUX('Property','Value',...) creates a new EFFECTSDEUX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before effectsDeux_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to effectsDeux_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help effectsDeux

% Last Modified by GUIDE v2.5 31-May-2014 11:57:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                  'gui_Singleton',  gui_Singleton, ...
                  'gui_OpeningFcn', @effectsDeux_OpeningFcn, ...
                  'gui_OutputFcn',  @effectsDeux_OutputFcn, ...
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


% --- Executes just before effectsDeux is made visible.
function effectsDeux_OpeningFcn(hObject, eventdata, h, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
% varargin   command line arguments to effectsDeux (see VARARGIN)

% Choose default command line output for effectsDeux
h.output = hObject;

% Update h structure
guidata(hObject, h);

% UIWAIT makes effectsDeux wait for user response (see UIRESUME)
% uiwait(h.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = effectsDeux_OutputFcn(hObject, eventdata, h) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)

% Get default command line output from h structure
varargout{1} = h.output;


% --- Executes on button press in Reverse.
function checkbox1_Callback(hObject, eventdata, h)
% hObject    handle to Reverse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
% % global spValRev
% % spValRev=get(hObject,'Value');
h.spValRev=get(hObject,'Value');
guidata(hObject,h)
% Hint: get(hObject,'Value') returns toggle state of Reverse


% --- Executes on button press in Delay.
function checkbox2_Callback(hObject, eventdata, h)
% hObject    handle to Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
% % global spValDel
% % spValDel=get(hObject,'Value');
h.spValDel=get(hObject,'Value');
guidata(hObject,h)
% Hint: get(hObject,'Value') returns toggle state of Filter


% --- Executes on button press in Filter Highs.
function checkbox3_Callback(hObject, eventdata, h)
% hObject    handle to Delay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
% % global spValFil
% % spValFil=get(hObject,'Value');
h.spValFil=get(hObject,'Value');
guidata(hObject,h)
% Hint: get(hObject,'Value') returns toggle state of Delay


% --- Executes on button press in Remove.
function checkbox4_Callback(hObject, eventdata, h)
% hObject    handle to Remove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
% % global spValVoi
% % spValVoi=get(hObject,'Value');
h.spValVoi=get(hObject,'Value');
guidata(hObject,h)
% Hint: get(hObject,'Value') returns toggle state of Remove



function edit1_Callback(hObject, eventdata, h)
% hObject    handle to Speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
% global speedVal
% speedVal=str2double(get(hObject,'String'));
h.speedVal=str2double(get(hObject,'String'));
guidata(hObject,h)
% Hints: get(hObject,'String') returns contents of Speed as text
%        str2double(get(hObject,'String')) returns contents of Speed as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, h)
% hObject    handle to Speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    empty - h not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
   set(hObject,'BackgroundColor','white');
end


function varargout = Proj2(varargin)
% PROJ2 MATLAB code for Proj2.fig
%      PROJ2, by itself, creates a new PROJ2 or raises the existing
%      singleton*.
%
%      H = PROJ2 returns the handle to a new PROJ2 or the handle to
%      the existing singleton*.
%
%      PROJ2('CALLBACK',hObject,eventData,h,...) calls the local
%      function named CALLBACK in PROJ2.M with the given input arguments.
%
%      PROJ2('Property','Value',...) creates a new PROJ2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Proj2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Proj2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Proj2

% Last Modified by GUIDE v2.5 30-May-2014 04:02:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Proj2_OpeningFcn, ...
                   'gui_OutputFcn',  @Proj2_OutputFcn, ...
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


% --- Executes just before Proj2 is made visible.
function Proj2_OpeningFcn(hObject, eventdata, h, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
% varargin   command line arguments to Proj2 (see VARARGIN)

% Choose default command line output for Proj2
h.output = hObject;

% Update h structure
guidata(hObject, h);

% UIWAIT makes Proj2 wait for user response (see UIRESUME)
% uiwait(h.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Proj2_OutputFcn(hObject, eventdata, h) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)

% Get default command line output from h structure
varargout{1} = h.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
% start the playback
% % global spValRev
% % global spValDel
% % global spValFil
% % global spValVoi
% % global speedVal
z=size(h.x1);
if z([2])~=2
    fprintf('This audio sample has only 1 channel (only Reverse and change speed are allowed).\n')
    h.New=h.x1x1;
else
    if h.spValRev==1
        h.x1x1=flipud(h.x1);
    else
        h.x1x1=h.x1;
    end
    if h.spValDel==1
        h.x1x2=h.x1x1;
        N=10000;
        for n=N+1:length(h.x1x1)
             h.x1x2(n,1)=h.x1x1(n,1)+h.x1x1(n-N,2);
             h.x1x2(n,1)=h.x1x1(n,2)+h.x1x1(n-N,1);
        end
    else
        h.x1x2=h.x1x1;
    end
    if h.spValFil==1
        h.x1x3=h.x1x2;
        for n=2:length(h.x1x2)
            h.x1x3(n,1)=.8*h.x1x3(n-1,1)+h.x1x2(n,1);
            h.x1x3(n,2)=.8*h.x1x3(n-1,2)+h.x1x2(n,2);
        end
    else
        h.x1x3=h.x1x2;
    end
    if h.spValVoi==1
        left=h.x1x3(:,1);
        right=h.x1x3(:,2);
        h.New=left-right;
    else
        h.New=h.x1x3;
    end
    if h.speedVal>=0.1 & h.speedVal<=2
        h.fsNew=h.fs1*speedVal;
    else
        h.fsNew=h.fs1;
    end
end
h.player1 = audioplayer(h.NewNew,h.fsNew);
play(h.player1);
h.player = 1;
guidata(hObject,h);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
global spValRev
global spValDel
global spValFil
global spValVoi
global speedVal
z=size(h.x2);
if spValRev==1
   h.x1x1=flipud(h.x2);
else
   h.x1x1=h.x2;
end
if z([2])~=2
    fprintf('This audio sample has only 1 channel (only Reverse and change speed are allowed).\n')
    h.New=h.x1x1;
else
    if spValDel==1
        h.x1x2=h.x1x1;
        N=10000;
        for n=N+1:length(h.x1x1)
             h.x1x2(n,1)=h.x1x1(n,1)+h.x1x1(n-N,2);
             h.x1x2(n,1)=h.x1x1(n,2)+h.x1x1(n-N,1);
        end
    elseif spValDel==0
        h.x1x2=h.x1x1;
    end
    if spValFil==1
        h.x1x3=h.x1x2;
        for n=2:length(h.x1x2)
            h.x1x3(n,1)=.8*h.x1x3(n-1,1)+h.x1x2(n,1);
            h.x1x3(n,2)=.8*h.x1x3(n-1,2)+h.x1x2(n,2);
        end
    else
        h.x1x3=h.x1x2;
    end
    if spValVoi==1
        left=h.x1x3(:,1);
        right=h.x1x3(:,2);
        h.New=left-right;
    else
        h.New=h.x1x3;
    end
    if speedVal>=0.1 & speedVal<=2
        h.fsNew=h.fs2*speedVal;
    else
        h.fsNew=h.fs2;
    end
end
h.player2 = audioplayer(h.New,h.fsNew);
play(h.player2);
h.player = 2;
guidata(hObject,h);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
global spValRev
global spValDel
global spValFil
global spValVoi
global speedVal
z=size(h.x3);
if spValRev==1
   h.x1x1=flipud(h.x3);
else
   h.x1x1=h.x3;
end
if z([2])~=2
    fprintf('This audio sample has only 1 channel (only Reverse and change speed are allowed).\n')
    h.New=h.x1x1;
else
    if spValDel==1
        h.x1x2=h.x1x1;
        N=10000;
        for n=N+1:length(h.x1x1)
             h.x1x2(n,1)=h.x1x1(n,1)+h.x1x1(n-N,2);
             h.x1x2(n,1)=h.x1x1(n,2)+h.x1x1(n-N,1);
        end
    elseif spValDel==0
        h.x1x2=h.x1x1;
    end
    if spValFil==1
        h.x1x3=h.x1x2;
        for n=2:length(h.x1x2)
            h.x1x3(n,1)=.8*h.x1x3(n-1,1)+h.x1x2(n,1);
            h.x1x3(n,2)=.8*h.x1x3(n-1,2)+h.x1x2(n,2);
        end
    else
        h.x1x3=h.x1x2;
    end
    if spValVoi==1
        left=h.x1x3(:,1);
        right=h.x1x3(:,2);
        h.New=left-right;
    else
        h.New=h.x1x3;
    end
    if speedVal>=0.1 & speedVal<=2
        h.fsNew=h.fs3*speedVal;
    else
        h.fsNew=h.fs3;
    end
end
h.player3 = audioplayer(h.New,h.fsNew);
play(h.player3);
h.player = 3;
guidata(hObject,h);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
global spValRev
global spValDel
global spValFil
global spValVoi
global speedVal
z=size(h.x4);
if spValRev==1
   h.x1x1=flipud(h.x4);
else
   h.x1x1=h.x4;
end
if z([2])~=2
    fprintf('This audio sample has only 1 channel (only Reverse and change speed are allowed).\n')
    h.New=h.x1x1;
else
    if spValDel==1
        h.x1x2=h.x1x1;
        N=10000;
        for n=N+1:length(h.x1x1)
             h.x1x2(n,1)=h.x1x1(n,1)+h.x1x1(n-N,2);
             h.x1x2(n,1)=h.x1x1(n,2)+h.x1x1(n-N,1);
        end
    elseif spValDel==0
        h.x1x2=h.x1x1;
    end
    if spValFil==1
        h.x1x3=h.x1x2;
        for n=2:length(h.x1x2)
            h.x1x3(n,1)=.8*h.x1x3(n-1,1)+h.x1x2(n,1);
            h.x1x3(n,2)=.8*h.x1x3(n-1,2)+h.x1x2(n,2);
        end
    else
        h.x1x3=h.x1x2;
    end
    if spValVoi==1
        left=h.x1x3(:,1);
        right=h.x1x3(:,2);
        h.New=left-right;
    else
        h.New=h.x1x3;
    end
    if speedVal>=0.1 & speedVal<=2
        h.fsNew=h.fs4*speedVal;
    else
        h.fsNew=h.fs4;
    end
end
h.player4 = audioplayer(h.New,h.fsNew);
play(h.player4);
h.player = 4;
guidata(hObject,h);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
global spValRev
global spValDel
global spValFil
global spValVoi
global speedVal
z=size(h.x5);
if spValRev==1
   h.x1x1=flipud(h.x5);
else
   h.x1x1=h.x5;
end
if z([2])~=2
    fprintf('This audio sample has only 1 channel (only Reverse and change speed are allowed).\n')
    h.New=h.x1x1;
else
    if spValDel==1
        h.x1x2=h.x1x1;
        N=10000;
        for n=N+1:length(h.x1x1)
             h.x1x2(n,1)=h.x1x1(n,1)+h.x1x1(n-N,2);
             h.x1x2(n,1)=h.x1x1(n,2)+h.x1x1(n-N,1);
        end
    elseif spValDel==0
        h.x1x2=h.x1x1;
    end
    if spValFil==1
        h.x1x3=h.x1x2;
        for n=2:length(h.x1x2)
            h.x1x3(n,1)=.8*h.x1x3(n-1,1)+h.x1x2(n,1);
            h.x1x3(n,2)=.8*h.x1x3(n-1,2)+h.x1x2(n,2);
        end
    else
        h.x1x3=h.x1x2;
    end
    if spValVoi==1
        left=h.x1x3(:,1);
        right=h.x1x3(:,2);
        h.New=left-right;
    else
        h.New=h.x1x3;
    end
    if speedVal>=0.1 & speedVal<=2
        h.fsNew=h.fs5*speedVal;
    else
        h.fsNew=h.fs5;
    end
end
h.player5 = audioplayer(h.New,h.fsNew);
play(h.player5);
h.player = 5;
guidata(hObject,h);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
global spValRev
global spValDel
global spValFil
global spValVoi
global speedVal
z=size(h.x6);
if spValRev==1
   h.x1x1=flipud(h.x6);
else
   h.x1x1=h.x6;
end
if z([2])~=2
    fprintf('This audio sample has only 1 channel (only Reverse and change speed are allowed).\n')
    h.New=h.x1x1;
else
    if spValDel==1
        h.x1x2=h.x1x1;
        N=10000;
        for n=N+1:length(h.x1x1)
             h.x1x2(n,1)=h.x1x1(n,1)+h.x1x1(n-N,2);
             h.x1x2(n,1)=h.x1x1(n,2)+h.x1x1(n-N,1);
        end
    elseif spValDel==0
        h.x1x2=h.x1x1;
    end
    if spValFil==1
        h.x1x3=h.x1x2;
        for n=2:length(h.x1x2)
            h.x1x3(n,1)=.8*h.x1x3(n-1,1)+h.x1x2(n,1);
            h.x1x3(n,2)=.8*h.x1x3(n-1,2)+h.x1x2(n,2);
        end
    else
        h.x1x3=h.x1x2;
    end
    if spValVoi==1
        left=h.x1x3(:,1);
        right=h.x1x3(:,2);
        h.New=left-right;
    else
        h.New=h.x1x3;
    end
    if speedVal>=0.1 & speedVal<=2
        h.fsNew=h.fs6*speedVal;
    else
        h.fsNew=h.fs6;
    end
end
h.player6 = audioplayer(h.New,h.fsNew);
play(h.player6);
h.player = 6;
guidata(hObject,h);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
global spValRev
global spValDel
global spValFil
global spValVoi
global speedVal
z=size(h.x7);
if spValRev==1
   h.x1x1=flipud(h.x7);
else
   h.x1x1=h.x7;
end
if z([2])~=2
    fprintf('This audio sample has only 1 channel (only Reverse and change speed are allowed).\n')
    h.New=h.x1x1;
else
    if spValDel==1
        h.x1x2=h.x1x1;
        N=10000;
        for n=N+1:length(h.x1x1)
             h.x1x2(n,1)=h.x1x1(n,1)+h.x1x1(n-N,2);
             h.x1x2(n,1)=h.x1x1(n,2)+h.x1x1(n-N,1);
        end
    elseif spValDel==0
        h.x1x2=h.x1x1;
    end
    if spValFil==1
        h.x1x3=h.x1x2;
        for n=2:length(h.x1x2)
            h.x1x3(n,1)=.8*h.x1x3(n-1,1)+h.x1x2(n,1);
            h.x1x3(n,2)=.8*h.x1x3(n-1,2)+h.x1x2(n,2);
        end
    else
        h.x1x3=h.x1x2;
    end
    if spValVoi==1
        left=h.x1x3(:,1);
        right=h.x1x3(:,2);
        h.New=left-right;
    else
        h.New=h.x1x3;
    end
    if speedVal>=0.1 & speedVal<=2
        h.fsNew=h.fs7*speedVal;
    else
        h.fsNew=h.fs7;
    end
end
h.player7 = audioplayer(h.New,h.fsNew);
play(h.player7);
h.player = 7;
guidata(hObject,h);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
global spValRev
global spValDel
global spValFil
global spValVoi
global speedVal
z=size(h.x8);
if spValRev==1
   h.x1x1=flipud(h.x8);
else
   h.x1x1=h.x8;
end
if z([2])~=2
    fprintf('This audio sample has only 1 channel (only Reverse and change speed are allowed).\n')
    h.New=h.x1x1;
else
    if spValDel==1
        h.x1x2=h.x1x1;
        N=10000;
        for n=N+1:length(h.x1x1)
             h.x1x2(n,1)=h.x1x1(n,1)+h.x1x1(n-N,2);
             h.x1x2(n,1)=h.x1x1(n,2)+h.x1x1(n-N,1);
        end
    elseif spValDel==0
        h.x1x2=h.x1x1;
    end
    if spValFil==1
        h.x1x3=h.x1x2;
        for n=2:length(h.x1x2)
            h.x1x3(n,1)=.8*h.x1x3(n-1,1)+h.x1x2(n,1);
            h.x1x3(n,2)=.8*h.x1x3(n-1,2)+h.x1x2(n,2);
        end
    else
        h.x1x3=h.x1x2;
    end
    if spValVoi==1
        left=h.x1x3(:,1);
        right=h.x1x3(:,2);
        h.New=left-right;
    else
        h.New=h.x1x3;
    end
    if speedVal>=0.1 & speedVal<=2
        h.fsNew=h.fs8*speedVal;
    else
        h.fsNew=h.fs8;
    end
end
h.player8 = audioplayer(h.New,h.fsNew);
play(h.player8);
h.player = 8;
guidata(hObject,h);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
global spValRev
global spValDel
global spValFil
global spValVoi
global speedVal
z=size(h.x9);
if spValRev==1
   h.x1x1=flipud(h.x9);
else
   h.x1x1=h.x9;
end
if z([2])~=2
    fprintf('This audio sample has only 1 channel (only Reverse and change speed are allowed).\n')
    h.New=h.x1x1;
else
    if spValDel==1
        h.x1x2=h.x1x1;
        N=10000;
        for n=N+1:length(h.x1x1)
             h.x1x2(n,1)=h.x1x1(n,1)+h.x1x1(n-N,2);
             h.x1x2(n,1)=h.x1x1(n,2)+h.x1x1(n-N,1);
        end
    elseif spValDel==0
        h.x1x2=h.x1x1;
    end
    if spValFil==1
        h.x1x3=h.x1x2;
        for n=2:length(h.x1x2)
            h.x1x3(n,1)=.8*h.x1x3(n-1,1)+h.x1x2(n,1);
            h.x1x3(n,2)=.8*h.x1x3(n-1,2)+h.x1x2(n,2);
        end
    else
        h.x1x3=h.x1x2;
    end
    if spValVoi==1
        left=h.x1x3(:,1);
        right=h.x1x3(:,2);
        h.New=left-right;
    else
        h.New=h.x1x3;
    end
    if speedVal>=0.1 & speedVal<=2
        h.fsNew=h.fs9*speedVal;
    else
        h.fsNew=h.fs9;
    end
end
h.player9 = audioplayer(h.New,h.fsNew);
play(h.player9);
h.player = 9;
guidata(hObject,h);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
[FileName1,FilePath1] = uigetfile('*.wav','Select Audio Sample File');
[h.x1,h.fs1] = audioread([FilePath1 '/' FileName1]);
guidata(hObject,h);

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
[FileName2,FilePath2] = uigetfile('*.wav','Select Audio Sample File');
[h.x2,h.fs2] = audioread([FilePath2 '/' FileName2]);
guidata(hObject,h);

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
[FileName3,FilePath3] = uigetfile('*.wav','Select Audio Sample File');
[h.x3,h.fs3] = audioread([FilePath3 '/' FileName3]);
guidata(hObject,h);

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
[FileName4,FilePath4] = uigetfile('*.wav','Select Audio Sample File');
[h.x4,h.fs4] = audioread([FilePath4 '/' FileName4]);
guidata(hObject,h);

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
[FileName5,FilePath5] = uigetfile('*.wav','Select Audio Sample File');
[h.x5,h.fs5] = audioread([FilePath5 '/' FileName5]);
guidata(hObject,h);

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
[FileName6,FilePath6] = uigetfile('*.wav','Select Audio Sample File');
[h.x6,h.fs6] = audioread([FilePath6 '/' FileName6]);
guidata(hObject,h);

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
[FileName7,FilePath7] = uigetfile('*.wav','Select Audio Sample File');
[h.x7,h.fs7] = audioread([FilePath7 '/' FileName7]);
guidata(hObject,h);

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
[FileName8,FilePath8] = uigetfile('*.wav','Select Audio Sample File');
[h.x8,h.fs8] = audioread([FilePath8 '/' FileName8]);
guidata(hObject,h);

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
[FileName9,FilePath9] = uigetfile('*.wav','Select Audio Sample File');
[h.x9,h.fs9] = audioread([FilePath9 '/' FileName9]);
guidata(hObject,h);


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
switch(h.player)
    case 1
    pause(h.player1); 
    case 2
    pause(h.player2);
    case 3
    pause(h.player3);
    case 4
    pause(h.player4);
    case 5
    pause(h.player5);
    case 6
    pause(h.player6);
    case 7
    pause(h.player7);
    case 8
    pause(h.player8);
    case 9
    pause(h.player9);
end

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
switch(h.player & h.a)
    case h.player == 1,  h.a = 1
    left = h.x1(:,1); 
    soundsc(left,h.fs1);
    case 2
    resume(h.player2);
    case 3
    resume(h.player3);
    case 4
    resume(h.player4);
    case 5
    resume(h.player5);
    case 6
    resume(h.player6);
    case 7
    resume(h.player7);
    case 8
    resume(h.player8);
    case 9
    resume(h.player9);
end


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
switch(h.player)
    case 1
    stop(h.player1); 
    case 2
    stop(h.player2);
    case 3
    stop(h.player3);
    case 4
    stop(h.player4);
    case 5
    stop(h.player5);
    case 6
    stop(h.player6);
    case 7
    stop(h.player7);
    case 8
    stop(h.player8);
    case 9
    stop(h.player9);
end

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, h)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton1
h.a = get(hObject,'Value')
if h.a == 1 && h.player == 1 
    left = h.x1(:,1);
    pause(h.player1)
end


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, h)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, h)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3

function varargout = Proj2Part2(varargin)
% PROJ2PART2 MATLAB code for Proj2Part2.fig
%      PROJ2PART2, by itself, creates a new PROJ2PART2 or raises the existing
%      singleton*.
%
%      H = PROJ2PART2 returns the handle to a new PROJ2PART2 or the handle to
%      the existing singleton*.
%
%      PROJ2PART2('CALLBACK',hObject,eventData,h,...) calls the local
%      function named CALLBACK in PROJ2PART2.M with the given input arguments.
%
%      PROJ2PART2('Property','Value',...) creates a new PROJ2PART2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Proj2Part2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Proj2Part2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Proj2Part2

% Last Modified by GUIDE v2.5 30-May-2014 04:15:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Proj2Part2_OpeningFcn, ...
                   'gui_OutputFcn',  @Proj2Part2_OutputFcn, ...
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


% --- Executes just before Proj2Part2 is made visible.
function Proj2Part2_OpeningFcn(hObject, eventdata, h, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
% varargin   command line arguments to Proj2Part2 (see VARARGIN)

% Choose default command line output for Proj2Part2
h.output = hObject;

% Update h structure
guidata(hObject, h);

% UIWAIT makes Proj2Part2 wait for user response (see UIRESUME)
% uiwait(h.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Proj2Part2_OutputFcn(hObject, eventdata, h) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)

% Get default command line output from h structure
varargout{1} = h.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
h.recSound = audiorecorder(44100, 16, 2);
get(h.recSound)
% Record your voice for 10 seconds.
h.recSound = audiorecorder;
disp('Start speaking.')
recordblocking(h.recSound, 10);
disp('End of Recording.');
guidata(hObject,h);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
play(h.recSound);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
% Play back the recording.
stop(h.recSound);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, h)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% h    structure with h and user data (see GUIDATA)
clear all
