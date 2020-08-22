%compare payments and total cost of a 15 vs 30 year fixed mortage

%clear workspace
clear;

%add known values
mortagePlans = [ 
    %in years
    15
    30
];
downPayment = 10 * 10 ^ 3;
borrowingPrincipal = 11 * 10 ^ 4;
totalCost = downPayment + borrowingPrincipal;
interestRate = 5.25 / 100; %turn known percent to decimal
x = length(mortagePlans); %define total plans for later

%calculate the principal loan amount multiplied by (interest rate / 12
%months)
j = borrowingPrincipal * (interestRate / 12);

%loop through each mortage plan
for i = 1:x
    %calculate each monthly cost and store it in the mortagePlans array on the same line as the years paying 
    mortagePlans(i, 2) = j / (1 - (1 + interestRate / 12) ^ (-12 * mortagePlans(i, 1)));
    %calculate total costs for each plan
    mortagePlans(i, 3) = mortagePlans(i, 2) * 12 * mortagePlans(i, 1) + downPayment;
end

%loop through again to find differences
for i = 2:x + 1
    %find difference and save to bottom of array
    mortagePlans(3, i) = mortagePlans(1, i) - mortagePlans(2, i);
end

%show the monthly payment difference of 15 vs 30 years 
monthlyPaymentDifference = mortagePlans(3,2);
%show the total cost difference of 15 vs 30 years and round to whole
%number to make easier to read
totalCostDifference = round(mortagePlans(3,3));

%clear old data
clearvars -except totalCostDifference monthlyPaymentDifference