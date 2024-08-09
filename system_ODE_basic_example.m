% $$\frac{dx}[dt}=rx(1-y) $$
% $$\frac{dy}[dt}=\frac{1}{y}y(1-x) $$

%Prey model

r=1; x0=1.1;y0=1;tspan=[ 0 6*pi];
[t,xy]=ode45(@(t,xy) lv(xy,r),tspan,[x0; y0]);

%plot figures
figure(1); plot(t,xy); axis([0 6*pi 0.9 1.11]);
xlabel('$t$','Interpreter','latex','FontSize',14);
ylabel('$x,y$','Interpreter','latex','FontSize',14);
title('Lotka-Volterra Equations','Interpreter','latex','FontSize',16); %this has some error when drawing

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