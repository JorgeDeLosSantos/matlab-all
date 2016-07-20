function M = getxyzdata(h)
xx = get(h,'XData');
yy = get(h,'YData');
zz = get(h,'ZData');
M = [xx(:) yy(:) zz(:)];
end