%% Execute Chart as a MATLAB Object
% This example presents a modified version of an automatic transmission
% system that incorporates state hierarchy, temporal logic, and input
% events.
%
% * *Hierarchy:* The chart consists of a superstate |gear_logic| that
% surrounds the four-speed automatic transmission chart in the previous
% example. This superstate controls the speed and acceleration of the car.
% During execution, |gear_logic| is always active.
% * *Temporal Logic:* In the state |gear_logic|, the action |on
% every(0.25,sec)| determines the speed of the car. The operator
% |<docid:stateflow_ref#every every>| creates a MATLAB timer that executes
% the chart and updates the chart data |speed| every 0.25 seconds.
% * *Input Events:* The input events |SpeedUp|, |Cruise|, and |SlowDown|
% reset the value of the chart data |delta|. This data determines whether
% the car accelerates or maintains its speed at each execution step.

% Copyright 2018-2020 The MathWorks, Inc.

%%

% Set up charts with white background
set_param(0,'ExportBackgroundColorMode','white');

edit iot_stateflow.sfx
rt = sfroot;
note = rt.find('-regexp','Text','^Copyright');
note.delete;

%%
% You can execute this chart as an object in MATLAB directly through the
% Command Window or by using a script. You can also program a MATLAB app
% that controls the state of the chart through a graphical user interface.
% For example, this user interface sends an input event to the chart when
% you click a button. In the chart, the MATLAB function |widgets| controls
% the values of the gauges and lamps on the interface.
%
% <<../sf_car_dash_screenshot.png>>
%
% To start the example, in the App Designer toolstrip, click *Run*. The
% example continues to run until you close the user interface window.
%
% Alternatively, in the Stateflow Editor, in the *State Chart* Tab, click
% *Run*. To control the speed of the car, use the *SpeedUp*, *SlowDown*,
% and *Cruise* buttons In the Symbols pane. To stop the example, click
% *Stop*.
%
% For more information about executing Stateflow charts as MATLAB objects,
% see <docid:stateflow_doccenter#execution-in-matlab Execution in MATLAB>.