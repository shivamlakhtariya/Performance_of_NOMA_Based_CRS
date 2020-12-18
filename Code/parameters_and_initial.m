%parameters
times=100000;                     %times of Monte Carlo experiments
terms=30;                        %number of terms of summation
m_end=100;                        %number of terms of Gasuu Chebyshev Integration

a2_start=0;                      %the power allocation coefficient
interval=0.001;
a2_end=0.5;                      

I=a2_start:interval:a2_end;      %x_axis for the simulation   

a2_start_1=0.001;                %there is an interval where the curve is very curl and needs more dots              
a2_start_2=0.01;
step=0.1;                                   
interval_a=0.05;
I_a=[a2_start_1:a2_start_1:a2_start_2-a2_start_1,a2_start_2:a2_start_2:step-a2_start_2,step:interval_a:a2_end];  %%x_axis for the approximation   


rho=100;                         %SNR
theta=pi/2;                      %Rician distribution parameter

[~,number]=size(I_a);
rho_a_v=rho*ones(1,number);
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
D=zeros(terms,terms,terms,terms,number);       %variable that stores the middle result of summation
E=zeros(terms,terms,terms,terms,number);       %variable that stores the middle result of summation

capacity=zeros((a2_end-a2_start)/interval+1,2);