function r = fourierRoot(u, x0)
% finding the root of periodic function u near x0
%           AMLDT, 05/29/2024, JM Huang
%
% input:     u   - periodic function in 2*pi, whose values are 
%                  [u(dx), u(2*dx),...u(N*dx)] where dx = 2*pi/N
%            x0  - initial guess
%
% output:    r   - root, u(r) = 0
%

% set the tolerance here
tol = 1e-10;

% get the derivative of u
du = fourierD(u);

% initialize the Newton's method
res = 1; r = x0; k = 1;

% Newton iteration
while res > tol
    r = r - fourierInterp(u, r)/fourierInterp(du, r);
    res = abs(fourierInterp(u, r));
    k = k+1;
    if k >100
        error('Solver stalled!')
    end
end

% bring r to be between 0 and 2*pi
r = mod(r, 2*pi);

disp(['Newton''s method converged in ' num2str(k) ' iterations.'])

end