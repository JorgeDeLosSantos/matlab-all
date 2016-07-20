function comparaImg
close all;clear all;clc;
figure('MenuBar','none',...
    'NumberTitle','off',...
    'Name','Compara Im�genes',...
    'Resize','off',...
    'Position',[200 200 700 400]);
centerfig;

ax1=axes('units','pixels','Position',[30 80 300 300]);
ax2=axes('units','pixels','Position',[370 80 300 300]);

uicontrol('style','push',...
    'String','Im�gen original',...
    'Position',[140 20 110 25],...
    'Callback',@imgOrig);

uicontrol('style','push',...
    'String','Im�gen modificada',...
    'Position',[480 20 110 25],...
    'Callback',@imgMod);

uicontrol('style','push',...
    'String','Comparar im�genes',...
    'Position',[300 20 120 25],...
    'Callback',@cmpImg);


    function cmpImg(src,event)
        global A B
        if all(all(A==B)==1)
            msgbox('No diferencias');
        else
            msgbox('Im�genes diferentes');
        end
    end

    function imgOrig(src,event)
        global A
        [filename, pathname] = uigetfile('*.png', 'Seleccione im�gen');
        if isequal(filename,0)
            return;
        else
            A=imread(fullfile(pathname, filename));
            axes(ax1);
            imshow(A);
        end
    end

    function imgMod(src,event)
        global B
        [filename, pathname] = uigetfile('*.png', 'Seleccione im�gen');
        if isequal(filename,0)
            return;
        else
            B=imread(fullfile(pathname, filename));
            axes(ax2);
            imshow(B);
        end
    end

end