function planeta
cla
l = hgtransform;
% obtener las coordenadas de una esfera
[x,y,z] = sphere(30);
% dibujar la superficie de la estrella
sol = surface(x,y,z,'EdgeColor',[0.75,0.75,0],'FaceColor',[1,1,0]);
% igualar las escalas de los ejes
axis equal
% dibujar la superficie del planeta
tierra = surface(x/2,y/2,z/2,'EdgeColor',[0,0.75,0],...
    'FaceColor',[0,0.75,0.25],'Parent',l);
% vista en 3 dimensiones
view(3)
for t = 0:0.01:6.28
    % calcular las coordenadas de la tierra
    xe = 5*cos(t);
    ye = 8*sin(t);
    ze = 0;
    % crear la matriz de transformación
    M = makehgtform('translate',[xe,ye,ze]);
    % aplicar la transformación al lienzo l
    set(l,'Matrix',M)
    % dibujar ahora, no dejar dibujados pendientes
    drawnow
    % igualar los ejes
    axis equal
    % cambiar el ancho de la ventana
    xlim([-10,10])
    ylim([-10,10])
    % ocultar los ejes
    axis off
    pause(0.01)
end
end