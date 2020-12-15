%parameters
times=1000000;                     %times of Monte Carlo experiments
terms=20;                        %number of terms of summation
m_end=30;                        %number of terms of Gasuu Chebyshev Integration

a2_start=0;                      %the power allocation coefficient
interval=0.01;
a2_end=0.5;                      

I=a2_start:interval:a2_end;    

interval_a=0.01;
I_a=a2_start:interval_a:a2_end;  %%x_axis for the approximation   

rho=20;                         %SNR
theta=pi/2;                      %Rician distribution parameter

rho_a_v=rho*ones(1,(a2_end-a2_start)/interval_a+1);
I_a_v=rho*I_a;

%parameters of Rician fading channel
K_sd=2;
sigma_l_sd=3;

K_sr=5;
sigma_l_sr=6;

K_rd=5;
sigma_l_rd=6;

%initialization
z=zeros(times,3);               %variable that stores the square of length of path sr/sd/rd 
temp=zeros(times,2);            %variable that stores the min of three channels
value=zeros(times,2);           %variable that stores the capacity of every experiment
D=zeros(terms,terms,terms,terms,(a2_end-a2_start)/interval+1);       %variable that stores the middle result of summation
E=zeros(terms,terms,terms,terms,(a2_end-a2_start)/interval+1);       %variable that stores the middle result of summation

capacity=zeros((a2_end-a2_start)/interval+1,2);

%chanel 1

 [a_sd,A_sd,~]=cal_CDF_parameter(K_sd,sigma_l_sd,1);
  [a_sr,A_sr,~]=cal_CDF_parameter(K_sr,sigma_l_sr,1);
  
  for n=0:terms-1
      for k=0:terms-1
          
            [~,~,Bp_sd]=cal_CDF_parameter(K_sd,sigma_l_sd,n);
            [~,~,Bp_sr]=cal_CDF_parameter(K_sr,sigma_l_sr,k);
          for i=0:n
              for j=0:k
                  for m=1:(a2_end-a2_start)/interval_a+1
                   D(n+1,k+1,i+1,j+1,m)=Bp_sd*Bp_sr*(factorial(i+j)/factorial(i)/factorial(j))*(a_sd^i*a_sr^j/(rho_a_v(1,m)^(i+j)))*exp((a_sd+a_sr)/rho_a_v(1,m))*G_C_Integral(i+j,(a_sd+a_sr)/rho_a_v(1,m),m_end);
                  E(n+1,k+1,i+1,j+1,m)=Bp_sd*Bp_sr*(factorial(i+j)/factorial(i)/factorial(j))*(a_sd^i*a_sr^j/(I_a_v(1,m)^(i+j)))*exp((a_sd+a_sr)/I_a_v(1,m))*G_C_Integral(i+j,(a_sd+a_sr)/I_a_v(1,m),m_end);   
                  
                  
                  
                  end
                  
              end
              
          end
      end
      
  end
C_1=1+1/2/log(2)*A_sd*A_sr*(sum(sum(sum(sum(D))))-sum(sum(sum(sum(E)))));        
C_1=reshape(C_1,1,[]);        
          



%the approximation fomula of capacity_2 
  [a_rd,A_rd,~]=cal_CDF_parameter(K_rd,sigma_l_rd,1);
  [a_sr,A_sr,~]=cal_CDF_parameter(K_sr,sigma_l_sr,1);
  
  for n=0:terms-1
      for k=0:terms-1
          
          [~,~,Bp_rd]=cal_CDF_parameter(K_rd,sigma_l_rd,n);
          [~,~,Bp_sr]=cal_CDF_parameter(K_sr,sigma_l_sr,k);
          for i=0:n
              for j=0:k
                  for m=1:(a2_end-a2_start)/interval_a+1
                  D(n+1,k+1,i+1,j+1,m)=Bp_rd*Bp_sr*(factorial(i+j)/factorial(i)/factorial(j))*(a_rd^i*(a_sr/I_a(1,m))^j/(rho_a_v(1,m)^(i+j)))*exp((a_rd+a_sr/I_a(1,m))/rho_a_v(1,m))*G_C_Integral(i+j,(a_rd+a_sr/I_a(1,m))/rho_a_v(1,m),m_end);
                  
                  
                  end
                  
              end
              
          end
      end 
      
  end
C_2=1/2/log(2)*A_rd*A_sr*sum(sum(sum(sum(D))));        
C_2=reshape(C_2,1,[]);          
C_sum=C_1+C_2;         
         
  plot(I_a,C_1,'-r*')
  grid on;
  hold on;
  plot(I_a,C_2,'-k*');
  hold on;
  plot(I_a,C_sum,'-bd');
  legend('Signal 1','Signal 2','Sum Rate')
 xlabel('Power allocation coefficient a2');
 ylabel('Avarage achievable rate(bits/Hz)');
  
  %ylim([0,6]);