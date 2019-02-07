clear %used to erase any variables that may have already been in the workspace

twitterDataInfo = csvread('Toutput_24M.csv', 1);%twitter data info being read from csv file
informationInputs = xlsread('UserInput.xlsx', 'A19:F19');%reads in the required information, check the README.txt and UserInput.txt files for more information
informationInputs(isnan(informationInputs))= []; %eliminates invalid values that might have been entered
logBase = xlsread('UserInput.xlsx', 'H19:H19');% reads log basis to use for data
centroids = xlsread('UserInput.xlsx', 'I19:I19');% reads the amount of centroids required
selectedInformation = twitterDataInfo(:, informationInputs);%splices input matrix in terms of information required listed in UserInput.txt file
databaseIds = twitterDataInfo(:, [1]);%splices the id information related to each row of information to match it to main database
logInformation = zeros(size(selectedInformation));%matrix to be used for the log of the data
sizeOfSelectedInformation = size(informationInputs,2);%selectively choosing the required data from twitterDataInfo
headersForOutputFile = {'ids'}; %headers for output file that will be dynamically added
if logBase == 1
    for i = 1:numel(selectedInformation)
    if selectedInformation(i) ~= 0
        logInformation(i) = log(selectedInformation(i));
    end
    end
end

if logBase == 10
    for i = 1:numel(selectedInformation)
    if selectedInformation(i) ~= 0
        logInformation(i) = log10(selectedInformation(i));
    end
    end
end

if logBase == 2
    for i = 1:numel(selectedInformation)
    if selectedInformation(i) ~= 0
        logInformation(i) = log2(selectedInformation(i));
    end
end
end

[idx,C] = kmeans(logInformation,centroids); %performing training on data set 

if centroids == 2
figure;
plot(logInformation(idx==1,1),logInformation(idx==1,2),'r.','MarkerSize',12)
hold on
plot(logInformation(idx==2,1),logInformation(idx==2,2),'b.','MarkerSize',12)
plot(C(:,1),C(:, 2),'kx',...
     'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
hold off
end

if centroids == 3
figure;
plot(logInformation(idx==1,1),logInformation(idx==1,2),'r.','MarkerSize',12)
hold on
plot(logInformation(idx==2,1),logInformation(idx==2,2),'b.','MarkerSize',12)
plot(y(idx==3,1),y(idx==3,2),'y.','MarkerSize',12)
plot(C(:,1),C(:, 2),'kx',...
     'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Cluster 3','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
hold off
end

if centroids == 4
figure;
plot(logInformation(idx==1,1),logInformation(idx==1,2),'r.','MarkerSize',12)
hold on
plot(logInformation(idx==2,1),logInformation(idx==2,2),'b.','MarkerSize',12)
plot(y(idx==3,1),y(idx==3,2),'y.','MarkerSize',12)
plot(y(idx==4,1),y(idx==4,2),'m.','MarkerSize',12)
plot(C(:,1),C(:, 2),'kx',...
     'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Centroid',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
hold off
end

if centroids == 5
figure;
plot(logInformation(idx==1,1),logInformation(idx==1,2),'r.','MarkerSize',12)
hold on
plot(logInformation(idx==2,1),logInformation(idx==2,2),'b.','MarkerSize',12)
plot(y(idx==3,1),y(idx==3,2),'y.','MarkerSize',12)
plot(y(idx==4,1),y(idx==4,2),'m.','MarkerSize',12)
plot(y(idx==5,1),y(idx==5,2),'g.','MarkerSize',12)
plot(C(:,1),C(:, 2),'kx',...
     'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Cluster 5','Centroids','Location','NW')
title 'Cluster Assignments and Centroids'
hold off
end

if centroids == 6
figure;
plot(logInformation(idx==1,1),logInformation(idx==1,2),'r.','MarkerSize',12)
hold on
plot(logInformation(idx==2,1),logInformation(idx==2,2),'b.','MarkerSize',12)
plot(y(idx==3,1),y(idx==3,2),'y.','MarkerSize',12)
plot(y(idx==4,1),y(idx==4,2),'m.','MarkerSize',12)
plot(y(idx==5,1),y(idx==5,2),'g.','MarkerSize',12)
plot(y(idx==6,1),y(idx==6,2),'c.','MarkerSize',12)
plot(C(:,1),C(:, 2),'kx',...
     'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Cluster 5','Cluster 6','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
hold off
end

for i= 1:sizeOfSelectedInformation
    if informationInputs(i)==2
        headersForOutputFile{end+1} = 'retweet_count';
    elseif informationInputs(i) == 3
         headersForOutputFile{end+1} = 'user_favourites_count';
    elseif informationInputs(i) == 4
         headersForOutputFile{end+1} = 'user_listed_count';
    elseif informationInputs(i) == 5
         headersForOutputFile{end+1} = 'user_friends_count'; 
    elseif informationInputs(i) == 6
         headersForOutputFile{end+1} = 'user_statuses_count'; 
    elseif informationInputs(i) == 7
         headersForOutputFile{end+1} = 'favorite_count'; 
    end
end

headersForOutputFile{end+1} = 'Centroid';

twitterDataInfo  = [databaseIds logInformation idx]; %resultant output matrix including id, prepared input matrix and associated neurons

csvwrite_with_headers('k-MeansAnalysisResults.csv',twitterDataInfo,headersForOutputFile); %writing output to csv file