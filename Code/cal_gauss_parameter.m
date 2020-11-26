function [v,sigma_square]=cal_gauss_parameter(K,sigma_l)
v=sigma_l*sqrt(K/(K+1));
sigma_square=sigma_l^2/2/(1+K);
end
