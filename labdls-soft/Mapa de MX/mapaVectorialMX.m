clear all;clc;
MX=importdata('mapaMexico.txt');
ME=dir('ESTADOS\');
hold on
for i=1:length(ME)
    try
        X=importdata(['ESTADOS/',ME(i).name]);
        plot(X(:,1),X(:,2),'color',rand(1,3));
    catch e
        disp(e.message);
    end
        
end
% plot(MX(:,1),MX(:,2),'color','r');