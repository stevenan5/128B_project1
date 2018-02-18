function [res, iter] = part_vi(c)
%PART_VI generates data to plot divergent orbits with color for Julia set

[X, Y] = meshgrid(linspace(-1.4, 1.4, 2801), linspace(-1.4, 1.4, 2801));

Z = X + 1i * Y;
C = c * ones(size(Z));
iter = zeros(size(Z));

for k = 1:100

	Z = Z.^2 + C;
    bound = abs(Z) <= 2;
	iter = iter + bound;	        
end

    res = Z;
    
end

