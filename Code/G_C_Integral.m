%we calculate the function gamma(-alpha,beta) using gauss_chebyshev_integration
function [r]=G_C_Integral(alpha,beta,m_end)

temp=zeros(m_end,1);         %variable used to store the value of the integral



    
    for l=1:m_end

    temp(l,1)=(cos(cal_frac(l,m_end)*pi)+1)^(alpha-1)*exp(-2*beta/(cos(cal_frac(l,m_end)*pi)+1))*abs(sin(cal_frac(l,m_end)*pi));
    end
    
  r=(1/2/beta)^alpha*pi/m_end*sum(temp);









