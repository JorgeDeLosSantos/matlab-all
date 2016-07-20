% function giFondo
hFig = figure('Color','w'); 
HTML_str = fileread('C:\Users\User\Documents\HTML, Javascript and CSS\EjemploCodigo.html');
je = javax.swing.JEditorPane('text/html',HTML_str);
[hj, hc] =  javacomponent(je,[],hFig);
set(hc, 'pos',[10 10 300 200])
% end