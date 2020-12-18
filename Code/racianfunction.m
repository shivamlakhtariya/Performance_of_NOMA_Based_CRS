clear all;
clc;

v = 1.75; s = 0.5; 
x =0 : 100 : 4 ;

plot(x, ricepdf(x, v, s));


function y = ricepdf(x, v, s)

   
    y = (x ./ s2) .*...
        exp(-0.5 * (x.^2 + v.^2) ./ s2) .*...
        besseli(0, x .* v ./ s2);
        % besseli(0, ...) is the zeroth order modified Bessel function of
        % the first kind. (see help bessel)
    y(x <= 0) = 0;
    

end

