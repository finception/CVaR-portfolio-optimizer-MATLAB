%open("data file.xlsx")
%T=readtable("data file.xlsx")
format bank
%MS-50	MFCSCSH	Mproperty	MFCMGOV	DBC	GLD	BND	EMB	RWO	URTH	VEA	VWO	MOAT	VBR



T=coreport14;
symbol=T.Properties.VariableNames(2:end);%extract the names of the index members from table
MonthlyReturn= tick2ret(T{:,2:end});
means_arjun=mean(MonthlyReturn);
covararjun=cov(MonthlyReturn);
Div= [0.00225	0	0.004733333	0	0.0005	0	0.001933333	0.004	0.002916667	0.001333333	0.00225	0.003083333	0.000916667	0.001583333];

S= means_arjun+Div;

%form portfolio objective
AssetScenarios = mvnrnd(S, covararjun, 1000000);
p=PortfolioCVaR('AssetMean',S,'Assetlist',symbol, 'RiskFreeRate', 0.0134/12);
p = setScenarios(p, AssetScenarios);
p = setDefaultConstraints(p);
p = setProbabilityLevel(p, 0.90);
p.LowerBudget=0.98;
p.UpperBudget=0.98;

%form portfolio objective

p = simulateNormalScenariosByMoments(p,S,covararjun,100000);

%Adding constraint for MS-50 (1)
A= [-1 0 0 0 0 0 0 0 0 0 0 0 0 0];
b= [-0.08];
p=setInequality(p,A,b);

%Adding constraint for MS-50 (1)
A= [1 0 0 0 0 0 0 0 0 0 0 0 0 0];
b= [0.20];
p=addInequality(p,A,b);

%Adding floor for MFCSC (2)
A= [0 -1 0 0 0 0 0 0 0 0 0 0 0 0];
b= [-0.04];
p=addInequality(p,A,b);

%Adding ceiling for MFCSC (2)
A= [0 1 0 0 0 0 0 0 0 0 0 0 0 0];
b= [0.12];
p=addInequality(p,A,b);

%Adding floor for M-property (3)
A= [0 0 -1 0 0 0 0 0 0 0 0 0 0 0];
b= [-0.10];
p=addInequality(p,A,b);

%Adding ceiling for M-property (3)
A= [0 0 1 0 0 0 0 0 0 0 0 0 0 0];
b= [0.15];
p=addInequality(p,A,b);

%Adding floor for MFC smart (4)
A= [0 0 0 -1 0 0 0 0 0 0 0 0 0 0];
b= [-0.02];
p=addInequality(p,A,b);

%Adding ceiling MFC smart (4)
A= [0 0 0 1 0 0 0 0 0 0 0 0 0 0];
b= [0.06];
p=addInequality(p,A,b);

%Adding Thai assets to the mix (4)
A= [-1 -1 -1 -1 0 0 0 0 0 0 0 0 0 0];
b= [-0.10];
p=addInequality(p,A,b);


%Adding floor for DBC (5)
A= [0 0 0 0 -1 0 0 0 0 0 0 0 0 0];
b= [-0.03];
p=addInequality(p,A,b);

%Adding ceiling for DBC (5)
A= [0 0 0 0 1 0 0 0 0 0 0 0 0 0];
b= [0.12];
p=addInequality(p,A,b);

%Adding floor for GLD (6)
A= [0 0 0 0 0 -1 0 0 0 0 0 0 0 0];
b= [-0.03];
p=addInequality(p,A,b);

%Adding ceiling for GLD (6)
A= [0 0 0 0 0 1 0 0 0 0 0 0 0 0];
b= [0.14];
p=addInequality(p,A,b);


%Adding floor for BND (7)
A= [0 0 0 0 0 0 -1 0 0 0 0 0 0 0];
b= [-0.05];
p=addInequality(p,A,b);

%Adding ceiling for BND (7)
A= [0 0 0 0 0 0 1 0 0 0 0 0 0 0];
b= [0.10];
p=addInequality(p,A,b);


%Adding floor for EMB (8)
A= [0 0 0 0 0 0 0 -1 0 0 0 0 0 0];
b= [-0.05];
p=addInequality(p,A,b);

%Adding ceiling for EMB (8)
A= [0 0 0 0 0 0 0 1 0 0 0 0 0 0];
b= [0.15];
p=addInequality(p,A,b);

%Adding floor for RWO (9)
A= [0 0 0 0 0 0 0 0 -1 0 0 0 0 0];
b= [-0.10];
p=addInequality(p,A,b);

%Adding ceiling for RWO (9)
A= [0 0 0 0 0 0 0 0 1 0 0 0 0 0];
b= [0.20];
p=addInequality(p,A,b);

%Adding floor for URTH (10)
A= [0 0 0 0 0 0 0 0 0 -1 0 0 0 0];
b= [-0.10];
p=addInequality(p,A,b);

%Adding ceiling for URTH (10)
A= [0 0 0 0 0 0 0 0 0 1 0 0 0 0];
b= [0.20];
p=addInequality(p,A,b);


%Adding constraint VEA (11)
A= [0 0 0 0 0 0 0 0 0 0 -1 0 0 0];
b= [-0.03];
p=addInequality(p,A,b);

%Adding ceiling for VEA (11)
A= [0 0 0 0 0 0 0 0 0 0 1 0 0 0];
b= [0.20];
p=addInequality(p,A,b);

%Adding floor for VWO (12)
A= [0 0 0 0 0 0 0 0 0 0 0 -1 0 0];
b= [-0.03];
p=addInequality(p,A,b);

%Adding ceiling for VWO (12)
A= [0 0 0 0 0 0 0 0 0 0 0 1 0 0];
b= [0.20];
p=addInequality(p,A,b);

%Adding floor for MOAT (13)
A= [0 0 0 0 0 0 0 0 0 0 0 0 -1 0];
b= [-0.20];
p=addInequality(p,A,b);

%Adding ceiling for MOAT (13)
A= [0 0 0 0 0 0 0 0 0 0 0 0 1 0];
b= [0.20];
p=addInequality(p,A,b);

%Adding floor for VBR (14)
A= [0 0 0 0 0 0 0 0 0 0 0 0 0 -1];
b= [-0.08];
p=addInequality(p,A,b);

%Adding ceiling for VBR (14)
A= [0 0 0 0 0 0 0 0 0 0 0 0 0 1];
b= [0.20];
p=addInequality(p,A,b);

%Adding equity max constraint
A= [0 0 0 0 0 0 0 0 0 1 1 1 1 1];
b= [0.60];
p=addInequality(p,A,b);




%analysing portfolio
[Pi_wealthportfolio] = estimateFrontierByRisk(p,.0511);
display(Pi_wealthportfolio);
%[risk1,ret1]= estimatePortMoments(p,Pi_wealthportfolio);
[prsk1, pret1]= plotFrontier(p,20);

pvar = estimatePortVaR(p,Pi_wealthportfolio);
prsk = estimatePortRisk(p,Pi_wealthportfolio);
pstd = estimatePortStd(p,Pi_wealthportfolio);
pret = estimatePortReturn(p,Pi_wealthportfolio);




%plotting the pie chart 
X=transpose(Pi_wealthportfolio);

X1=X(1,1:end);

subplot(1,2,2)
y1=pie(X1);
y1(1).FaceColor= 'green';
y1(3).FaceColor= 'red';
y1(5).FaceColor='magenta';
y1(7).FaceColor='.255 .255 .255';
y1(9).FaceColor='cyan';
y1(11).FaceColor='[.5 .4 0]';
y1(13).FaceColor='[.84 .111 .255]';
y1(15).FaceColor='[.4940 .1840 .5560]';
y1(17).FaceColor='[.20 .40 .28]';
y1(19).FaceColor=['.196 .232 .82'];
y1(21).FaceColor=['.85 .3250 .0980'];
y1(23).FaceColor=['yellow'];
y1(25).FaceColor=['0 0 0'];
y1(27).FaceColor=['.139 .11 .51'];
title('Risklevel_9')
lgd1 = legend(symbol);

subplot(1,2,1)
D= {'Thai assets','Global bond','Global REITs','Commodity','Global equity'};
X_asset=[sum(X(1:4)) sum(X(7:8)) sum(X(9)) sum(X(5:6)) sum(X((10:14)))];
y2=pie(X_asset);
lgd = legend(D,'location','East');


format short

Pi_portfolioreturn=pret*12;
Pi_portfiliorisk=prsk*sqrt(12);

%subplot(1,3,3)
%[prsk,pret] = plotFrontier(p,20);

