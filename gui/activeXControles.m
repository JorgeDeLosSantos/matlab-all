function activeXControles
figure('MenuBar','none','NumberTitle','off',...
    'Name','ActiveXCtrl','Position',[0 0 300 300]);
centerfig();
hActx=actxcontrol('WMPlayer.OCX.7','Position',[10 10 280 280]);

hmA=uimenu(gcf,'Label','Archivo');
uimenu(hmA,'Label','Abrir','Callback',@openFile)

    function openFile(src,event)
        [arch,ruta]=uigetfile('*.mp3','Seleccione');
        if isequal(arch,0)
            return;
        else
            set(hActx,'URL',fullfile(ruta,arch));
        end
    end
end