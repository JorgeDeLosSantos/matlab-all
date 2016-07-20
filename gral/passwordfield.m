function h = passwordfield(varargin)
h=uicontrol('Style','edit','String','','KeyPressFcn',@kpf);
if ishandle(varargin{1})
    set(h,'Parent',varargin{1});
    set(h,varargin{2:end});
else
    set(h,varargin{1:end});
end

    function kpf(src,event)
        cad=get(src,'str');
        car=event.Character;
        cad=[cad car];
        for i=1:length(cad)
            cadmod=strrep(cad,cad(i),'*');
        end
        set(src,'str',cadmod);
    end
end