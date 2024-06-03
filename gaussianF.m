function fu = gaussianF(u, sigma)
% Apply Gaussian filter to a periodic function u
%           AMLDT, 05/29/2024, JM Huang
%
% input:     u      - periodic function in 2*pi, whose values are 
%                     [u(dx), u(2*dx),...u(N*dx)] where dx = 2*pi/N 
%                                                       N must be even
%            sigma  - standard deviation of the Gaussian filter
%
% output:    fu     - filtered version of u
%


N = length(u);

% store wave number this way so the ifft stays real
k = [0:N/2-1 0 -(N/2-1):-1]';

% filter in the spectrum
gv = exp(-0.5*abs(k).^2/sigma^2);

% do fft, and apply the filter
u_hat = fft(u); fu_hat = gv.*u_hat;

fu = real(ifft(fu_hat));
end

