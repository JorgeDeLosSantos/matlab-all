function ex
FigH = figure
set(FigH, 'WindowKeyPressFcn', @KeyPress)
function KeyPress(Source, EventData)
disp(EventData)
end
end