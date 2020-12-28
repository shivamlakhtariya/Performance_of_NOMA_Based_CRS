%parameters
times=100000;            %number of Monte Carlo experiments
cdf_ins=100;             %number of intervals for drawing CDF


v=5;                    %parameters of rician channel
sigma_square=8;
theta=pi/2;


%initialization
r=zeros(times,1);

%generating rician chanel
for i=1:times
r(i,1)=gen_rician(v,sigma_square);

end

%calculating parameters for drawing PDF
range=max(r);
interval=range/100;

%scatch the CDF and PDF of rician channel
[m,y]=hist(r,cdf_ins);
[n,x]=hist(r,0:interval:range);
pdf_rate=n/numel(r)/interval;
cdf_rate=cumsum(m)/numel(r);

%the pdf function of rician channel
z=0:interval:range;           %the independent variable of pdf function
f_z=z/sigma_square.*exp(-(z.^2+v^2)/2/sigma_square).*besseli(0,z*v/sigma_square);

plot(x,pdf_rate,'*',z,f_z,'r');
grid on;

