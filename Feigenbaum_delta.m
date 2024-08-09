% Compute the Feigenbaum delta
% Store approximate values in the row vector delta for assessment, where length(delta)= num_doublings and 
% delta(2:num_doublings) are computed from the algorithm described in Lectures 21-23.
num_doublings=11; delta=zeros(1,num_doublings); delta(1)=5;
% Write your code here

mu = zeros(1,num_doublings);
max_iterations = 10;

mu(1)=2; %initial mu_0
mu(2)=1+sqrt(5); %initial mu_1
x0 = 1/2; % Initial condition for x
x_p0=0; % derivative x_0'=0

for n = 2:num_doublings
    % Initial guess for mu_n using the approximation of previous values
    num_iterations_logistic =2 ^n; %number of iteration is 2^n
    mu(n+1)=mu(n)+(mu(n)-mu(n-1))/delta(n-1);         
    for j = 1:max_iterations                      
            
            for k = 1:num_iterations_logistic % Iterate the logistic map
                x = mu(n+1) * x0 * (1 - x0); %iterate x
                x_p= x0*(1-x0) +mu(n+1)*x_p0*(1-2*x0); %iterate derivative x_p
                x0=x; %reset x0 for next iteration
                x_p0=x_p; %reset xp0 derivative for next iteration
            end
        
            u(j)=mu(n+1)-(x-1/2)/x_p;
            mu(n+1)=u(j);
    end  
    %save mu_n and compute delta(n)
    %mu(n+1)=u(iter);
    delta(n)=(mu(n) - mu(n-1))/(mu(n+1) - mu(n));
       
   
end


% Output your results
fprintf('n        delta(n)\n');
for n=1:num_doublings
    fprintf('%2g %18.15f\n',n,delta(n));
end
