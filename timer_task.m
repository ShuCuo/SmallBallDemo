function timer_task(timer, eventdata)

global runs;
global mouse_x;
global mouse_y;
global x;
global y;
global dx;
global dy;
global g;
global k;
global n;
global a;
global b;

if(runs == 0)
    stop(timer);
    return ;
end

x = x + dx;
y = y + dy;
dy = dy - g;

dx = dx - k * x / 100;
dy = dy - k * y / 300;

if(abs(x - mouse_x) < 0.2 && abs(y - mouse_y) < 0.2)
    length = ((x - mouse_x)^2 + (y - mouse_y)^2)^0.5;
    dx = dx + 0.1 * a * (x - mouse_x) / length^3;
    dy = dy + 0.1 * a * (y - mouse_y) / length^3;
end

dx = dx * b;
dy = dy * b;

if(x >= 1)
    x = 1;
    dx = 0 - abs(dx * n);
end
if(x <= -1)
    x = -1;
    dx = 0 + abs(dx * n);
end
if(y >= 1)
    y = 1;
    dy = 0 - abs(dy * n);
end
if(y <= -1)
    y = -1;
    dy = 0 + abs(dy * n);
end
data = timer.UserData;
handles = data.handles;
hObject = data.hObject;
small_ball_OutputFcn(hObject, eventdata, handles)
