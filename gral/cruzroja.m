function cruzroja
f = figure('MenuBar','none',...
    'Name','Cruz Roja',...
    'NumberTitle','off');
a = axes;
[x,y,z] = sphere;
for t = 0:0.01:8
    xcaja = 264*t;
    ycaja = -16*t^2;
    surf(25*x+xcaja,25*y+ycaja,25*z)
    view(2)
    axis equal
    xlim([-50,2500])
    ylim([-1500,50])
    title(sprintf('Tiempo: %4.2f segundos',t))
    text(xcaja,ycaja,...
        sprintf(' (%f,%f)',xcaja,ycaja))
    pause(0.01)
end
end