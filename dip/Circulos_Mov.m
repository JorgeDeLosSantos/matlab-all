t=linspace(0,2*pi,100);
figure('NumberTitle','off','Name','Mini_Animación');
xlim([0 20]);
ylim([0 20]);
for n=1:50
    hold on
    r=2*rand(1,1);
    cx=20*rand(1,1);
    cy=20*rand(1,1);
    x=r*cos(t)+cx;
    y=r*sin(t)+cy;
    col=[rand(1,1) rand(1,1) rand(1,1)];
    fill(x,y,col);
    pause(0.2);
end