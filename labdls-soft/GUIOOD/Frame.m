classdef Frame < Container
    % Frame Class
    %
    %
    %
    %
    
    properties
        %
    end
    
    methods
        function obj = Frame(name,size)
            if nargin==1
                size=[300 200]; % Default size
            end
            scsz = get(0,'ScreenSize');
            obj.hCont = figure('MenuBar','None',...
                'NumberTitle','off',...
                'Name',name,...
                'Position',[scsz(3)/3 scsz(4)/3 size(1) size(2)],...
                'Resize','on');
            %             centerfig(obj.hCont);
            obj.size_=size;
            obj.name_=name;
            obj.color_=get(obj.hCont,'Color');
            obj.width_=size(1);
            obj.height_=size(2);
        end
        
        function SetIcon(obj,iconfile)
            if ~exist(iconfile,'file')
                warning(['El archivo ',iconfile,' no existe, verifique.']);
            else
                warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
                jframe=get(obj.hCont,'javaframe');
                jIcon=javax.swing.ImageIcon(iconfile);
                jframe.setFigureIcon(jIcon);
            end
        end
        
        function Centre(obj,state)
            if state
                centerfig(obj.hCont);
            end
        end
        
        function Resize(obj,state)
            if state
                set(obj.hCont,'Resize','on');
            else
                set(obj.hCont,'Resize','off');
            end
        end
        
        function SetTitle(obj, title)
            set(obj.hCont,'Name',title);
        end
        
        function SetMenuBar(obj, menubar)
            set(menubar.hMB,'Parent',obj.hCont);
        end
    end
end

