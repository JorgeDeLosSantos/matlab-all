classdef alumno < handle
    properties
        Nombre;
        ID;
        Cursos='';
        Notas=[];
        Promedio;
    end
    
    methods
        function obj = alumno(nombre,id)
            obj.ID = id;
            obj.Nombre = nombre;
        end
        function disp(obj)
            fmtn=repmat(['%g '],1,length(obj.Notas));
            fmtc=repmat(['%s '],1,length(obj.Cursos));
            fprintf('\nNombre:   %s \n',obj.Nombre);
            fprintf('ID:         %g \n',obj.ID);
            fprintf(['Cursos: ',fmtc,'\n'],obj.Cursos);
            fprintf(['Notas: ',fmtn,'\n'],obj.Notas);
            fprintf('Promedio:   %g \n\n',obj.Promedio);
        end
        function agregarCurso(obj,curso)
            obj.Cursos=[obj.Cursos;curso];
        end
        function asignarNota(obj,nota)
            obj.Notas=[obj.Notas,nota];
        end
        function p = calcularPromedio(obj)
            p=sum(obj.Notas)/length(obj.Notas);
        end
    end
    
end

