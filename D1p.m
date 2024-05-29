function A = D1p(n)
% generate the 1st derivative operator with periodic boundary condition
% JM Huang

a = zeros(n+4,1);
a(2) = -1/2;
A = sparse(toeplitz(a,-a));
A = A(3:n+2,3:n+2);
A(1,end) = -0.5;
A(end,1) = 0.5;
end
