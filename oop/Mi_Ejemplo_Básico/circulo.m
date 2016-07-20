classdef circulo < handle
    
    properties
        radio;
        perimetro;
        area;
    end
    
    methods
        function obj = circulo(r)
            obj.radio=r;
        end
        function calcular(obj)
            obj.perimetro=2*pi*obj.radio;
            obj.area=pi*(obj.radio)^2;
        end
        
        function dibujar(obj)
            t=linspace(0,2*pi);
            x=obj.radio*cos(t);
            y=obj.radio*sin(t);
            plot(x,y);
            axis('square');
        end
    end
    
end

