function acercade

fm=figure('NumberTitle','off','MenuBar','none','Name','Acerca de...','position',...
    [500 350 300 180],'resize','off');
whitebg(fm,[1 0.4 0.2]);

texto={'','PC CONCEPTS','','Prop: Giovany Ignacio Martínez','','Hombres Ilustres #306 Colonia: Centro',...
    'Matias Romero Avendaño, Oaxaca Cp: 70300  Tel: 972-72-217-48',''};

txt=uicontrol('style','text','String',texto,'position',[10 10 280 160],'fontsize',10,...
    'fontweight','bold');

end
