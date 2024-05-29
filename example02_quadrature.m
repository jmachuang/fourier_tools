% this example finds the antiderivative of a known function
%          and compares the Fourier method and the Trapezoidal rule
% JM Huang, 03/29/2024

clear all
close all

% get the error with various N
N = 2.^(1:7);

err_fourier = 0*N; err_trapezoidal = 0*N;

for k = 1:length(N)
    
    % define coordinates
    [x, ~] = fourierGrid(N(k));

    % define u and its exact antiderivative
    u = cos(x).*exp(sin(x));
    U = exp(sin(x))-1;
    
    % do some sweet Fourier integral
    U_fourier = antiD(u);
    
    % good old Trapezoidal rule
    U_trapezoidal = 0*u;
    u = [u(end); u(1:end-1)];       % rearrange u so U(1) = int_0^dx u 
    for j = 2:N(k)
        U_trapezoidal(j-1)= (sum(u(1:j)) - u(1)/2 - u(j)/2)*(2*pi/N(k));
    end
    
    % compute errors for both cases
    err_fourier(k) = norm(U_fourier - U, 'inf');
    err_trapezoidal(k) = norm(U_trapezoidal - U, 'inf');
end


% plot the error
figure
loglog(N, err_fourier, 'bo')
hold on
loglog(N, err_trapezoidal, 'ro')
loglog(N(3:end), 10*N(3:end).^(-2),'k--')

xlabel('N'); ylabel('L^\infty error')
legend('Fourier method', 'trapezoidal rule', 'O(N^{-2})', ...
                        'location', 'southwest')
                    
