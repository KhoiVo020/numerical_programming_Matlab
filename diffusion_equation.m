
%solve diffusiion euqation for |x| <= L using Crank-Nicolson method,
%assuming no flux boundary conditions.

D=1;  %Diffusion constant; 
%the x-domain and x-grid

Lx=1;% Domain length -Lx<x<Lx


Nx=500; %number of intervals
nx=Nx+1;%number of gridpoints in x direction including boundaries
dx=2*Lx/Nx; %grid size in x
x=-Lx + (0:Nx)*dx; %x values on the grid

%Time step parameters
nsteps=10000; %number of time steps
nout=500; %plot every nout time steps
dt=(dx)^2/(2*D); %borderline stability of FTCS scheme
alpha=dt*D/dx^2; %euqation parameter

%Construct the matrix
diagonals = [2*(1+alpha)*ones(nx,1), -alpha*ones(nx,2)];
A=spdiags(diagonals,[0 -1 1], nx, nx);
%I=speye(nx);
A(1,:)=[3 -4 1 zeros(1,nx-3)]; %boundary condition on the left
A(nx,:)=[zeros(1,nx-3) 1 -4 3]; %boundary condition on the right

%Define initial conditions and plot
sigma=Lx/16;
u=1/(sigma*sqrt(2*pi))*exp(-0.5*(x/sigma).^2); u=u';
plot(x,u); hold on;
xlabel('$x$','Interpreter','latex','FontSize',14);
ylabel('$u(x, t)$','Interpreter','latex','FontSize',14);
title('Solution of the diffusion equation','Interpreter','latex','FontSize',16);

%Then advance the solution and plot
for m=1:nsteps
b=[0; [alpha*u(1:nx-2) + 2*(1-alpha)*u(2:nx-1) + alpha*u(3:nx)]; 0];
u=A\b;
if mod(m,nout)==0, plot(x,u), end
end

