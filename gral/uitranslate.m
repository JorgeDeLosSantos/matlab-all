function uitranslate(hF,file)

if ~ishandle(hF)
    error('El primer argumento debe ser un handle');
end

all_childrens = findobj();
[lang1,lang2] = readfile(file);

for i=1:length(all_childrens)
    if strcmp(get(all_childrens(i),'type'),'uicontrol')
        str = get(all_childrens(i),'String');
        type = 'String';
    elseif strcmp(get(all_childrens(i),'type'),'uimenu')
        str = get(all_childrens(i),'Label');
        type = 'Label';
    else
        str = '';
    end
    if ~isempty(str)
        k1 = cellfun(@any,strfind(lang1,str));
        k2 = cellfun(@any,strfind(lang2,str));
        k1 = find(k1==1);
        k2 = find(k2==1);
        if ~isempty(k1)
            set(findobj(type,str),type,lang2{k1});
        end
        if ~isempty(k2)
            set(findobj(type,str),type,lang1{k2});
        end
    end
end


    function [L1,L2] = readfile(filename)
        fid = fopen(filename,'r');
        k = 1;
        while ~feof(fid)
            line_ = split(fgetl(fid));
            L1{k} = line_{1};
            L2{k} = line_{2};
            k = k + 1;
        end
        fclose(fid);
    end

    function s = split(cad)
        delimiter = '|';
        remain=cad;
        s={};
        while true
            [str,remain]=strtok(remain, delimiter);
            if isempty(str),break;end;
            s=[s str];
        end
    end
end