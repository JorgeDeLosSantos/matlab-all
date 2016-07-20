function extrude(X,Y,h,c)
if nargin<4
    FACE_COLOR=[0.9 0.9 0.9];
    EDGE_COLOR=FACE_COLOR*0.8;
else
    FACE_COLOR=c;
    EDGE_COLOR=c*0.8;
end
if length(h)<2
    h=[0 h];
end
set(gca,'NextPlot','add');
set(gcf,'Renderer','opengl');
Z=zeros(1,length(X))+h(1);
h1=patch(X,Y,Z,FACE_COLOR,'EdgeColor',EDGE_COLOR);
h2=patch(X,Y,Z+h(2),FACE_COLOR,'EdgeColor',EDGE_COLOR);
v1=get(h1,'Vertices');
v2=get(h2,'Vertices');
for i=1:length(X)-1
    p.Vertices=[v1(i,:);v1(i+1,:);v2(i+1,:);v2(i,:)];
    p.Faces=[1 2 3 4];
    p.FaceColor=FACE_COLOR;
    p.EdgeColor=EDGE_COLOR;
    patch(p)
end
end