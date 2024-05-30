% this example uses Fourier method to find the root and extremum of
%                                                   a periodic function
% JM Huang, 05/30/2024

clear all
close all

N = 256;
[x, ~] = fourierGrid(N);

% the original function
u = exp(sin(x))-1;
plot(x/pi, u, 'k'); hold on

% initial guess for the location of root and extremum
x0 = 4;

% find a root
r = fourierRoot(u, x0); 
plot(r/pi, fourierInterp(u, r), 'bo');

% find a local extremum
[ue, flag] = fourierExtremum(u, x0); 
plot(ue/pi, fourierInterp(u, ue), 'ro');

% label the axis
grid on
xlabel('x/\pi')
ylabel('u')

% display the result as a title
if flag == 1
    title(['found a root at x/\pi = ' num2str(r/pi, '%.2f') ...
         ', found a maximum at x/\pi = ' num2str(ue/pi, '%.2f')]);
else
    title(['found a root at x/\pi = ' num2str(r/pi, '%.2f') ...
         ', found a minimum at x/\pi = ' num2str(ue/pi, '%.2f')]);
end