function Callbacks_record_display_speech_GUI25(f,C,start_path)

%SENSE COMPUTER AND SET FILE DELIMITER
switch(computer)				
    case 'MACI64',		char= '/';
    case 'GLNX86',  char='/';
    case 'PCWIN',	char= '\';
    case 'PCWIN64', char='\';
    case 'GLNXA64', char='/';
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=C{1,1};
y=C{1,2};
a=C{1,3};
b=C{1,4};
u=C{1,5};
v=C{1,6};
m=C{1,7};
n=C{1,8};
lengthbutton=C{1,9};
widthbutton=C{1,10};
enterType=C{1,11};
enterString=C{1,12};
enterLabel=C{1,13};
noPanels=C{1,14};
noGraphicPanels=C{1,15};
noButtons=C{1,16};
labelDist=C{1,17};%distance that the label is below the button
noTitles=C{1,18};
buttonTextSize=C{1,19};
labelTextSize=C{1,20};
textboxFont=C{1,21};
textboxString=C{1,22};
textboxWeight=C{1,23};
textboxAngle=C{1,24};
labelHeight=C{1,25};
fileName=C{1,26};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PANELS
for j=0:noPanels-1
uipanel('Parent',f,...
'Units','Normalized',...
'Position',[x(1+4*j) y(1+4*j) x(2+4*j)-x(1+4*j) y(3+4*j)-y(2+4*j)]);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GRAPHIC PANELS
for i=0:noGraphicPanels-1
switch (i+1)
case 1
graphicPanel1 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
case 2
graphicPanel2 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
case 3
graphicPanel3 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TITLE BOXES
for k=0:noTitles-1
switch (k+1)
case 1
titleBox1 = uicontrol('parent',f,...
'Units','Normalized',...
'Position',[u(1+4*k) v(1+4*k) u(2+4*k)-u(1+4*k) v(3+4*k)-v(2+4*k)],...
'Style','text',...
'FontSize',textboxFont{k+1},...
'String',textboxString(k+1),...
'FontWeight',textboxWeight{k+1},...
'FontAngle',textboxAngle{k+1});
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BUTTONS
for i=0:(noButtons-1)
enterColor='w';
if strcmp(enterType{i+1},'pushbutton')==1 ||strcmp(enterType{i+1},'text')==1
enterColor='default';
end
if (strcmp(enterLabel{1,(i+1)},'')==0 &&...
        strcmp(enterLabel{1,(i+1)},'...')==0) %i.e. there is a label
%creating a label for some buttons
uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i)-labelDist-labelHeight(i+1) ...
(m(2+2*i)-m(1+2*i)) labelHeight(i+1)],...
'Style','text',...
'String',enterLabel{i+1},...
'FontSize', labelTextSize(i+1),...
'HorizontalAlignment','center');
end
switch (i+1)
case 1
button1=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button1Callback);
case 2
button2=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button2Callback);
case 3
button3=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button3Callback);
case 4
button4=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button4Callback);
case 5
button5=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button5Callback);
case 6
button6=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button6Callback);
case 7
button7=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button7Callback);
case 8
button8=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button8Callback);
case 9
button9=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button9Callback);
case 10
button10=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button10Callback);
case 11
button11=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button11Callback);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%USER CODE FOR THE VARIABLES AND CALLBACKS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize Variables
    curr_file=1;
    fs=8000;
    directory_name='abcd';
    wav_file_names='abce';
    fin_path='filename';
    fname='output';
    fnameo='output';
    nsamp=1;
    x=[];
    xin=[];
    y=[];
    %fs=10000;
    ss=1;
    es=19400;
    Lm=40;
    L=400;
    R=100;
    Rm=10;
    nsec=4;
    fileName='out_file';
    N=fs*nsec;
    ch=1;
    X=[1;2];
    Y=[1;2];
    nfrm=1;
    energy=[];
    zerocrossings=[];
    yrec=1;

% Name the GUI
    set(f,'Name','record_display_speech');

% CALLBACKS
% Callback for button1 -- Get Speech Files Directory
 function button1Callback(h,eventdata)
     directory_name=uigetdir(start_path,'dialog_title');
     A=strvcat(strcat((directory_name),[char,'*.wav']));
     struct_filenames=dir(A);
     wav_file_names={struct_filenames.name};
     set(button2,'String',wav_file_names);
     
% once the popupmenu/drop down menu is created, by default, the first
% selection from the popupmenu/drop down menu id is selected
    indexOfDrpDwnMenu=1;
    
% by default first speech/audio file from the popupmenu/dropdown menu will be loaded
    [curr_file,fs]=loadSelection(directory_name,wav_file_names,indexOfDrpDwnMenu);
 end

% Callback for button2 -- Choose speech file for play and plot
 function button2Callback(h,eventdata)
     indexOfDrpDwnMenu=get(button2,'val');
     [curr_file,fs]=loadSelection(directory_name,wav_file_names,indexOfDrpDwnMenu);
 end

%*************************************************************************
% function -- load selection from designated directory and selected speech/audio file
%
function [curr_file,fs]=loadSelection(directory_name,wav_file_names,...
    indexOfDrpDwnMenu);
%
% read in speech/audio file
% fin_path is the complete path of the .wav file that is selected
    fin_path=strcat(directory_name,char,strvcat(wav_file_names(indexOfDrpDwnMenu)));
    
% clear speech/audio file
    clear curr_file;
    
% read in speech/audio signal into curr_file; sampling rate is fs 
    [curr_file,fs]=wavread(fin_path);
    
% scale speech signal to +/- 32768 range
    xin=curr_file*32768;
    
% create title information with filename (fname), sampling rate (fs), 
% number of samples in file (nsamp)
    fname=wav_file_names(indexOfDrpDwnMenu);
    FS=num2str(fs);
    nsamp=num2str(length(curr_file));
    file_info_string=strcat('  file: ',fname,', fs: ',FS,' Hz, nsamp:',nsamp);

% retrieve fname from cell array
    fname=wav_file_names{indexOfDrpDwnMenu};
    
% correct filename by changing underbar characters to space characters
    fname(find(fname(:)=='_'))=' ';
end

% Callback for button9 -- play current speech file
    function button9Callback(h,eventdata)
     soundsc(xin,fs);
    end
        
% Callback for button3 -- display waveform
% and log energy/zero crossings contour
 function button3Callback(h,eventdata)
     
 % short-time analysis of log energy and zero crossing rate
    L=round(Lm*fs/1000);
    R=round(Rm*fs/1000);
    clear energy zerocrossings;
    [energy,zerocrossings,nfrm]=analysis(xin,L,R,fs);
    
% normalize xin to range of -1 to +1 and save as xinn
    xinmax=max(abs(xin));
    xinn=xin/xinmax;

    reset(graphicPanel3);axes(graphicPanel3);cla;
    
% plot speech waveform in graphics panel3
    plot(0:length(xinn)-1,xinn,'k');
    xpp=['Time in Samples; fs=',num2str(fs),' samples/second'];
    xlabel(xpp);ylabel('Value');grid on;
    axis([L/2+1-R L/2+1+nfrm*R min(xinn) max(xinn)]);
    stitle=sprintf(' file:%s',fname);
    
 % setup graphics Panel 2 for plotting log energy contour; carefully align
 % energy contour frames with waveform samples
    reset(graphicPanel2);axes(graphicPanel2);cla;
    
% plot log energy contour in graphics Panel 2
% plot zero crossings contour in graphics Panel 2
    plot(1:nfrm,energy,'r','LineWidth',2);
    hold on;
    plot(1:nfrm,zerocrossings,'b','LineWidth',2);

    mine=min(energy); maxe=max(energy);
    minz=min(zerocrossings); maxz=max(zerocrossings);
    minval=min([mine,minz]);
    maxval=max([maxe,maxz]);
    axis([0 nfrm+1 minval maxval]);grid on;ylabel('Value');
    xlabel('Frame Number');legend('Log Energy (dB)','Zero Crossings');
    
% title box information from run
    stitle1=strcat('Record_Display_Speech -- ',stitle);
    set(titleBox1,'String',stitle1);
    set(titleBox1,'FontSize',25);
    
 % setup graphics Panel 1
    reset(graphicPanel1);
    axes(graphicPanel1);
    cla;
    
 % create wideband spectrogram of speech file
    iwb_nb=1;
    dyn_range=50;
    spectrogram_speech_file(xin,iwb_nb,fs,dyn_range,graphicPanel1);
 end

% Callback for button4 -- fs: sampling rate for recording speech
 function button11Callback(h,eventdata)
     Index=get(button11,'val');
     a = [6000 8000 10000 16000 20000 40000];
     fs = a(Index);
 end

% Callback for button4 -- nsec: recording length in seconds
 function button4Callback(h,eventdata)
     nsec=str2num(get(button4,'string'));
 end

% Callback for button5 -- Record and play back new speech file
 function button5Callback(h,eventdata)
     button11Callback(h,eventdata);
     button4Callback(h,eventdata);

     if (str2num(get(button4,'string')) < 0)
        waitfor(errordlg('Number of seconds for recording must be a positive integer - re-enter.'));
        return;
     end
     
 % get filename for saving recorded file
     button6Callback(h,eventdata);
     clear y;
     
 % yn=speech in range -1 to 1
 % N=number of samples of speech
 % ch=number of recording channels
    N=fs*nsec;
    ch=1;
    
% Initialize Matlab recording routines
    recobj=audiorecorder(fs,16,1);
    
% Begin recording after hitting OK on msg box
    uiwait(msgbox('Ready to Record -- Hit OK to Begin','Record','modal'));
   
% recording code
recordblocking(recobj,nsec);
y=getaudiodata(recobj);

    ymin=min(y);
    ymax=max(y);
    ym=max(ymax,-ymin);
    xin=y/ym*32767;
    
% highpass filter to eliminate dc offset and 60 Hz hum and play out results
    y=highpass_filter_signal_GUI(y,fs);
    yrec=y;
    
% play out recorded speech
    soundsc(yrec,fs);
 end

% Callback for button10 -- Endpoint and Play Recorded Speech
    function button10Callback(h,eventdata) 
   y=yrec;
   
 % setup graphics Panel 3
    reset(graphicPanel3);axes(graphicPanel3);cla;

% plot waveform on graphics panel 3
% normalize y to range -1 to +1 and save as yn
    ynmax=max(abs(y));
    yn=y/ynmax;
    plot(0:length(yn)-1,yn,'k');
    xpp=['Time in Samples;  fs=',num2str(fs),' samples/second'];
    xlabel(xpp);ylabel('Value');grid on;
    stitle=sprintf('file:%s',fileName);
    
% select starting and ending points of speech file using graphics cursors
    [X,Y]=ginput(2);
    ysav=yn(round(X(1)):round(X(2)));
    clear y;
    y=ysav;

% play out endpointed speech
    soundsc(y,fs);
    
 % short-time analysis of log energy and zero crossing rate
    L=round(Lm*fs/1000);
    R=round(Rm*fs/1000);
    clear energy zerocrossings;
    [energy,zerocrossings,nfrm]=analysis(y',L,R,fs);
    
 % plot endpointed file on graphicsPanel3
    reset(graphicPanel3);axes(graphicPanel3);cla;
    plot(0:length(y)-1,y,'k');xlabel(xpp);
    axis([L/2+1-R L/2+1+nfrm*R min(y) max(y)]);
    ylabel('Value');grid on;
    
% setup graphics Panel 2
    reset(graphicPanel2);axes(graphicPanel2);cla;

% plot log energy contour in graphics Panel 2
% plot zero crossings contour in graphics Panel 2
    plot(1:nfrm,energy,'r','LineWidth',2);
    hold on;
    plot(1:nfrm,zerocrossings,'b','LineWidth',2);

    mine=min(energy); maxe=max(energy);
    minz=min(zerocrossings); maxz=max(zerocrossings);
    minval=min([mine,minz]);
    maxval=max([maxe,maxz]);
    axis([0 nfrm+1 minval maxval]);grid on;
    xlabel('Frame Number');legend('Log Energy (dB)','Zero Crossings');
    
 % title box file info
    stitle1=strcat('Record_Display_Speech:',stitle);
    set(titleBox1,'String',stitle1);
    set(titleBox1,'FontSize',25);
    
 % setup graphics Panel 1
    reset(graphicPanel1);
    axes(graphicPanel1);
    cla;
    
 % create wideband spectrogram of speech file
    iwb_nb=1;
    dyn_range=60;
    spectrogram_speech_file(y,iwb_nb,fs,dyn_range,graphicPanel1);
 end

% Callback for button6 -- read in name of speech output file
 function button6Callback(h,eventdata)
     fileName=get(button6,'string');
 end

% Callback for button8 -- save recorded speech in speech output file
 function button7Callback(h,eventdata)
     % currentDir=pwd;
     % currDir=strcat(currentDir,char,fileName,'.wav');
     newFolder=uigetdir(cd);
     oldFolder=cd(newFolder);
     
% must avoid y=1.0 values as these saturate the quantizer
     y=y/max(abs(y))*0.99;  
     % wavwrite(y,fs,strvcat(currDir));
     wavwrite(y,fs,16,fileName);
     cd(oldFolder);
 end

% Callback for button8 -- Close GUI
 function button8Callback(h,eventdata)
     close(gcf);
 end
end