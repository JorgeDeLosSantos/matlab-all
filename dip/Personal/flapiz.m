function M = flapiz(X)
X = rgb2gray(X);
% filtro = [0, 1, 0; 1.5, -4, 0.5; 0, 1, 0];
filtro = [-1, 0, 0; 
          -1, 4, -1;
          0, 0, -1];
X = imfilter(X,fspecial('motion',20,20));
X = imfilter(X,filtro);
M = ~X;
end