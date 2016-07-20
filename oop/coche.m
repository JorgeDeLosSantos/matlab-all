classdef coche<vehiculo
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        marca=''
        viajes=0
        trayectos
    end
    
    methods
        function obj=coche(m,r)
            obj.marca=m;
            obj.tipo='terrestre';
            obj.combustible=100;
            obj.rendimiento=r;
        end
        function arranca(obj)
            if obj.combustible==0
                disp('No arranca');
                return;
            end
            obj.estado=1;
            disp('Auto en marcha');
        end
        function apaga(obj)
            obj.estado=0;
            disp('Auto apagado');
        end
        function cargacombustible(obj,cantidad)
            if obj.estado==1
                disp('No es posible');
                return;
            end
            obj.combustible=obj.combustible+cantidad;
            disp('Cargado el combustible');
        end
        function desplaza(obj,distancia)
            if obj.estado==0
                disp('Arranque el auto');
                return;
            end
            if obj.combustible*obj.rendimiento<distancia
                disp('No suficiente combustible');
                return;
            end
            obj.distanciarecorrida=obj.distanciarecorrida+distancia;
            obj.combustible=obj.combustible-distancia/obj.rendimiento;
            obj.viajes=obj.viajes+1;
            obj.trayectos(obj.viajes)=distancia;
            disp('Se ha desplazado');
            if obj.combustible==0
                obj.apaga();
            end
        end
    end
    
end

