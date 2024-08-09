%Define the rectangle and grid parameters

Lx=1; Ly=1; %rectangle dimensions
Nx=100; Ny=100; %number of intervals in x,y directions
nx=Nx+1; ny=Ny+1; %number of gridpoints in x,y directions
dx=Lx/Nx; dy=Ly/Ny; %grid length in x,y directions
x=(0:Nx)*dx; y=(0:Ny)*dy; %x,y values on the grid

%Define the indices
%  boundary_index = [bottom, left, top, right]
boundary_index=[1:nx, 1:nx:1+(ny-1)*nx, 1+(ny-1)*nx:nx*ny, nx:nx:nx*ny];


%Set up matrix
diagonals = [4*ones(nx*ny,1), -ones(nx*ny,4)];
A=spdiags(diagonals,[0 -1 1 -nx nx], nx*ny, nx*ny); %use sparse matrices
I=speye(nx*ny); %soparse identity matrix
A(boundary_index,:)=I(boundary_index,:);

%the right hand-side matrix
b=zeros(nx,ny); %interior rows are zero
b(:,1)=0; %bottom
b(1,:)=0; %left
b(:,ny)=4*x.*(1-x); %top
b(nx,:)=0; %right
b=reshape(b,nx*ny,1); %make column vector using natural ordering [same as b=b(:)]

%Solve the Laplace equation with Gaussian elimination

Phi=A\b; %solution by Gaussian elimination
Phi=reshape(Phi,nx,ny); %back to (i,j) indexing and make the matrix

%Plot the solution with contour

[X,Y]=meshgrid(x,y);
v=[0.8 0.6 0.4 0.2 0.1 0.05 0.01]; %contour levels
contour(X,Y,Phi',v,'ShowText','on'); %requires transpose
axis equal;
set(gca,'YTick',[0 0.2 0.4 0.6 0.8 1]);
set(gca,'XTick',[0 0.2 0.4 0.6 0.8 1]);
xlabel('$x$','Interpreter','latex','FontSize',14 );
ylabel('$y$','Interpreter','latex','FontSize',14);
title('Solution of the Laplace equation','Interpreter','latex','FontSize',16);
