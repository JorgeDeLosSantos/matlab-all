function css4gui(sheet)
% CSS4GUI
%
% Syntax:
%
%         CSS4GUI(stylesheet)
%
%
if nargin < 1
    sheet = 'style.txt'; % Test
end

main(sheet);

    function main(sheet)
        txt = readStyleSheet(sheet);
        [tags,styles] = splitStyles(txt);
        props = structProps(styles);
        props = css2guiprop(props);
        setStyleByType(tags,props);
        if existFigureStyle(tags)
            setFigureStyle(tags,props);
        end
        save('ex','props','tags','styles');
    end

    function str = readStyleSheet(stysh)
        str = fileread(stysh);
    end

    function [tags, styles] = splitStyles(txt)
        tags = regexp(txt,'\#\w*','match');
        tags = regexprep(tags,'\#','');
        temp = regexp(txt,'\#(\w*)\s','split');
        temp(cellfun(@isempty,temp))=[]; % remove empty cell
        nst = length(temp);
        styles = cell(1,nst);
        for ii = 1:nst
            styles{ii} = regexprep(temp{ii},'(\{|\})','');
            styles{ii} = strtrim(styles{ii});
        end
    end

    function props = structProps(sty)
        props = cell(1,length(sty));
        for k = 1:length(sty)
            item = regexp(sty{k},'\n','split');
            prop = cell(1,length(item));
            val = cell(1,length(item));
            for ci = 1:length(item)
                aux = regexp(item{ci},'\=','split');
                prop{ci} = strtrim(aux{1});
                val{ci} = strtrim(aux{2});
            end
            props{k} = cell2struct(val,prop,2);
        end
    end

    function guip = css2guiprop(prop)
        guip = cell(1,length(prop));
        for i=1:length(prop)
            prop_ = fieldnames(prop{i})';
            value_ = struct2cell(prop{i})';
            idx = num2cell(1:length(prop_));
            temp_ = cellfun(@(kk) [prop_(kk),value_(kk)],idx,'un',0);
            temp_ = [temp_{:}];
            for ii=1:length(temp_)
                isforeg = strcmpi(temp_{ii},'foregroundcolor');
                isbackg = strcmpi(temp_{ii},'backg');
                isfontsz = strcmpi(temp_{ii},'fontsize');
                ispos = strcmpi(temp_{ii},'position');
                iscolor = strcmpi(temp_{ii},'color');
                if isbackg || isforeg || isfontsz || ispos || iscolor
                    temp_{ii+1}=eval(temp_{ii+1});
                end
            end
            guip{i} = temp_;
        end
    end


    function setStyleByType(tags,props)
        hGUI = gcf;
        
        for i=1:length(tags)
            if isgenerictag(tags{i})
                hObjs = findobj(hGUI);
                hObjs = findall(hObjs,'Type','uicontrol','-and','Style',tags{i}(2:end-1));
                try
                    set(hObjs,props{i}{:});
                catch err
                    disp(err);
                end
            end
        end
    end

    function setFigureStyle(tags,props)
        hGUI = gcf;
        tof = regexp(tags,'\_figure\_');
        idx = find(~cellfun(@isempty,tof));
        set(hGUI,props{idx}{:}); %#ok<>
    end

    function r = isgenerictag(tag)
        fstr = regexp(tag,'\_\w*\_','once');
        if ~isempty(fstr)
            r = true;
        else
            r = false;
        end
    end

    function r = existFigureStyle(tags)
        tof = regexp(tags,'\_figure\_');
        r = any(~cellfun(@isempty,tof));
    end
end