function[finalMat]=gameofLife(mat,n)
%trial using conv2 instead of doing longhand adding 
[r,c]=size(mat);
%placeholder to store values of this iteration
placeMat=zeros(r,c);
%performing n iterations
for iterate=1:n
    %store sum of neighbors (and self) to another matrix
    neighborSum=addAround(mat);
%parse and compare values 
    for j=1:c
        for i=1:r  
            %if alive, then check neighbors
            if mat(i,j)==1 
                if neighborSum(i,j)<=4 && neighborSum(i,j)>=3
                    placeMat(i,j)=1;
                end
            %if dead, check neighbors
            else
                if neighborSum(i,j)==3
                    placeMat(i,j)=1;
                end
            end
        end
    end
    %rinse and repeat
    mat=placeMat;
    %display every iteration as performed
    disp(mat);
end
%at nth iteration, exit loop. store in output variable
finalMat=mat;
            