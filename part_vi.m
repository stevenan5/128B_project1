function [iter] = part_vi(eqn)
%PART_VI generates data to plot divergent orbits with color for Julia set
%   eqn chooses the constant.

switch eqn
    case 0
        c = -1.25;
        nx = -1.4;
        ny = -1.4;
    case 1
        c = 0;
        nx = -1;
        ny = -1;
    case 2
        c = - 0.123 - 0.745i;
        nx = -1.4;
        ny = -1.4;
    otherwise
        c = 0.36 + 0.1i; 
        nx = -1.4;
        ny = -1.4;
    
end

[X, Y] = meshgrid(linspace(ny, -ny, -ny * 2000 + 1), linspace(nx, -nx, -nx * 2000 + 1));

Z = X + 1i * Y;
C = c * ones(size(Z));
iter = zeros(size(Z));

for k = 1:100

	Z = Z.^2 + C;
    bound = abs(Z) <= 2;
	iter = iter + bound;	        
end
    
end

