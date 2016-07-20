classdef complejo < handle
    % Clase complejo
	% Define la clase de los números complejos
	% y todas las operaciones básicas efectuadas 
	% con estos.
    
    properties
        re; % Parte real
        im; % Parte imaginaria
    end
    
    methods
        function nc = complejo(a,b)
            if nargin == 1
                if ~isa(a,'complejo')
                    nc.re=a;
                    nc.im=0;
                else
                    nc.re=real(a);
                    nc.im=imag(a);
                end
            elseif nargin == 2
                nc.re=a;
                nc.im=b;
            end
        end
        function disp(nc)
            if nc.im >= 0
                signo='+';
            else
                signo='-';
            end
            disp([num2str(nc.re),signo,num2str(abs(nc.im)),'i']);
        end
        function r = real(nc)
            r=nc.re;
        end
        function r = imag(nc)
            r=nc.im;
        end
        function r = plus(a,b)
            a=complejo(a);
            b=complejo(b);
            r=complejo(a.re+b.re,a.im+b.im);
        end
        function r = minus(a,b)
            a=complejo(a);
            b=complejo(b);
            r=complejo(a.re-b.re,a.im-b.im);
        end
        function r = mtimes(a,b)
            a=complejo(a);
            b=complejo(b);
            r=complejo((a.re*b.re)-(a.im*b.im),(a.re*b.im)+(a.im*b.re));
        end
    end
    
end

