% test_getdir
%
    % newFolder=uigetdir('C:\data\matlab_GUI_RWS')
    % newFolder='C:\data\matlab_GUI_RWS\speech_files_new'
    newFolder=uigetdir(cd)
    
    oldFolder=cd(newFolder)
    
    filename='out_save';
    y=rand(1,1000)*100;
    maxy=max(abs(y)); y=y/maxy*0.95;
    fs=8000;
    wavwrite(y,fs,16,filename);
    
    cd(oldFolder)
    
    % cd(newFolder)

