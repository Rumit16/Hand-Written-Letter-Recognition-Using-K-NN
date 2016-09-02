function [condensedIdx] = condensedata(trainX,trainY)

j=1;
% Initialize the dummy index vector
i=1:size(trainX,1);
index(i) = i;

% Put the first row of the training data into subset
subset(j,:)= trainX(j,:);
subset_la(j,:) = trainY(j,:);
condensedIdx(j,1) = j;
%change the value of the jth element in the dummy index to 0
index(j) = 0;

% run the while loop untill all the elements of the dummy index = 0
while sum(index)
    % randomly choose the one raw from the traing data and mark it as
    % connsidered by making it's vaue zero in dummy index
    nonzero_index = find(index~=0);
    random_index = randsample(nonzero_index,1);
    index(random_index) = 0;
    % calling knn fuction and giving the subset as a training data and
    % randomly selected raw as test
    testY = testknn(subset,subset_la,trainX(random_index,:),1);
    
    % comparing the label of new raw with the original lable
    % if new label is not correct put the new raw into the subset
    if(~strcmp(testY,trainY(random_index)))
          j=j+1;
          subset(j,:)=trainX(random_index,:);
          subset_la(j,:) = trainY(random_index,:);
          condensedIdx(j,1)=random_index;
    end 
end
end
