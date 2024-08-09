  %Solve (theta)'' +alpha*(theta)' +sin(theta)=0
  %theta(0)=0
  %Dtermine theta(0)' such that the mass theta becomes exactly balandced at
  %the top theta=pi
  %plot the values of theta(0)'

theta0=0; u0=2; %initial ode conditions. u0 is initial guess for root.
inf=8*pi; %inf is a large number.  Takes a long time to get to top.
tspan=[0 inf];  
options = odeset('RelTol',1.e-6);
%rootfind u0 such that theta(inf)=pi
alpha_i=linspace(0, 2, 100); u0_i=zeros(100,1);
for i=1:length(alpha_i)
    alpha=alpha_i(i);
    u0_i(i) = fzero(@(u0) F(tspan,theta0,u0,alpha,options), u0);
end
plot(alpha_i, u0_i);
xlabel('$\alpha$','Interpreter','latex','FontSize',14); 
ylabel('$d \theta/dt$','Interpreter','latex','FontSize',14); 
title('Shooting to the Pendulum Top','Interpreter','latex','FontSize',16);

function y=F(tspan,theta0,u0,alpha,options)
    % use ode45 to define the root-finding problem
    [t,theta_u]=ode45(@(t,theta_u) pendulum(theta_u,alpha),tspan,[theta0;u0],options);
    theta=theta_u(:,1); u=theta_u(:,2);
    y=theta(end)-pi;
end

function d_theta_u_dt = pendulum(theta_u,alpha)
% define the differential equation here
theta=theta_u(1); u=theta_u(2);
d_theta_u_dt=[u;-alpha*u-sin(theta)];
end