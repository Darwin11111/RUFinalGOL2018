function[sumSurround]=addAround(inMat)
%using conv2 to add neighbors instead of longhand 
%adds neighbors and itself 
kernel=ones(3);
sumSurround=conv2(inMat,kernel,'same');
