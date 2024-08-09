%I= integral from 0 to infty of e^{-ax^2} (lnx)^2 dx, a=pi

f = @(x,a) exp(-a*x.^2).*log(x).^2;
a=pi;
I=integral(@(x) f(x,a),0, Inf);