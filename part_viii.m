function [res, iter] = part_viii(view)
%PART_VIII Computes the Mandelbrot set
%   view is  full set or scientific american perspective 
%   Best guess is that the 1985 scientific american cover is btwn
%   x in [0.15,0.5] y in [0.4, 0.71]
switch view
    case 0
        [X, Y] = meshgrid(linspace(-2.1, 0.5, 4000), linspace(-1.4, 1.4, 4000));
        Z = zeros(4000);
    case 1
        [X, Y] = meshgrid(linspace(0.2, 0.45, 4000), linspace(0.45, 0.71, 4000));
        Z = zeros(4000);
end

C = X + 1i * Y;
iter = zeros(size(C));

for k = 1:200

	Z = Z.^2 + C;
    bound = abs(Z) <= 2;
	iter = iter + bound;	        
end

    res = Z;

end

