function [iter] = part_vii(n)
%PART_VII Newton's method in complex plane in the style of previous parts
%   n is the power of z^n - 1

nx = -3;
ny = -3;

[X, Y] = meshgrid(linspace(ny, -ny, -ny * 200 + 1), linspace(nx, -nx, -nx * 200 + 1));

Z = X + 1i * Y;
iter = zeros(size(Z));
one = ones(-ny * 200 + 1, -nx * 200 + 1);

for k = 1:100
    
    C = (Z.^n - 1) ./ (n * Z.^(n-1));
	Z = Z - C;
    % count the iterations where the guess has not converged.
    bound = abs(Z.^n) - one  > 1.e-6;
	iter = iter + bound;	        
end

end

