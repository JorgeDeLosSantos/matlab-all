function h=piecewise(F,I,x)
% Plot a piecewise function
% Inputs:
%          F  -  Cell array of functions
%          I  -  Cell array of subdomains
%          x  -  Domain
% Example:
%          >> F={'-x','x'};
%          >> I={'x<0','x>0'};
%          >> x=-5:0.1:5;
%          >> piecewise(F,I,x);
%
% $ Por: Jorge De Los Santos $
% $ E-mail: delossantosmfq@gmail.com $
% $ Rev. 1.0.0 $ $ Fecha: 02/02/2014 $

if length(F)~=length(I)
    error('Invalid inputs');
end
set(gca,'NextPlot','add');
for i=1:length(F)
    xe=x(eval(I{i}));
    h(i)=plot(xe,subs(F{i},'x',xe));
end
end