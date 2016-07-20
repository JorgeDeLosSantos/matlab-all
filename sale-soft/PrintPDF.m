clear;clc; 
fig = figure('units','inches','Visible','off',...
      'PaperPosition',[0 0 3 3],...
      'PaperSize',[3 3]);
x=linspace(0,10,100);
h=plot(x,sin(x),'r');
load 'matlab'
fo=num2str(folio);
legend(fo);
print(fig,'-dpdf','test.pdf')
folio=folio+1;
save('matlab.mat','folio');


