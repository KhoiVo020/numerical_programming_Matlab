%%
% 
% $$\frac{dx}{dt}=rx(1-x)$$

dxdt=@(x,r) r*x*(1-x);
r=1; x0=0.01; tspan=[0 10];

[t,x]=ode45(@(t,x) dxdt(x,r),tspan,x0); %t,x are two column vectors

plot(t,x);
xlabel('$t$','Interpreter','latex','FontSize',14);
ylabel('$x$','Interpreter','latex','FontSize',14);
title('Logistic Equation','Interpreter','latex','FontSize',16);



