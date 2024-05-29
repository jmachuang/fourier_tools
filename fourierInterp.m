function ux = fourierInterp(u, x0)
% interpolation based on periodic function u with Fourier method
%           AMLDT, 05/29/2024, JM Huang
%
% input:     u   - periodic function in 2*pi, whose values are 
%                  [u(dx), u(2*dx),...u(N*dx)] where dx = 2*pi/N
%            x0  - location to evaluate
%
% output:    ux  - u(x0)
%

N = length(u);

% get the size of x0 and then turn it into a row vector
[m, n] = size(x0);
x0 = reshape(x0, 1, m*n);

% store wave number this way so the ifft stays real
k = [0:N/2-1  0 -(N/2-1):-1]';

% get the interpolation
u_hat = fft(u); 

% the edge of the spectrum will only contribute half 
u_hat(N/2) = u_hat(N/2)/2; u_hat(N/2+2) = u_hat(N/2+2)/2; 
u_hat(N/2+1) = 0;   % get rid of the asymmetry

% compute the interpolation, note x0 needs to be shifted by 2*pi/N due to
% weird matlab reasons... See their definition of fft and ifft.
ux = real(sum(u_hat.*exp(1j*k*(x0-2*pi/N))))/N;

% reshape ux to the same as x0
ux = reshape(ux, m, n);
end