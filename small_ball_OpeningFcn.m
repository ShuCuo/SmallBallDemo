% --- Executes just before small_ball is made visible.
function small_ball_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to small_ball (see VARARGIN)

delta_time = 0.02; % 50fps

my_timer = timer('Name','CircleTimer',...
'TimerFcn',@timer_task,...
'Period',delta_time,...
'ExecutionMode','fixedspacing');

global runs;
global mouse_x;
global mouse_y;
global dx;
global dy;
global x;
global y;
global g;
global k;
global n;
global a;
global b;

runs = 1;
mouse_x = -1;
mouse_y = -1;

x = .0;
y = .0;
dx = 0.05;
dy = 0.00;

g = 0.004;
k = 1;
n = 0.5;
a = 0.01;
b = 0.99;
data.handles = handles;
data.hObject = hObject;
my_timer.UserData = data;
start(my_timer);

% Choose default command line output for small_ball
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

set(handles.figure1, 'WindowButtonMotionFcn',{@figure1_WindowButtonMotionFcn, handles});

% UIWAIT makes small_ball wait for user response (see UIRESUME)
uiwait(handles.figure1);

% --- Executes on mouse press over axes background.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global mouse_x;
global mouse_y;
point = get(gca, 'CurrentPoint');
mouse_x = point(1, 1);
mouse_y= point(1, 2);
