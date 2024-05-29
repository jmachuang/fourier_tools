% this example applies Gausian filter to a noisy data
% JM Huang, 05/29/2024

clear all
close all

N = 256;
[x, ~] = fourierGrid(N);

% generate some noisy data
u = exp(sin(x))+rand(N,1);
plot(x/2/pi, u, 'k'); hold on

% make a list of Gaussian std
sigma = 2.^(-5:-2); Ns = length(sigma);

% some colors
cc = jet(Ns);

% plot the filtered data
for k = 1:Ns
    plot(x/2/pi, gaussianF(u, sigma(k)), 'color', cc(k,:));
end

xlabel('x/2\pi')
ylabel('u')

                    