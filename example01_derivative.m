% this example takes the derivative of a known function
%         and compares the Fourier method and 2nd order finite differences
% JM Huang, 03/29/2024

clear all
close all

% get the error with various N
N = 2.^(1:7);

err_fourier = 0*N; err_FD2 = 0*N;

for k = 1:length(N)
    
    % define coordinates
    [x, ~] = fourierGrid(N(k));

    % define u and its exact derivative
    u = exp(sin(x));
    du = cos(x).*u;
    
    % do some sweet Fourier differentiation
    du_fourier = fourierD(u);
    
    % good old 2nd order finite differences
    du_FD2 = N(k)/(2*pi)*D1p(N(k))*u;
    
    % compute errors for both cases
    err_fourier(k) = norm(du_fourier - du, 'inf');
    err_FD2(k) = norm(du_FD2 - du, 'inf');
end


% plot the error
figure
loglog(N, err_fourier, 'bo')
hold on
loglog(N, err_FD2, 'ro')
loglog(N(3:end), 10*N(3:end).^(-2),'k--')

xlabel('N'); ylabel('L^\infty error')
legend('Fourier method', '2nd order finite differences', 'O(N^{-2})', ...
                        'location', 'southwest')
                    
