clear %used to erase any variables that may have already been in the workspace

twitterDataInfo = csvread('TestInputsforSOM.csv', 1);%twitter data info being read from csv file
informationInputs = xlsread('UserInput.xlsx', 'A38:F38');%reads in the required information, check the README.txt and UserInput.txt files for more information
informationInputs(isnan(informationInputs))= []; %eliminates invalid values that might have been entered
logBase = xlsread('UserInput.xlsx', 'H38:H38');% reads log basis to use for data
selectedInformation = twitterDataInfo(:, informationInputs);%splices input matrix in terms of information required listed in UserInput.txt file
databaseIds = twitterDataInfo(:, [1]);%splices the id information related to each row of information to match it to main database
logInformation = zeros(size(selectedInformation));%matrix to be used for the log of the data
sizeOfSelectedInformation = size(informationInputs,2);%selectively choosing the required data from twitterDataInfo
headersForOutputFile = {'ids'}; %headers for output file that will be dynamically added
preparedData = selectedInformation;

if logBase == 1 %if natural log selected in userinput file, then it'll be used
    for i = 1:numel(selectedInformation)
    if selectedInformation(i) ~= 0
        logInformation(i) = log(selectedInformation(i));
    end
    end
    preparedData = logInformation;
end

if logBase == 10 % if log 10 base selected in userinput file
    for i = 1:numel(selectedInformation)
    if selectedInformation(i) ~= 0
        logInformation(i) = log10(selectedInformation(i));
    end
    end
    preparedData = logInformation;
end

if logBase == 2 % if log 2 bae selected in userinput file
    for i = 1:numel(selectedInformation)
    if selectedInformation(i) ~= 0
        logInformation(i) = log2(selectedInformation(i));
    end
    end
    preparedData = logInformation;
end


[coeff,score,latent,tsquared,explained] = pca(preparedData); %pca training 


for i= 1:sizeOfSelectedInformation %used to creater headers for output file
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
headersForOutputFile{end+1} = 'Score 1PC';
headersForOutputFile{end+1} = 'Score 2PC';
headersForOutputFile{end+1} = 'Score 3PC';
headersForOutputFile{end+1} = 'Score 4PC';
headersForOutputFile{end+1} = 'Score 5PC';
headersForOutputFile{end+1} = 'Score 6PC';
headersForOutputFile{end+1} = '1PC Vector';
headersForOutputFile{end+1} = '2PC Vector';
headersForOutputFile{end+1} = '3PC Vector';
headersForOutputFile{end+1} = '4PC Vector';
headersForOutputFile{end+1} = '5PC Vector';
headersForOutputFile{end+1} = '6PC Vector';
headersForOutputFile{end+1} = 'Explained %';

M = padcat(databaseIds,preparedData(:,1),preparedData(:,2),preparedData(:,3),preparedData(:,4),preparedData(:,5),preparedData(:,6),score(:,1),score(:,2),score(:,3),score(:,4),score(:,5),score(:,6),coeff(:,1),coeff(:,2),coeff(:,3),coeff(:,4),coeff(:,5),coeff(:,6),explained);%matrix of information that will be output to csv file
M(isnan(M))= [0]; %eliminates invalid values that might have been entered

csvwrite_with_headers('PCAAnalysisResults.csv',M,headersForOutputFile); %writing output to csv file



mapcaplot(preparedData) %%plots two-D representation of second principle component vs. first principle component

