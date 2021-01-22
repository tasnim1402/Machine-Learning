A =[293	0.058
298	0.078
303	0.1037
308	0.1365
313	0.1777
318	0.2291
323	0.2928
328	0.3708
333	0.4658
338	0.5806
343	0.7184
348	0.8825
353	1.0769
358	1.3057
363	1.5736
];   %Copied the data from the spreadsheet
B = xlsread('ethanol_psat_data.xlsx'); % used 'xlsread' function to fetch data from xls
T=A(:,1);
P=A(:,2);
y=log10(P);
x0=ones(length(T),1);
x1=1./T;
x2=log10(P)./T;
A=[x0,x1,x2];
b=y;
x=A\b;
AA=x(1);
AC=-x(3);
AB=AA*AC-x(2);
plot(T,P,'o',T,10.^(AA-AB./(T+AC)))
