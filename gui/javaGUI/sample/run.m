%% Raw
h=hgload('sample.fig');
h
pause(1)
%% Styled
stylefig(h,'sample.css')
pause(1);
delete(h)