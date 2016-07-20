function X = insertRango(var,dresp)
cad=horzcat('Inserte el rango para ',var);
conf.Interpreter='tex';
A=inputdlg({cad},'MFITEC',1,{dresp},conf);
if ~isempty(A)
    X=str2num(A{1});
else
    X=NaN;
end
end