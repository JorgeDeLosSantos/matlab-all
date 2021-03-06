function g08_DemoSlider
f = figure('MenuBar','none',...
    'NumberTitle','off',...
    'Name','Ejemplo GUI',...
    'Position',[0 0 300 200]);
centerfig(f);

uicontrol('style','slider',...
    'Units','Normalized',...
    'Position',[0.1 0.4 0.8 0.2],...
    'Callback',@slider_callback);

    function slider_callback(src,~)
        N = get(src,'Value');
        set(f,'Color',ones(1,3)*N);
        fprintf('Valor actual: %g\n',N);
    end
end