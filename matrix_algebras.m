%Solve Ax=b with the backlash operator

A=[-3 2 -1; 6 -6 7; 3 -4 4];
b= [-1; -7; -6];
x=A\b;

%Solve least square problem: when there are more unknowns then equations.
%Ax=n overdetermined. To solve this we need A^TAx=A^Tb

%Example:

B=[1 1; 1 2; 1 3];
c=[1;3;2];
y=B\c;

%Find LU decomposition of a matrix. It can solve A=LU, then solve (LU)x=b

[L,U]=lu(A)
x=U\(L\b)

%Find eigenvalues: lambda = eig(A);
%find eigenvector and eigenvalue [V,D]=eig(A);

C=[0 1; 1 0];
lambda = eig(C)
[V,D]=eig(C)
