clear all;clc;
hold on
for i=0:5:100
    h=line([0 i],[100-i 0]);
    set(h,'color',rand(1,3),'linewidth',2)
end
axis('square')