%parameters
alpha=8;
beta=0.9;
m_start=1;
m_end=1000;

result=zeros(1,m_end);
temp=zeros(m_end,m_end);

for m=1:m_end

    
    for l=1:m

    temp(m,l)=(cos(cal_frac(l,m)*pi)+1)^(alpha-1)*exp(-2*beta/(cos(cal_frac(l,m)*pi)+1))*abs(sin(cal_frac(l,m)*pi));
    end
    
    result(1,m)=(1/2/beta)^alpha*pi/m*sum(temp(m,:));



end

plot(result);



