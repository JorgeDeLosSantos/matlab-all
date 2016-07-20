function pb(parent,string,position)
string = horzcat('<html>',string,'<html>');
uicontrol(parent,'style','push','str',string,'pos',position);
end