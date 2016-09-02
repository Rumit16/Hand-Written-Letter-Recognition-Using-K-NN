function [testY] = testknn(trainX,trainY,testX,k)

% finding eculidean distance between training and test data and stores it in dist(m*n)matrix 
dist  = pdist2(trainX,testX,'euclidean');
size(dist,2);
% 

% for k=1
if(k==1)
    % find the minimum value of each column of distance matrix and store its' index in val 
    [val, ind] = min(dist); 
    % assign the label to the test data using the val of training data
    testY=trainY(ind); 
    
% for all the other value of k
else
    % sort the distance matrix column vise
    [val, ind] = sort(dist);
     
    % now take the k value from each column 
    % it will give k nearest element for each test data 
    % find the most frequently occuring value in each column and compare it
    % with trainY
    
     testY = mode(trainY(ind([1,k],:)),1);
     testY=testY';
    
end
end %function ends