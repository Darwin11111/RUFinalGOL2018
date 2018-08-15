function varargout = Game_Of_lifeGUI_Meld(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Game_Of_life_OpeningFcn, ...
                   'gui_OutputFcn',  @Game_Of_life_OutputFcn, ...
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

% --- Initialize some properties and cleaning up output
function Game_Of_life_OpeningFcn(hObject, eventdata, handles, varargin)
clc
disp('Beginning Conways Game of Life Simulator');
disp('-------------------------------------------------------');
handles.iters = 0;
handles.xMax = 0;
handles.yMax = 0;
handles.boardA = {};

% Choose default command line output for Game_Of_life
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%launch the inputing screen
state = preseting_inputs('Game_Of_lifeGUI', hObject);

%wait for the presetting to be done
waitfor(state.figure1);

%grab the critical game data from other apps
handles.boardA = getappdata(hObject, 'Board');
handles.xMax = getappdata(hObject, 'xMax');
handles.yMax = getappdata(hObject, 'yMax');
handles.iters = getappdata(hObject, 'iters');

%adjustment for funkiness
handles.xMax = handles.xMax + 1;

displayBoard(handles);

guidata(hObject, handles);

% --- Dump output to command line
 function varargout = Game_Of_life_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --- Executes on button press in runbutton
function pushbutton1_Callback(hObject, eventdata, handles)
update(handles, handles.iters);

% --- Executes on button press in waitBTN.
function waitBTN_Callback(hObject, eventdata, handles)
waitfor(handles.pushbutton1, 'Value');

% --- Executes on button press in skipBTN.
function skipBTN_Callback(hObject, eventdata, handles)

    %runs the general updating function without having to throw in the
    %timer wait object
    its = handles.iters;
    
    %setup the game board in a readable format
    for i = 1:1:its
        boardArray = [1 0:0];
        for r = 1:1:handles.yMax
            for c = 1:1:handles.xMax
                boardArray(r, c) = handles.boardA{r, c};
            end
        end
        
        %run the game engine all the through for the set iterations
        array = Game_Of_Life_completed(boardArray, 1);
        
        %update the current array state
        for r = 1:1:handles.yMax
            for c = 1:1:handles.xMax
                handles.boardA{r, c} = array(r, c);
            end
        end
        guidata(handles.mainUI, handles);    

        %write board to the display
        displayBoard(handles);
        
        guidata(handles.mainUI, handles);
    end
    
    disp("sim concluded for set iterations");

% --- General game update function (with the waiting timer thing    
function [derp] = update(handles, its)
     %make the game run for the iterations one at a time
     for i = 1:1:its
         
        %setup the game board in a readable format
        boardArray = [1 0:0];
        for r = 1:1:handles.yMax
            for c = 1:1:handles.xMax
                boardArray(r, c) = handles.boardA{r, c};
            end
        end
        
        %run the game engine all the through for the set iterations
        array = Game_Of_Life_completed(boardArray, 1);
        
        %update the handles board
        for r = 1:1:handles.yMax
            for c = 1:1:handles.xMax
                handles.boardA{r, c} = array(r, c);
            end
        end
        guidata(handles.mainUI, handles);    
        
        %critical timer object so the user can see the updates
        t = timer;
        t.StartFcn = @(~,thisEvent)disp("waiting");
        t.TimerFcn = @(~,thisEvent)pause(1);
        t.StopFcn = @(~,thisEvent)disp("");
        t.BusyMode = 'queue';
        start(t)
        delete(t);
        
        %write the board to the dispaly
        displayBoard(handles);
        
        guidata(handles.mainUI, handles);
    end
    
    disp("sim concluded for set iterations");

function displayBoard(handles)
    %run through the board
    for r = 1:1:handles.yMax
       for c = 1:1:handles.xMax
           %make a 1x1 rectangle to represent the cell
           rect = rectangle(handles.boardDisplay, 'Position', [c-1, r-1, 1, 1]);
           %make it colorful
           if handles.boardA{r, c} == 0
               set(rect, 'FaceColor', 'k');
           else
               set(rect, 'FaceColor', 'w');
           end
       end
    end

% --- This was used for debugging and is no longer relevant
% --- Converted the board to a multi-line string
function [out] = makeString(handles)
    out = "";

    for r = 1:1:handles.yMax
        for c = 1:1:handles.xMax
            if handles.boardA{r, c} == 1
                out = out + ' ';
            else
                out = out + char(9611);
            end
        end
        out = out + newline;
    end
    
% --- Reset the Game state for different Inputs
function change_Callback(hObject, eventdata, handles)
state = preseting_inputs('Game_Of_lifeGUI', hObject);

waitfor(state.figure1);

handles.boardA = getappdata(hObject, 'Board');
handles.xMax = getappdata(hObject, 'xMax');
handles.yMax = getappdata(hObject, 'yMax');
handles.iters = getappdata(hObject, 'iters');

handles.xMax = handles.xMax + 1;

guidata(hObject, handles);

%reset board
cla;
displayBoard(handles);



% --- Executes during object creation, after setting all properties.
function boardTextDis_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function boardDisplay_CreateFcn(hObject, eventdata, handles)
