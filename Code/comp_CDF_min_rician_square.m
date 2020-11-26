%parameters
times=100000;            %number of Monte Carlo experiments
cdf_ins=100;             %number of intervals for drawing CDF
terms=200;                %number of summation

K_x=4;                     %parameters of rician channel
sigma_l_x=1;
K_y=3;
sigma_l_y=0.5;

[v_x,sigma_square_x]=cal_gauss_parameter(K_x,sigma_l_x);      %parameters of corresponding gauss variable    
[v_y,sigma_square_y]=cal_gauss_parameter(K_y,sigma_l_y); 


theta=pi/2;


%initialization
r_square=zeros(times,1);


%generating min of square of rician chanel
for i=1:times
r_square(i,1)=min(gen_rician(v_x,sigma_square_x)^2,gen_rician(v_y,sigma_square_y)^2);

end


%calculating parameters for drawing PDF
range=max(r_square);
interval=range/100;

%scatch the CDF and PDF of min of square of rician channel 
[m,y]=hist(r_square,cdf_ins);
[n,x]=hist(r_square,0:interval:range);
pdf_rate=n/numel(r_square)/interval;
cdf_rate=cumsum(m)/numel(r_square);

%the approximation of CDF 
z=0:interval:range;
value=zeros(terms,terms,range/interval+1);
Bp_x=zeros(terms,1);
Bp_y=zeros(terms,1);


[a_x,A_x,~]=cal_CDF_parameter(K_x,sigma_l_x,1);
[a_y,A_y,~]=cal_CDF_parameter(K_y,sigma_l_y,1);


for i=0:terms-1
    for j=0:terms-1
       [~,~,Bp_x(i+1,1)]=cal_CDF_parameter(K_x,sigma_l_x,i);
       [~,~,Bp_y(j+1,1)]=cal_CDF_parameter(K_y,sigma_l_y,j);
       value(i+1,j+1,:)=Bp_x(i+1,1)*Bp_y(j+1,1).*gammainc(a_x*z,i+1,'upper').*gammainc(a_y*z,j+1,'upper');
       
    end
    
    
end
F_z=1-A_x*A_y*sum(sum(value,1),2);
F_z=reshape(F_z,1,[]);


plot(y,cdf_rate,'*',z,F_z,'r');
grid on;

