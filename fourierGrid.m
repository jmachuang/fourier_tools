function [x, k] = fourierGrid(N)
% get the equal spaced grid on (0, 2*pi) with N nodes, also get the
%                                                   Fouerier wavenumber
%           AMLDT, 03/29/2024, JM Huang
%
% input:     N  - an even integer
%
% output:    x  - equally spaced grid points
%            k  - wave number
%

if mod(N,2) ~= 0
    error('input must be an even integer!')
end

% define grid
x = (1:N)'/N*2*pi;

% get wave number
k = [0:N/2-1 0 -(N/2-1):-1]';

end