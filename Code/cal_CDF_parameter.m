function [a,A,Bp]=cal_CDF_parameter(K,sigma_l,m)

a=(1+K)/sigma_l^2;
A=a*exp(-K);
Bp=(K^m)*((1+K)^m)/((sigma_l^(2*m))*a^(m+1)*factorial(m));

end
