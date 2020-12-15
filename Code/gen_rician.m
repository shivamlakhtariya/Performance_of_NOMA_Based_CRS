function[r]=gen_rician(v,sigma_square)
theta=pi/2;

x=v*cos(theta)+sqrt(sigma_square)*randn;
y=v*sin(theta)+sqrt(sigma_square)*randn;

r=sqrt(x^2+y^2);
end



