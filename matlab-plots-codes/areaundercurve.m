function h = areaundercurve(f,a,b,color)
% Gráfica el área bajo la curva de una función f(x)
%     
% 
if nargin < 4
    color = 'b';
end
x = linspace(a,b);
f = eval(f);
X = [x fliplr(x)];
Y = [zeros(size(x)) fliplr(f)];
hPatch = patch(X,Y,color);

if nargout ~= 0
   h = hPatch;
end
end