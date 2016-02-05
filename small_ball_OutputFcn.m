
% --- Outputs from this function are returned to the command line.
function varargout = small_ball_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hold off;
global runs;
global x;
global y;
if(runs == 0)
    close;
    return ;
end
plot([1, 1, -1, -1, 1], [1, -1, -1, 1, 1], 'o-');
hold on;
plot([0, x], [0, y], 'o-');
axis equal;
