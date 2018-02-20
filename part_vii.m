function [iter, basin] = part_vii(n)
%PART_VII Newton's method in complex plane in the style of previous parts
%   n is the power of z^n - 1

nx = -3;
ny = -3;

[X, Y] = meshgrid(linspace(ny, -ny, -ny * 200 + 1), linspace(nx, -nx, -nx * 200 + 1));

Z = X + 1i * Y;
iter = zeros(size(Z));
basin = iter;
one = ones(-ny * 200 + 1, -nx * 200 + 1);

rou = zeros(n, 1);
for i = 0:n-1
    
   rou(i + 1) = exp(2 / n * 1i * pi * i); 
   
end

for k = 1:50
    
	Z = Z - (Z.^n - one) ./ (n .* Z.^(n-1));
    % count the iterations where the guess has not converged.
	bound = abs(Z.^n) - one  > 1.e-6;
    iter = iter + bound;	     
    
end

% determine where every point converges to
for i=1:n
    
    basin(abs(Z - rou(i) * one) < 1.e-6) = i;
    
end

end

