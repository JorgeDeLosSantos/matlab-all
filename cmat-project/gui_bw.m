function gui_bw
clearvars('-global');
hf=figure('MenuBar','none','Name','Corrosion',...
    'NumberTitle','off','Position',[0 0 1000 600]);
centerfig(hf);

p1=uipanel(hf,'Units','Pixels','Position',[10 550 980 40]);
p2=uipanel(hf,'Units','Pixels','Position',[10 100 980 440]);
p3=uipanel(hf,'Units','Pixels','Position',[10 10 980 80]);

uicontrol(p1,'style','push','String','Load image',...
    'Units','Normalized','Position',[0.02 0.1 0.1 0.8],...
    'Callback',@load_image);
hdir=uicontrol(p1,'style','edit','String','',...
    'Units','Normalized','Position',[0.15 0.1 0.84 0.8],...
    'BackG','w');

ax1=axes('Parent',p2,'Position',[0.05 0.1 0.4 0.8]);
ax2=axes('Parent',p2,'Position',[0.55 0.1 0.4 0.8]);

uicontrol(p3,'style','slider','Max',1,'Min',0,...
    'Units','Normalized','Position',[0.1 0.1 0.8 0.8],...
    'Callback',@change_thresh);

    function load_image(~,~)
        global X XG XB
        [filename, pathname] = uigetfile({'*.tif';'*.png'}, 'Select image');
        if isequal(filename,0)
            return;
        else
            archivo=fullfile(pathname, filename);
            set(hdir,'String',archivo);
        end
        X = imread(archivo);
        axes(ax1);
        imshow(X);
        
        % Pre-proc
        if length(size(X))>2
            XG=rgb2gray(X);
        else
            XG=X;
        end
        XB=im2bw(XG,graythresh(XG));
        axes(ax2);
        imshow(XB);
    end

    function change_thresh(src,~)
        global X XG XB
        k=get(src,'Value');
        XB=im2bw(XG,k);
        axes(ax2);
        imshow(XB);
    end
end