*SoMs Analysis*

STEP 1)

To enter user inputs, open the UserInput.xlsx file

To select the input variables, enter the number associated to each variable listed below in each consective highlighted cell from A6 to F6 respectively
[2]- retweet_count
[3] - user_favourites_count
[4] - user_listed_count
[5] - user_friends_count
[6] - user_statuses_count
[7] - favourite count

ex 1. to utilize the information related to [2] , [3], and [4]...
--> Open UserInput.xlsx--> in ROW: A6, B6, and C6 respectively --> Type 2,3,4 seperately in each consecutive cell and ensure all other highlighted cells are empty --> Go to STEP 2)

ex 2. to utilize variables [2], [4], [7]
--> Open UserInput.xlsx--> in ROW: A6, C6, and F6 respectively --> Type 2,4,7 seperately in each consecutive cell and ensure all other highlighted cells are empty --> Go to STEP 2)

STEP 2)

To pick the neurons wanted, enter the following number combinations below for the selected neuron amount. 

Note: The more neurons being utilized, the longer run time to generate the SoM's.for the number combinations [N X], a N-by-S matrix of N coordinate vectors where N is the number of 
dimensions and S is the product of dimensions is returned 2,5 means a 2 dimensional (N=2) matrix with 10 neurons (S=N*X=2*5=10) will be returned (i.e a 2 x 10 matrix)
 
2-Dimensional Neurons (Most typically used, for simplification of higher dimensional data analysis)

2,1 - 2 neurons

2,2 - 4 neurons

2,3 - 6 neurons

....

2,X - (2*X) neurons, where N is a positive integer

N-Dimensional Neurons

N,X- (N*X) neurons, where N is a positive integer

ex 1. to generate 2-D 6 neurons

In UserInput.xlsx --> in ROW: A12 and B12 respectively --> Type 2,3 seperately in each consecutive highlighted cell --> save .xlsx file and close --> run SoMs_Script.m in MATLAB


*k-means Analysis*

After SoMs analysis, k-means analysis can be used to further prove or analysis correlations amongst variables, as shown below

STEP 1)

To enter user inputs, open the UserInput.xlsx file

To select the input variables, in the UserInput.xlsx file, enter the numbers associated to two variable listed below in each consective highlighted cell from A19 to F19 respectively

[2]- retweet_count
[3] - user_favourites_count
[4] - user_listed_count
[5] - user_friends_count
[6] - user_statuses_count
[7] - favourite count

ex 1. to utilize the information related to [2] , [3],
--> Open UserInput.xlsx--> in ROW: A19 and B19 respectively --> Type 2,3 seperately in thier respective cell  --> save .xlsx file 

ex 2. to utilize the information related to [2] , [3], [4], [5]
--> Open UserInput.xlsx--> in ROW: A19 to F19 respectively --> Type 2,3,4,5 seperately in thier respective cell  --> save .xlsx file 

STEP 2)
To select the logbase and centroids required, in the UserInput.xlsx file, enter the numbers associated to the variable listed below in the highlighted cell from H19. For the centroids, enter
a centroid amount (maximum 6 centroids) in the highlighted cell I19



ex 1. to use the natural logarithmic base and 3 centroids... 
--> Open UserInput.xlsx--> in ROW: H19 and I19 respectively --> Type 1 and 3 seperately in their respective cell  --> save .xlsx file and close --> run kmean_Script.m in MATLAB

*PCA analysis*

NOTE: MUST DOWNLOAD BIOINFORMATICS TOOLKIT BOX FROM MATLAB TO USE THIS SCRIPT

PCA analysis can be used to further prove or analysis correlations amongst variables, as shown below

STEP 1)

To enter user inputs, open the UserInput.xlsx file

To select the input variables, in the UserInput.xlsx file, enter the numbers associated to two variable listed below in each consective highlighted cell from A38 to F38 respectively

[2]- retweet_count
[3] - user_favourites_count
[4] - user_listed_count
[5] - user_friends_count
[6] - user_statuses_count
[7] - favourite count

ex 1. to utilize the information related to [2] , [3],
--> Open UserInput.xlsx--> in ROW: A38 and B38 respectively --> Type 2,3 seperately in thier respective cell  --> save .xlsx file 

ex 2. to utilize the information related to [2] , [3], [4], [5]
--> Open UserInput.xlsx--> in ROW: A38 and F38 respectively --> Type 2,3,4,5 seperately in thier respective cell  --> save .xlsx file 

STEP 2)
To select the logbase , in the UserInput.xlsx file, enter the numbers associated to the variable listed below in the highlighted cell from H38.

ex 1. to use the natural logarithmic base 
--> Open UserInput.xlsx--> in ROW: H38  --> Type 1 --> save .xlsx file and close --> run PCA_Script.m in MATLAB


NOTE: The results of each script is output into the same directory the scripts are in