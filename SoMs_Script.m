clear %used to erase any variables that may have already been in the workspace

datainfo = csvread('Toutput_24M.csv', 1); %reads in the input matrix starting at row 2 (indexing starts at 0 therefore 1 used)
info_input = xlsread('UserInput.xlsx', 'A6:F6');%reads in the required information, check the README.txt and UserInput.txt files for more information
neurons = xlsread('UserInput.xlsx', 'A12:B12');%reads in neurons required,check the README.txt and UserInput.txt files for more information
info_input(isnan(info_input))= [];
data = datainfo(:, info_input);%splices input matrix in terms of information required listed in UserInput.txt file
ids = datainfo(:, [1]);%splices the id information related to each row of information to match it to main database
x = data';%transposes prepared input matrix for SoM analysis
xer = {'ids'};
% Create a Self-Organizing Map
net = selforgmap(neurons);

% Train the Network
[net,tr] = train(net,x);

% Test the Network
y = net(x);

% View the Network
%view(net)

classes = vec2ind(y);%provides information on which input information row refers to which neuron
sizeofinfoinput = size(info_input,2);
for i= 1:sizeofinfoinput
    if info_input(i)==2
        xer{end+1} = 'retweet_count';
    elseif info_input(i) == 3
         xer{end+1} = 'user_favourites_count';
    elseif info_input(i) == 4
         xer{end+1} = 'user_listed_count';
    elseif info_input(i) == 5
         xer{end+1} = 'user_friends_count'; 
    elseif info_input(i) == 6
         xer{end+1} = 'user_statuses_count'; 
    elseif info_input(i) == 7
         xer{end+1} = 'favorite_count'; 
    end
end

xer{end+1} = 'neuron';
           
datainfo  = [ids data classes']; %resultant output matrix including id, prepared input matrix and associated neurons

csvwrite_with_headers('SoMsAnalysisResults.csv',datainfo,xer);

% Plots
figure, plotsomtop(net) %generates Topology SOM
figure, plotsomnc(net) %generates Neighbour Connections SOM
figure, plotsomnd(net) %generates Neighbour Distance SOM
figure, plotsomplanes(net) %generates Input Planes SOM
figure, plotsomhits(net,x) %generates Sample Hits SOM
figure, plotsompos(net,x) %generates Weight Position SOM
