function h = fillbetween(f1,f2,a,b,color)
if nargin < 5
    color = 'b';
end

x = linspace(a,b);
f1 = eval(f1);
f2 = eval(f2);
X = [x fliplr(x)];
Y = [min(f1,f2) max(fliplr(f1),fliplr(f2))];
hPatch = patch(X,Y,color);

if nargout ~= 0
    h = hPatch;
end

end