% this example uses Fourier method to interpolate a periodic function
% JM Huang, 05/29/2024

clear all
close all

N = 256;
[x, ~] = fourierGrid(N);

% the original function
u = exp(sin(x));
plot(x/2/pi, u, 'k'); hold on

% interpolation locatiosn and corresponding values
x0 = linspace(0,2*pi,6);
u0 = fourierInterp(u, x0);
plot(x0/2/pi, u0, 'bo');

% label the axis
xlabel('x/2\pi')
ylabel('u')

% compute and show the maximum error
u_0_exact =  exp(sin(x0));
err = norm(u0 - u_0_exact, 'inf');
title(['maximum L_\infty interpolation error is ' num2str(err)])