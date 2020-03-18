%% Mean
dataA = readtable('Insititute_A/Mean.csv');
dataB = readtable('Insititute_B/Mean.csv');
dataC = readtable('Insititute_C/Mean.csv');
% input variable: weight
meanWeight = mean([dataA.weight;dataB.weight;dataC.weight]);
% result : 74.56
% input variable: height
meanHeight = mean([dataA.height;dataB.height;dataC.height]);
% result : 1.6784
% input variable: age
meanAge = mean([dataA.age;dataB.age;dataC.age]);
% result : 70.0936
clear;

%% Min/Max
dataA = readtable('Insititute_A/minMax.csv');
dataB = readtable('Insititute_B/minMax.csv');
dataC = readtable('Insititute_C/minMax.csv');
% input variable: time
minTime = min([dataA.time;dataB.time;dataC.time]);
maxTime = max([dataA.time;dataB.time;dataC.time]);
% result : 5/1022
% input variable: mealcal
minMealcal = min([dataA.mealcal;dataB.mealcal;dataC.mealcal]);
maxMealcal = max([dataA.mealcal;dataB.mealcal;dataC.mealcal]);
% result : 96/2600
% input variable: age
minAge = min([dataA.age;dataB.age;dataC.age]);
maxAge = max([dataA.age;dataB.age;dataC.age]);
% result : 39/82
clear;

%% Median
dataA = readtable('Insititute_A/median.csv');
dataB = readtable('Insititute_B/median.csv');
dataC = readtable('Insititute_C/median.csv');
% input variable: time
medianTime = median([dataA.time;dataB.time;dataC.time]);
% result : 268
% input variable: mealcal
medianMealcal = median([dataA.mealcal;dataB.mealcal;dataC.mealcal]);
% result : 975
% input variable: age
medianAge = median([dataA.age;dataB.age;dataC.age]);
% result : 64
clear;

%% standard deviation
dataA = readtable('Insititute_A/standardDeviation.csv');
dataB = readtable('Insititute_B/standardDeviation.csv');
dataC = readtable('Insititute_C/standardDeviation.csv');
% input variable: time
stdTime = std([dataA.time;dataB.time;dataC.time]);
% result : 9.2107
% input variable: mealcal
stdMealcal = std([dataA.mealcal;dataB.mealcal;dataC.mealcal]);
% result : 413.4898
% input variable: age
stdAge = std([dataA.age;dataB.age;dataC.age]);
% result : 209.4356
clear;

%% ks test
dataA = readtable('Insititute_A/Kolmogorov-Smirnov_test_dataset.csv');
dataB = readtable('Insititute_B/Kolmogorov-Smirnov_test_dataset.csv');
dataC = readtable('Insititute_C/Kolmogorov-Smirnov_test_dataset.csv');
% % input variable: attributes:weight group:sex  >
attributes = [dataA.weight;dataB.weight;dataC.weight];
group_1_idx = [dataA.sex;dataB.sex;dataC.sex] == 1;
group_2_idx = [dataA.sex;dataB.sex;dataC.sex] == 2;
attributes_2 = attributes(group_1_idx);
attributes_1 = attributes(group_2_idx);
[h1,p1,k1] = kstest2(attributes_1,attributes_2,'Tail','larger');
% % result : 4.2732*10^-21
% % input variable: attributes:weight group:sex <
attributes = [dataA.weight;dataB.weight;dataC.weight];
group_1_idx = [dataA.sex;dataB.sex;dataC.sex] == 1;
group_2_idx = [dataA.sex;dataB.sex;dataC.sex] == 2;
attributes_2 = attributes(group_1_idx);
attributes_1 = attributes(group_2_idx);
[h2,p2,k2] = kstest2(attributes_1,attributes_2,'Tail','smaller');
% % result : 0.94
% % input variable: attributes:weight group:sex !=
attributes = [dataA.weight;dataB.weight;dataC.weight];
group_1_idx = [dataA.sex;dataB.sex;dataC.sex] == 1;
group_2_idx = [dataA.sex;dataB.sex;dataC.sex] == 2;
attributes_2 = attributes(group_1_idx);
attributes_1 = attributes(group_2_idx);
[h3,p3,k3] = kstest2(attributes_1,attributes_2,'Tail','unequal');
% % result : 8.5462*10^-21
clear;

%% Chi-squared test
dataA = readtable('Insititute_A/Chi-squared_test_dataset.csv');
dataB = readtable('Insititute_B/Chi-squared_test_dataset.csv');
dataC = readtable('Insititute_C/Chi-squared_test_dataset.csv');
% % input dim1 = weight [0,40,80] dim2 = sex [1,2]
dim1 = [dataA.weight;dataB.weight;dataC.weight];
dim2 = [dataA.sex;dataB.sex;dataC.sex];
count1 = dim1>=0&dim1<40;
count2 = dim1>=40&dim1<80;
count3 = dim1>=80;
dim1(count1) = 1;
dim1(count2) = 2;
dim1(count3) = 3;
[tbl1,chi1,pvalue1] = crosstab(dim1,dim2);
% % result: pvalue = 0.2738 chi = 2.5905 
% % input dim1 = age [0,40,80] dim2 = sex [1,2]
dim1 = [dataA.age;dataB.age;dataC.age];
dim2 = [dataA.sex;dataB.sex;dataC.sex];
count1 = dim1>=0&dim1<40;
count2 = dim1>=40&dim1<80;
count3 = dim1>=80;
dim1(count1) = 1;
dim1(count2) = 2;
dim1(count3) = 3;
[tbl2,chi2,pvalue2] = crosstab(dim1,dim2);
% % result: pvalue = 0.1016 chi = 4.574 
% % input dim1 = weight [0,40,80] dim2 = censor [0,1]
dim1 = [dataA.weight;dataB.weight;dataC.weight];
dim2 = [dataA.censor;dataB.censor;dataC.censor];
count1 = dim1>=0&dim1<40;
count2 = dim1>=40&dim1<80;
count3 = dim1>=80;
dim1(count1) = 1;
dim1(count2) = 2;
dim1(count3) = 3;
[tbl3,chi3,pvalue3] = crosstab(dim1,dim2);
% % result: pvalue = 0.9014 chi = 0.2076 

















