%Define the rectangle and grid parameters

Lx=1; Ly=1; %rectangle dimensions
Nx=100; Ny=100; %number of intervals in x,y directions
nx=Nx+1; ny=Ny+1; %number of gridpoints in x,y directions
dx=Lx/Nx; dy=Ly/Ny; %grid length in x,y directions
x=(0:Nx)*dx; y=(0:Ny)*dy; %x,y values on the grid

%Define the iteration parameters and initial conditions

eps=1.e-6; %convergence criteria for each value of Phi
index_x=2:nx-1; index_y=2:ny-1; %internal grid points

Phi=zeros(nx,ny);%matrix with solution and boundary conditions

%Boundary conditions
Phi(:,1)=0;%bottom
Phi(1,:)=0; %left
Phi(:,ny)=4*x.*(1-x); %top
Phi(nx,:)=0; %right 

%Jacobi iteration

Phi_old=Phi;
error=2*eps; ncount=0;
while (error > eps)
ncount=ncount+1;
Phi(index_x,index_y)=0.25*(Phi(index_x+1,index_y) ...
+Phi(index_x-1,index_y)+Phi(index_x,index_y+1)+Phi(index_x,index_y-1)); %main Jacobi iteration
error=max(abs(Phi(:)-Phi_old(:)));
if any(isnan(Phi(:))) || any(isinf(Phi(:)))
    fprintf('Iteration Diverge \n');
    return;
end
Phi_old=Phi;
%fprintf('%g\n',ncount);
end

%plot the contour solutions

[X,Y]=meshgrid(x,y);
v=[0.8 0.6 0.4 0.2 0.1 0.05 0.01]; %contour levels
contour(X,Y,Phi',v,'ShowText','on'); %requires transpose
axis equal;
set(gca,'YTick',[0 0.2 0.4 0.6 0.8 1]);
set(gca,'XTick',[0 0.2 0.4 0.6 0.8 1]);
xlabel('$x$','Interpreter','latex','FontSize',14 );
ylabel('$y$','Interpreter','latex','FontSize',14);
title('Solution of the Laplace equation','Interpreter','latex','FontSize',16);