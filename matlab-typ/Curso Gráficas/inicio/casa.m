function casa
% Dibuja casa en 3D
% $ Por: Jorge De Los Santos $
% $ E-mail: delossantosmfq@gmail.com | matlabtyp@gmail.com $
% $ Web: http://matlab-typ.blogspot.com $
% $ Rev. 1.0.0 $ $ Fecha: 02/02/14 $
% 
% figure('MenuBar','figure','NumberTitle','off',...
%     'Name','Casa','Color','w');
set(gca,'visible','off');
hold on
% Colores
ccasa=[0.8 0.8 0.85]; % Color casa
cpuerta=[1 0 0]; % Color puerta
cventana=[0.2 0.2 0.8]; % Color ventana
ctecho=[0.6 0.3 0]; % Color techo
% Casa
caja([0 0 0],10,10,10,ccasa); % Cuerpo casa
fill3([1 4.5 4.5 1],[0 0 0 0]-0.01,[0 0 8 8],cpuerta); % Puerta
fill3([6 9 9 6],[0 0 0 0]-0.01,[4 4 8 8],cventana); % Ventana
fill3([0 10 10 0],[10 10 5 5],[10 10 13 13],ctecho); % Techo
fill3([0 10 10 0],[0 0 5 5],[10 10 13 13],ctecho); % Techo
fill3([0 0 0],[0 5 10],[10 13 10],ccasa);
fill3([10 10 10],[0 5 10],[10 13 10],ccasa);
caja([7 7 9],1,1,4,[0.8 0.8 0.8]);  % Chimenea
arbol([-8 7 0],10); % Árbol
arbol([10 -11 0],10); % Árbol
fill3([-15 -15 15 15],[-15 15 15 -15],[0 0 0 0],[0.2 0.3 0.2]); % Suelo
% Cerca / Alambrado
line([-15 -15 15 15 -15],[-15 15 15 -15 -15],[1 1 1 1 1],'Color','k');
line([-15 -15 15 15 -15],[-15 15 15 -15 -15],[1 1 1 1 1]+1,'Color','k');
line([-15 -15 15 15 -15],[-15 15 15 -15 -15],[1 1 1 1 1]+2,'Color','k');
poste(-15+0.2,-15+0.2,0,0.2,4);
poste(-15+0.2,15-0.2,0,0.2,4);
poste(15-0.2,15-0.2,0,0.2,4);
poste(15-0.2,-15+0.2,0,0.2,4);
% Vista y límites
view(3);
axis([-15 15 -15 15 0 15]);

%% Funciones auxiliares
    function hc = caja(P,dimx,dimy,dimz,C)
        % Dibuja caja, especificando el punto inicial y sus dimensiones.
        % Descripción de argumentos de entrada:
        %       P     -   Punto inicial de la caja (vector de 3 elementos)
        %       dimx  -   Longitud en dirección x
        %       dimy  -   Longitud en dirección y
        %       dimz  -   Longitud en dirección z
        %       C     -   Color, puede ser un vector RGB.
        % Ejemplo:
        %       >> hc = caja([0 0 0],2,3,4,[1 1 0]);
        %
        if nargin==4 % Si no se especifica un color
            C=rand(1,4);
        end
        set(gca,'NextPlot','add');
        M= [0 0 0;
            0 1 0;
            0 1 1;
            0 0 1;
            1 0 0;
            1 1 0;
            1 1 1;
            1 0 1];
        K= [1 5 6 2;
            3 4 8 7;
            5 6 7 8;
            1 2 3 4;
            2 3 7 6;
            1 4 8 5];
        X(4)=0;
        Y(4)=0;
        Z(4)=0;
        hc(6)=0;
        for n=1:6
            for i=1:4
                X(i)=M(K(n,i),1)*dimx+P(1);
                Y(i)=M(K(n,i),2)*dimy+P(2);
                Z(i)=M(K(n,i),3)*dimz+P(3);
            end
            hc(n) = fill3(X,Y,Z,C);
        end
        view(3);
    end

    function arbol(p0,H)
        set(gca,'NextPlot','add');
        h1=cilindro(p0(1),p0(2),p0(3),H/20,H/2);
        set(h1,'FaceColor',[0.6 0.3 0],'EdgeColor',[0.6 0.3 0]);
        h2=esfera(p0(1),p0(2),p0(3)+3*H/4,3*H/8);
        set(h2,'FaceColor','g','EdgeColor','g');
        axis([0 10 0 10 0 10]);
        daspect([1 1 1]);
        view(3);
        function he = esfera(px,py,pz,r)
            [x,y,z] = sphere;
            he = surf(r*x+px,r*y+py,r*z+pz);
        end
        function hc = cilindro(px,py,pz,r,h)
            [x,y,z]=cylinder;
            hc = surf(r*x+px,r*y+py,h*z+pz);
        end
    end

    function hc = poste(px,py,pz,r,h)
        [x,y,z]=cylinder;
        hc = surf(r*x+px,r*y+py,h*z+pz,'FaceColor',[0.2 0.1 0],...
            'EdgeColor',[0.2 0.1 0]);
    end
end
