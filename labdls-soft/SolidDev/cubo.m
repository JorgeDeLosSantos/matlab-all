function cubo(L,color)
if nargin<2
    color=[0.9 0.9 0.9];
end
set(gca,'NextPlot','add');
X=[0 L L 0 0];
Y=[0 0 L L 0];
Z=zeros(1,length(X));
h1=patch(X,Y,Z,color);
h2=patch(X,Y,Z+L,color);
v1=get(h1,'Vertices');
v2=get(h2,'Vertices');
for i=1:length(X)-1
    p.Vertices=[v1(i,:);v1(i+1,:);v2(i+1,:);v2(i,:)];
    p.Faces=[1 2 3 4];
    p.FaceColor=color;
    patch(p)
end
view(3);
end