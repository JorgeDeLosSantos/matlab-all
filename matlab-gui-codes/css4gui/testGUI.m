function testGUI
% Test GUI for CSS4GUI function
% 
f = figure();


uicontrol('style','push',...
    'Position',[10 10 80 20],...
    'String','Go to...');

uicontrol('style','edit',...
    'Position',[10 50 90 20],...
    'String','Do...');

uicontrol('style','text',...
    'Position',[10 90 80 20],...
    'String','Label');

css4gui('style_02.txt');
centerfig(f);
end