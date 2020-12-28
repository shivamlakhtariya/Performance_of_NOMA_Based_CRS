
%calculating corresponding Gaussian distribution
[v_sr,sigma_square_sr]=cal_gauss_parameter(K_sr,sigma_l_sr);
[v_sd,sigma_square_sd]=cal_gauss_parameter(K_sd,sigma_l_sd);
[v_rd,sigma_square_rd]=cal_gauss_parameter(K_rd,sigma_l_rd);


%start simulating

for j=1:(a2_end-a2_start)/interval+1

    for i=1:times
    z(i,1)=gen_rician(v_sr,sigma_square_sr)^2;
    
    z(i,2)=gen_rician(v_sd,sigma_square_sd)^2;
    
    z(i,3)=gen_rician(v_rd,sigma_square_rd)^2;
    
    temp(i,1)=min(z(i,1),z(i,2));
    value(i,1)=0.5*(log2(1+temp(i,1)*rho)-log2(1+temp(i,1)*rho*(a2_start+(j-1)*interval)));
    
    temp(i,2)=min(z(i,1)*(a2_start+(j-1)*interval),z(i,3));
    value(i,2)=0.5*log2(1+rho*temp(i,2));
    end
   
    capacity(j,1)=mean(value(:,1));
    capacity(j,2)=mean(value(:,2));
  
    
end

  capacity_sum=capacity(:,1)+capacity(:,2);