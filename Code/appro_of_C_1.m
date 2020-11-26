   %the approximation fomula of capacity_1
  [a_sd,A_sd,~]=cal_CDF_parameter(K_sd,sigma_l_sd,1);
  [a_sr,A_sr,~]=cal_CDF_parameter(K_sr,sigma_l_sr,1);
  
  for n=0:terms-1
      for k=0:terms-1
          
          [~,~,Bp_sd]=cal_CDF_parameter(K_sd,sigma_l_sd,n);
          [~,~,Bp_sr]=cal_CDF_parameter(K_sr,sigma_l_sr,k);
          for i=0:n
              for j=0:k
                  for m=1:number
                  D(n+1,k+1,i+1,j+1,m)=Bp_sd*Bp_sr*(factorial(i+j)/factorial(i)/factorial(j))*(a_sd^i*a_sr^j/(rho_a_v(1,m)^(i+j)))*exp((a_sd+a_sr)/rho_a_v(1,m))*G_C_Integral(i+j,(a_sd+a_sr)/rho_a_v(1,m),m_end);
                  E(n+1,k+1,i+1,j+1,m)=Bp_sd*Bp_sr*(factorial(i+j)/factorial(i)/factorial(j))*(a_sd^i*a_sr^j/(I_a_v(1,m)^(i+j)))*exp((a_sd+a_sr)/I_a_v(1,m))*G_C_Integral(i+j,(a_sd+a_sr)/I_a_v(1,m),m_end);   
                  
                  end
                  
              end
              
          end
      end
      
  end
C_1=1/2/log(2)*A_sd*A_sr*(sum(sum(sum(sum(D))))-sum(sum(sum(sum(E)))));        
C_1=reshape(C_1,1,[]);

