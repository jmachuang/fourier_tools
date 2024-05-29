function I = fourierInt_full(u)
% integrate periodic function u from 0 to 2*pi
%           AMLDT, 03/29/2024, JM Huang
%
% input:     u  - periodic function in 2*pi, whose values are 
%                 [u(dx), u(2*dx),...u(N*dx)] where dx = 2*pi/N, N is even
%
% output:    I  - int_0^{2*pi} u(x) dx
%

I = mean(u)*2*pi;

end