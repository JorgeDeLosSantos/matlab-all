clear all;clc;
Titulos={'L(mm)' 'D(mm)' 'R(mm)' 'hR' 'n(rpm)' 'alpha(º)' 'Theta(º)' 'a' 'MRTfinal(min)' 'Vr' 'Vr2' 'Pe'}; % Variable Titulos
xlswrite('MeanResidenceTime.xlsx',Titulos','Simulación','A2:A13'); % Escribir Titulos en Excel
Letras=char(66:90); % Letras de B a Z
for i=1:length(Letras)-1
    Datos=rand(1,12); % Variable Datos
    Num=xlsread('MeanResidenceTime.xlsx','Simulación',sprintf('%s2:%s13',Letras(i),Letras(i)));
    if isempty(Num)
        xlswrite('MeanResidenceTime.xlsx',Datos','Simulación',sprintf('%s2:%s13',Letras(i),Letras(i)));
    else
        xlswrite('MeanResidenceTime.xlsx',Datos','Simulación',sprintf('%s2:%s13',Letras(i+1),Letras(i+1)))
    end
end
% winopen('MeanResidenceTime.xlsx');