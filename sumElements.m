function[total]=sumElements(inputMat)
%initializing variables
[n,m]=size(inputMat);
total=0;
%reading through elements and adding to total 
for j=1:m
    for i=1:n
        total=total+inputMat(n,m);
    end
end
