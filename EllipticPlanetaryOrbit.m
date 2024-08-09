%Solve Ellip[tic Planetary Orbit

%r(t)=x(t)i +y(t)k

%with the eccentric e = sqrt(1-b^2/a^2)

%The coordinate system is 
%x(t)=a(e-cosE)
%y(t)=bsin(E)

%where E is the eccentric anomoly $E=E(t)$ a solution to th Kepter
%equation: E= omega*t +e sin(E)
%dimensionaless:
%This happens when t=0, E=0. the closest approach is y=0 and x=a(e-1). Then
%with unit length,. a(e-1)=-1. THus we get
%a=1/(1-e) and b=sqrt((1+e)/(1-e))

period=1;  omega=2*pi/period;
e=[0,1/4,1/2,3/4]; color=['r','g','b','c'];
a=1./(1-e); b=sqrt((1+e)./(1-e));
t=linspace(0,period,1000);
x=zeros(length(t),length(e)); y=zeros(length(t),length(e));
for j=1:length(e)
    for i=1:length(t)
       E=fzero(@(E) E-e(j)*sin(E)-omega*t(i),0); % add anonymous function for root finding.  Make use of the variables e(j) and t(i) and omega.
        x(i,j)=a(j)*(e(j)-cos(E));; % assign x-coordinate.  Make use of the variables a(j), e(j) and E.
        y(i,j)=b(j)*sin(E) ; % assign y-coordinate.  Make use of the variables b(j) and E. 
    end
end
for j=1:length(e)
    plot(x(:,j),y(:,j),color(j)); axis equal; hold on;
end
plot(0,0,'xk') %mark the origin
xlabel('$x$', 'Interpreter', 'latex', 'FontSize',14)
ylabel('$y$', 'Interpreter', 'latex', 'FontSize',14)
legend('$e=0$','$e=1/4$','$e=1/2$','$e=3/4$','Interpreter','latex','Location','East')
title('Planetary Orbits','Interpreter','latex','FontSize',16)
