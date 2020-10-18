%%VECTORS AND MATRICES

%Inputing a list of numbers
%A 1x4 list
b = [5, 6, 7, 8];
%To have a vertical list we use semicolons


e = [1;5;3];
%A multidimensional list
%A matrix
f = [1,2,3;
    4,5,6;
    7,8,9];


%Instead of indicating a list of numbers
%We use range
%This is done using a semi-colon
%Default step is 1
g = [5:10];


%To specify the number of values
%We can use a more convenient function
%Linspace
%The third argument is the number of values
h = linspace(4, 15, 20);


%A similar result can be gotten using the colon
j = [4 : 0.5 : 16];


%Loading the saved variable B
load("Learning\B.mat", "B")

%Exporting variable h as an xls file
xlswrite("Learning\h.xls",h)

%Exporting as csv
csvwrite("Learning\j.csv", j)

%Exporting as a single file with both variables
csvwrite("Learning\combination.csv", h,j, g)

%Transposing the vector to form a column vector
k = [1: 0.4 : 10]';


%Transposing matrices
trans = [1,2,3;
    4,5,6;
    7,8,9;
    10,11,12];

%Transposing is done using an apostrophe
trans = trans';
trans;


%Addition and subtracton
add1 = [1,2,3;
    4,5,6];
add2= [2,3,4;
    5,6,7];
sum = add1 + add2;
difference = add2 - add1;


%Multiplication and division
