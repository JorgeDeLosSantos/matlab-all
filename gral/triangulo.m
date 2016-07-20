function h = triangulo(v1,v2,v3,color)
X = [v1(1) v2(1) v3(1)];
Y = [v1(2) v2(2) v3(2)];
h = patch(X,Y,color);
end