parameters_and_initial;

simulation_capacity;

 
appro_of_C_1;        

%Initialization
D=zeros(terms,terms,terms,terms,(a2_end-a2_start)/interval_a+1);       %variable that stores the middle result of summation
E=zeros(terms,terms,terms,terms,(a2_end-a2_start)/interval_a+1);       %variable that stores the middle result of summation

appro_of_C_2;
 
C_sum=C_1+C_2;

%use result_1 denote simulation of capacity 1,result_2 denote simulation of capacity 2,result_s denote
%simulation of sum capacity 

plot(I,capacity(:,1),'r',I_a,C_1,'o',I,capacity(:,2),'b',I_a,C_2,'*',I,capacity_sum,'y',I_a,C_sum,'+');
 
  grid on;
  
 








