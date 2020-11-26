%the approximation fomula of capacity_2 
  [a_rd,A_rd,~]=cal_CDF_parameter(K_rd,sigma_l_rd,1);
  [a_sr,A_sr,~]=cal_CDF_parameter(K_sr,sigma_l_sr,1);
  
  for n=0:terms-1
      for k=0:terms-1
          
          [~,~,Bp_rd]=cal_CDF_parameter(K_rd,sigma_l_rd,n);
          [~,~,Bp_sr]=cal_CDF_parameter(K_sr,sigma_l_sr,k);
          for i=0:n
              for j=0:k
                  for m=1:number
                  D(n+1,k+1,i+1,j+1,m)=Bp_rd*Bp_sr*(factorial(i+j)/factorial(i)/factorial(j))*(a_rd^i*(a_sr/I_a(1,m))^j/(rho_a_v(1,m)^(i+j)))*exp((a_rd+a_sr/I_a(1,m))/rho_a_v(1,m))*G_C_Integral(i+j,(a_rd+a_sr/I_a(1,m))/rho_a_v(1,m),m_end);
         
                  
                  end
                  
              end
              
          end
      end
      
  end
C_2=1/2/log(2)*A_rd*A_sr*sum(sum(sum(sum(D))));        
C_2=reshape(C_2,1,[]);          