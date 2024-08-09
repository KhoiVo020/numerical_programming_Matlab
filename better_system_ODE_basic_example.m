% $$\frac{dx}[dt}=rx(1-y) $$
% $$\frac{dy}[dt}=\frac{1}{y}y(1-x) $$

%Prey model
%cleaned up problems

r=1; x0=1.1;y0=1;tspan=linspace(0, 6*pi,500); %get more points with tspan: help the smooth problem
%to fix the periodic problem, need to change the tolerance in ode45
options = odeset('RelTol',1.e-4); %reduce the tolerance
[t,xy]=ode45(@(t,xy) lv(xy,r),tspan,[x0; y0],options); %view code results with skeptical eyes and refer to help desk.

%plot figures
figure(1); plot(t,xy); axis([0 6*pi 0.9 1.11]);
xlabel('$t$','Interpreter','latex','FontSize',14);
ylabel('$x,y$','Interpreter','latex','FontSize',14);
title('Lotka-Volterra Equations','Interpreter','latex','FontSize',16); %this has some error when drawing: FIXED

figure(2); plot(xy(:,1),xy(:,2)); axis([0.9 1.11 0.9 1.11]);
xlabel('$x$','Interpreter','latex','FontSize',14);
ylabel('$y$','Interpreter','latex','FontSize',14);
title('Lotka-Volterra Equations','Interpreter','latex','FontSize',16);

%Problem 1: plots not smoot: interpolate to a smaller time step
%Problem 2: Solution is not periodic: Reduce the error tolerrance

function dxydt = lv(xy,r) %xy is a vector
    x =xy(1); y=xy(2);
    dxydt = [r*x*(1-y);(1/r)*(y)*(x-1)];
end