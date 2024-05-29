function U = antiD(u)
% find the antiderivative of periodic function u
%           AMLDT, 03/29/2024, JM Huang
%
% input:     u  - periodic function in 2*pi, whose values are 
%                 [u(dx), u(2*dx),...u(N*dx)] where dx = 2*pi/N, N is even
%
% output:    U  - antiderivative of u
%

N = length(u);

% store wave number this way so the ifft stays real
k = [0:N/2-1 0 -(N/2-1):-1]';

% take derivative in Fourier space
U_hat = fft(u)./(1j*k); 

% deal with the zeroth Fourier mode
U_hat(1) = 0; U_hat(N/2+1) = 0;

% inverse Fourier to get U
U = ifft(U_hat); U = U - U(end) + fourierInt_full(u);

end