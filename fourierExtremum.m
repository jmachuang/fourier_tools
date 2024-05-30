function [r, flag] = fourierExtremum(u, x0)
% finding the Extremum of periodic function u near x0
%           AMLDT, 05/29/2024, JM Huang
%
% input:     u     - periodic function in 2*pi, whose values are 
%                  [u(dx), u(2*dx),...u(N*dx)] where dx = 2*pi/N
%            x0    - initial guess
%
% output:    r     - extremum, u'(r) = 0
%            flag  - returns 1 for maximum, 0 for minimum or saddle
%


% get the derivative of u
du = fourierD(u); ddu = fourierD(du);

% find the root of du
r = fourierRoot(du, x0);

% judge the extremum
if fourierInterp(ddu, r) < 0
    disp('found a local maximum.'); 
    flag = 1;
else
    disp('found a local minimum.')
    flag = 0;
end



end