clear all;close all;clc;
%A={'Pedro' '10' '9'}';
%xlswrite('factura.xlsx',A,'factura','B1:B3');
 fig = figure('Visible','off',...
      'PaperPosition',[0 0 6 4],...
      'PaperSize',[6 4])
  plot(rand(5))
  set(gca,'Position',[0 0 1 1])
  print(fig,'-dpdf','test.pdf')