%solve x=e^[-ax}, a=1/2

f=@(x,a) x-exp(-a*x);
a=1/2;
x0=0;

r=fzero(@(x)f(x,a),x0);