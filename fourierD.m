function du = fourierD(u)
% differentiate periodic function u
%           AMLDT, 03/29/2024, JM Huang
%
% input:     u  - periodic function in 2*pi, whose values are 
%                 [u(dx), u(2*dx),...u(N*dx)] where dx = 2*pi/N
%
% output:    du  - du/dx
%

N = length(u);

% store wave number this way so the ifft stays real
k = [0:N/2-1 0 -(N/2-1):-1]';

% take derivative in Fourier space
u_hat = fft(u); du_hat = 1j*k.*u_hat; 

% inverse Fourier
du = real(ifft(du_hat));

end