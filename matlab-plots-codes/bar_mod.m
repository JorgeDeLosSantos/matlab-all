function bar_mod(X)
% Example: 
%        >> bar_mod([1,20,4,10,8,6,5]);
% 
if nargin < 1
   X = randi(10,1,20); % Demo 
end
WIDTH = 0.6; % bar width
axis([0 length(X) 0 max(X(:))]);
cmap = jet(length(X)); 
for i=1:length(X)
    rectangle('Position',[i-1,0,WIDTH,X(i)],...
        'FaceColor',cmap(i,:));
end
end