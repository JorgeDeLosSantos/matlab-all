function record_display_speech_GUI25
% Modifiable runGUI file
clc;
clear all;
fileName = 'record_display_speech.mat';    %USER - ENTER FILENAME
fileData=load(fileName);
temp=fileData(1).temp;

f = figure('Visible','on',...
'Units','normalized',...
'Position',[0,0,1,1],...
'MenuBar','none',...
'NumberTitle','off');

%SENSE COMPUTER AND SET FILE DELIMITER
switch(computer)				
    case 'MACI64',		char= '/';
    case 'GLNX86',  char='/';
    case 'PCWIN',	char= '\';
    case 'PCWIN64', char='\';
    case 'GLNXA64', char='/';
end


% start_path='c:\data\matlab_gui\speech_files';
    
% find speech files directory by going up one level and down one level
% on the directory chain; as follows:
    dir_cur=pwd; % this is the current Matlab exercise directory path 
    s=regexp(dir_cur,char); % find the last '\' for the current directory
    s1=s(length(s)); % find last '\' character; this marks upper level directory
    dir_fin=strcat(dir_cur(1:s1),'speech_files'); % create new directory
    start_path=dir_fin; % save new directory for speech files location

%USER - ENTER PROPER CALLBACK FILE
    Callbacks_record_display_speech_GUI25(f,temp,start_path);    
    % panelAndButtonEdit(f, temp);       % Easy access to Edit Mode

% Note comment PanelandBUttonCallbacks(f,temp) if panelAndButtonEdit is to
% be uncommented and used
end

% 3 Panels -- one for display speech buttons, one for record, one for
% graphics
% 3 Graphics Panels -- one for waveform, one for log energy, one for zero
% crossings
% 1 Text Box
% 9 Buttons
%   #1 - pushbutton - Get Speech Directory (speech_files)
%   #2 - popuplist - array of speech files from directory speech_file
%   #3 - pushbutton - Play Speech File
%   #4 - editable button - fs, speech recording sampling rate
%   #5 - editable button - nsec, number of seconds of recording
%   #6 - pushbutton - Record
%   #7 - editable button - out.file - name of file to store recording
%   #8 - pushbutton - Save Recorded Speech
%   #9 - pushbutton - Close GUI