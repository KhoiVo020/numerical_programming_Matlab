close all; clear all; clc;
f = @(Z) Z.^3-1; fp= @(Z) 3*Z.^2;
root1=1 ; root2=-1/2 + 1i*sqrt(3)/2; root3=-1/2 -1i*sqrt(3)/2;

nx=8000; ny=8000;
xmin=-2; xmax=2; ymin=-2; ymax=2;

x=linspace(xmin,xmax,nx); y=linspace(ymin,ymax,ny);
[X,Y]=meshgrid(x,y);
Z=X+1i*Y;


nit=40;
for n=1:nit
    Z= Z-f(Z)./fp(Z);
end

eps = 0.001;
Z1=abs(Z-root1)<eps; Z2 = abs(Z-root2)<eps; % logical matrice 
Z3 =abs(Z-root3)<eps; Z4=~(Z1+Z2+Z3); %dimension nx by ny of 0 or 1
%0 if it is not closed to root1, 1 if it close to root1
%Z4 is the one that is not close to any root1,root2,root3.

%Draw

figure;
map = [1 0 0; 0 1 0; 0 0 1; 0 0 0]; colormap(map); %[red;green;blue;black]
Z=(Z1+2*Z2+3*Z3+4*Z4);
image([xmin,xmax],[ymin,ymax],Z);
set(gca,'YDir','normal');%this command is for changing image to the usual negative to positive

axis equal; axis tight;
set(gca, 'XTick', linspace(xmin,xmax,5),'YTick',linspace(ymin,ymax,5));
xlabel('$x$','Interpreter','latex','Fontsize',14);
ylabel('$y$','Interpreter','latex','Fontsize',14);
title('Fractal from $f(z)=z^3-1$','Interpreter','latex','Fontsize',16);