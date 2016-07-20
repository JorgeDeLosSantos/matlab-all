clear;clc;
fls=dir('gray/50x/*.png');
k=[1.2 1 1 1];
for i=1:length(fls)
    X=imread(['gray/50x/',fls(i).name]);
    if i~=1
        for m=1:size(X,1)
            for n=1:size(X,2)
                if X(m,n)<100,X(m,n)=X(m,n)-50;end
            end
        end
    end
    imwrite(gray2ind(X*k(i)),flipud(jet),[fls(i).name(1:end-4),'jet.png']);
end
