clear all
clc
h=uicontrol('style','push','str','AAA','pos',[20 20 100 20]);
p=get(h,'pos');
C(1:p(4),1:p(3),3)=rand(p(4),p(3));
set(h,'CData',C);