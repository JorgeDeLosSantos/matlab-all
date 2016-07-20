javaaddpath('C:\utils\jfreechart-1.0.19\lib\jfreechart-1.0.19.jar');
javaaddpath('C:\utils\jfreechart-1.0.19\lib\jcommon-1.0.23.jar');
import java.lang.*;

% Prepare a data-set with some unrealistic numbers...
serie = org.jfree.data.xy.XYSeries(String('Hola'));
x = linspace(0,10);
y = cos(x);
for k = 1:length(x)
    serie.add(x(k),y(k));
end
coll = org.jfree.data.xy.XYSeriesCollection();
coll.addSeries(serie);

title = String('Datos aleatorios');
xl = String('Tiempo (s)');
yl = String('Amplitud (mm)');
chart = org.jfree.chart.ChartFactory.createXYLineChart(title,xl,yl,coll);

fv = get(gcf,'Position');

jPanel = org.jfree.chart.ChartPanel(chart);
[jp,hp] = javacomponent(jPanel,[0,0,fv(3),fv(4)],gcf);
