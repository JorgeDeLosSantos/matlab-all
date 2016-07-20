function h = findvars(class)
VARS = evalin('base','whos');
h = [];
k = 1;
for i=1:length(VARS)
    if strcmp(VARS(i).class,class)
        h{k} = VARS(i).name;
        k = k + 1;
    end
end
end