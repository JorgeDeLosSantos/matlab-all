clear all;clc;
f=figure();
str='<html> &alpha + &beta = a<sup>2</sup>  </html>';
[hJC,hC]=javacomponent({'javax.swing.JLabel',str},[], f);
set(hC,'Position',[10 10 200 200]);