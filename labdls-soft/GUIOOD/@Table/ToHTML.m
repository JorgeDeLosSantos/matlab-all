function ToHTML(obj,filename,opts)
% Table/ToHTML
%
% Export uitable (Table class) to a table on HTML file.
%
% Este método originalmente fue desarrollado como
% una función de nombre table2html, que puede encontrar
% en la dirección electrónica siguiente:
%
% ---->   [ URL ]
%
% Desde luego que el código aquí expuesto ha sido modificado 
% por razones de compatibilidad.
%
% Sintaxis:
%
% ToHTML(filename,opts)
%
%          filename   - Nombre del archivo de salida (*.html)
%          opts       - Estructura de opciones adicionales (Véase Opciones)
%
% Exporta un elemento de la clase Table como tabla en un 
% archivo en formato HTML
%
% Ejemplo:
%
%       app = Frame('App');
%       tab = Table(rand(3),{'A1','A2','A3'});
%       app.Add(tab);
%       tab.ToHTML('Ejemplo.html');
%
%
% Opciones:
%
%       PageTitle      -->     Título de la página web
%       TableTitle     -->     Título de la tabla
%       BgColor        -->     Color de fondo de la tabla
%       FontName       -->     Tipo de fuente utilizada
%       BorderWidth    -->     Ancho del borde de la tabla
%
% Ejemplo con opciones:
%
%       app = Frame('Table Export Demo');
%       tab = Table(rand(3),{'A','B','C'});
%       app.Add(tab);
%       opts.PageTitle = 'Ejemplo';
%       opts.TableTitle = 'Mi tabla';
%       opts.BgColor = '#00FF00';
%       opts.FontName = 'Arial';
%       opts.BorderWidth = '3';
%       tab.ToHTML('miejemplo.html',opts);
%
%
%        -------------------------------
%            Rev 0.0.1  ||  25/10/2014
%               Jorge De Los Santos
%            delossantosmfq@gmail.com
%         http://matlab-typ.blogspot.mx
%        -------------------------------
%

hTab = obj.hTable; % Referencia a la uitable
if nargin < 2
    % Si no se especifica un archivo de salida, entonces por defecto
    % se aloja el resultado en la dirección html/untitled.html
    filename = 'html/untitled.html';
end

% ========================== OPCIONES ===================================
fields_opts = {'PageTitle',   'Sin título',;
    'TableTitle',  'Tabla 1';
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