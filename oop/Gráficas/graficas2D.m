classdef graficas2D < handle
    % Ejemplo de clase básico
    
    properties
        color;
        grosor;
        estilo;
        tipo;
    end
    
    methods
        function g = graficas2D()
        end
        function tipoG(g,tipo)
            if tipo == 'rect'
                ezplot('x');
            elseif tipo == 'polar'
                ezpolar('t-cos(t)');
            elseif tipo == 'param'
                ezplot('cos(t)','sin(t)');
            end
        end
        function confiProp(g,prop,val)
            set(get(gca,'children'),prop,val);
        end
    end
    
end

