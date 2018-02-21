function [connect] = part_v(c)
% part_iii Determines whether Julia set is bounded or not
%   computes orb(0) and checks whether abs(z) > 100
%   bounded is boolean, 0 is not connected, 1 is connected

z = 0;

for i=1 : 100
    
    % fixed point iteration
    z = z^2 + c;
    
end

% check to see if orb(0) bounded
connect = abs(z)<100;

end
