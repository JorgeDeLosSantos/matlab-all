function alinearElementos
figure();
h1=uicontrol('String','h1','Pos',[0 0 100 20]);
h2=uicontrol('String','h2','Pos',[10 30 100 20]);
h3=uicontrol('String','h3','Pos',[20 60 100 20]);
align([h1 h2 h3],'fixed','bottom');
end