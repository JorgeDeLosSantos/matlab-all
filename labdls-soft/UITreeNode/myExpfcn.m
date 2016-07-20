function nodes = myExpfcn(tree, value)
        try
            count = 0;
            ch = dir(value);
            
            for i=1:length(ch)
                if (any(strcmp(ch(i).name, {'.', '..', ''})) == 0)
                    count = count + 1;
                    if ch(i).isdir
                        iconpath = 'icons/foldericon.gif';
                    else
                        iconpath = 'icons/bookicon.gif';
                    end
                    nodes(count) = uitreenode('v0',[value, ch(i).name, filesep], ...
                        ch(i).name, iconpath, ~ch(i).isdir);
                end
            end
        catch err
            error('MyApplication:UnrecognizedNode', ...
                ['The uitree node type is not recognized. You may need to ', ...
                'define an ExpandFcn for the nodes.']);
        end
        if (count == 0)
            nodes = [];
        end
    end