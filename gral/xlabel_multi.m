function xlabel_multi
% xt=get(gca,'XTicks');
xtl=get(gca,'XTickLabel');
set(gca,'XTickLabel','');
for i=1:length(xtl)
    annotation('textbox',[i/length(xtl)-0.05 0 i/length(xtl) 0.1],...
        'String',xtl{i},'EdgeColor','none');
end
end