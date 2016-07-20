function table2html(hTab,filename,opts)
% TABLE2HTML(hTab,filename)
%
%   hTab       - Handle de la uitable a "exportar"
%   filename   - Nombre del archivo de salida (*.html)
%   opts       - Estructura de opciones adicionales (Veáse Opciones)
%
% Exporta una uitable como tabla en un archivo en formato HTML
%
% EJEMPLO:
%
%       f = figure();
%       hTab = uitable(f,'Data',rand(10));
%       table2html(hTab,'miejemplo.html');
%
%
% OPCIONES (OPTS)
%     
%      PageTitle   -  Título de la página web
%      TableTitle  -  Título de la tabla
%      BgColor     -  Color de fondo de la tabla
%      FontName    -  Tipo de fuente utilizada
%      BorderWidth -  Ancho del borde de la tabla
%      
% EJEMPLO CON OPCIONES:
%
%       f = figure();
%       opts.PageTitle = 'Ejemplo';
%       opts.TableTitle = 'Mi tabla';
%       opts.BgColor = '#00FF00';
%       opts.FontName = 'Arial';
%       opts.BorderWidth = '3';
%       hTab = uitable(f,'Data',rand(10));
%       table2html(hTab,'miejemplo.html',opts);
%              
%
%    -------------------------------
%       Ver. 0.0.1  ||  25/10/2014
%           Jorge De Los Santos
%        delossantosmfq@gmail.com
%        http://labdls.blogspot.mx
%              MIT License
%    -------------------------------

if nargin < 1
    % En caso de no especificarse argumentos se "busca" un elemento del
    % tipo uitable y se asigna como archivo de salida a html/utitled.html
    hTab = findobj('type','uitable');
    if ~isempty(hTab)
        filename = 'html/untitled.html';
    else
        error('No existe elemento uitable disponible');
    end
end

if ~strcmp(get(hTab,'type'),'uitable')
    % Verificando que la referencia sea tipo "uitable"
    error('La referencia debe ser de tipo uitable');
end

% ========================== OPCIONES ===================================
fields_opts = {'PageTitle',   'Sin título',;
               'TableTitle',  '<b>Tabla 1</b>';
               'BgColor',     '#F0F0F0';
               'FontName',    'DejaVu Sans Mono';
               'BorderWidth', '2';
               'FontColor',   '#0000F0'};
if nargin == 3 && isstruct(opts)
    for k = 1:size(fields_opts,1)
        if ~isfield(opts,fields_opts{k,1})
            opts = setfield(opts,fields_opts{k,1},fields_opts{k,2});
        end
    end
else
    opts = cell2struct(fields_opts(:,2),fields_opts(:,1),1);
end

% ======================= PROPIEDADES DE LA TABLA ======================

X = get(hTab,'Data');
colnames = get(hTab,'ColumnName');
[nrows, ncols] = size(X);

% ========================= PLANTILLAS ================================

COL_TEMP = '<TD>_col_</TD>';
ROW_TEMP = '<TR>_row_</TR>';
HEADER_TEMP = '<TH bgcolor=#DCDCFF>_header_</TH>';

HTML_TEMP = ['<html><head><title>_pagetitle_</title></head><body><font face="_fontname_">',...
    '<table border=_borderwidth_ bordercolor=#000000 cellspacing=5 cellpadding=5 bgcolor=_bgcolor_>',...
    ' <caption>_tabletitle_</caption> _table_ </table></font> _footnote_ </body></html>'];

FOOT_TEMP = ['<br><br><br><font face="Arial Narrow" color=#C0C0C0 size=2>',...
    'Published by: <cite>table2html</cite></font>'];

% ========================== ENCABEZADOS  =============================
if strcmp(colnames,'numbered')
    colnames = repmat('untitled|',1,ncols);
    remain = colnames;
    colnames = {};
    while 1
        [str,remain]=strtok(remain,'|');
        if isempty(str),break,end;
        colnames=[colnames str];
    end
end
rstr = WriteHeaders(colnames);
WriteTable(rstr);
web(filename,'-browser');

% =====================================================
    function rstr = WriteHeaders(headers)
        rstr = '';
        for k = 1:ncols
            rstr=[rstr,strrep(HEADER_TEMP,'_header_',headers{k})];
        end
    end

    function WriteTable(rstr)
        [path_,~,~] = fileparts(filename);
        if ~isempty(path_)
            if ~isdir(path_)
                mkdir(path_);
            end
        end
        
        fid=fopen(filename,'w');
        for i=1:nrows
            cstr='';
            for j=1:ncols
                if isa(X,'cell')
                    cstr = [cstr,strrep(COL_TEMP,'_col_',num2str(X{i,j})),' '];
                else
                    cstr = [cstr,strrep(COL_TEMP,'_col_',num2str(X(i,j))),' '];
                end
            end
            rstr = [rstr,strrep(ROW_TEMP,'_row_',cstr)];
        end
        WEB_PAGE = strrep(HTML_TEMP,'_table_',rstr);
        WEB_PAGE = regexprep(WEB_PAGE,{'_footnote_','_bgcolor_',...
            '_fontname_','_borderwidth_','_tabletitle_','_pagetitle_','_fontcolor_'},...
            {FOOT_TEMP,opts.BgColor,opts.FontName,opts.BorderWidth,...
            opts.TableTitle,opts.PageTitle,opts.FontColor});
        fprintf(fid,'%s',WEB_PAGE);
        fclose(fid);
    end

end