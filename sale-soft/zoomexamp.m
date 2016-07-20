function zoomexamp

fig = figure('Name','Anotaciones','Numbertitle','off','visible','on','toolbar','figure',...
    'units','centimeter','position',[1 1 10 10]);
axes(gca);
zoom(1/20);
end