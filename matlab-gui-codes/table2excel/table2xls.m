function table2xls(hTable,filename,sheet,range,bool_open)
% 
% 
% 
% Exporta el contenido de una tabla (uitable) a una 
% hoja de calculo Microsoft Excel (TM)
%
if ~ishandle(hTable)
    error('hTable must be a handle type');
end
if nargin == 4
	bool_open = false;
elseif nargin == 3
    bool_open = false;
    range = 'A1'; % Default range
elseif nargin < 3
    bool_open = false;
    range = 'A1'; % Default range
    sheet = 1; % Sheet1
end

% validateattributes(filename,{'char'},{});
% validateattributes(sheet,{'numeric','char'},{});
% validateattributes(range,{'char'},{'size',[1 2]});
% validateattributes(bool_open,{'numeric','logical'},{});

coln = getHeaders(hTable);
X = getData(hTable);
M = vertcat(coln,X);

xlswrite(filename, M, sheet, range);

if bool_open && ispc
	winopen(filename);
end

    function hd = getHeaders(hT)
        hd = get(hT,'ColumnName');
        if isa(hd,'char') && strcmp(hd,'numbered')
            [~,nc] = size(get(hT,'Data'));
            hd = num2cell(1:nc);
        else
            hd = hd'; % Column vector  -->  Row vector
        end
    end

    function dt = getData(hT)
        dt = get(hT,'Data');
        if ~isa(dt,'cell')
            dt = num2cell(dt);
        end
    end
end