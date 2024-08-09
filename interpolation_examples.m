x=0:pi/4:2*pi; y=sin(x);
plot(x,y,'ok'); hold on

xx=linspace(0,2*pi,1000);

yy=interp1(x,y,xx,'spline');
plot(xx,yy,'r');