function[endMat]=gameLifeC(startMat)
%initializing variables
[n,m]=size(startMat);
endMat=zeros(n+2,m+2);
%copying cell values of startMat one row down, one column in 
for j=1:m
    for i=1:n
        endMat(i+1,j+1)=startMat(i,j)
    end
end

