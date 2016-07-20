classdef vehiculo < handle
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        tipo='';
        estado=0;
        combustible=0;
        rendimiento=0;
        distanciarecorrida=0;
    end
    
    methods (Abstract=true)
        arranca(obj)
        apaga(obj)
        cargacombustible(obj,cantidad)
        desplaza(obj,distancia)
    end
    
end

