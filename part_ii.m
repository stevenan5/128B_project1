function [P] = part_ii(eqn, pert_re, pert_im)
%part_i Contains code for part (ii) of the project
%   eqn specifies what equation is used
%   default is c = 0.36 + 0.1i
%   1 is c = -0.123 - 0.745i
%   pert is degree of perturbation for the initial real or imaginary value
%   Modified version of the code from p.100 of Greenbaum and Chartier

switch eqn
    case 1
        phi = @(z) z^2 - 0.123 - 0.745i; % Define the function whose fixed points we seek.
        fixpt1 = -0.276582 - 0.479666i;  % These are the fixed points.
        fixpt2 = 1.27658 - 0.479666i;
    otherwise
        phi = @(z) z^2 + 0.36 + 0.1i; 
        fixpt1 = 0.360966 + 0.359625i;
        fixpt2 = 0.639034 - 0.359625i;
end

switch pert_re
    case 1 % by 0.4
        x_sample = 441;
        nx = -2.2;
    case 2 % by 0.6
        x_sample = 481;
        nx = -2.4;
    otherwise
        x_sample = 361;
        nx = -1.8;
end

switch pert_im
    case 1 % by 0.4
        y_sample = 221;
        ny = -1.1;
    case 2 % by 0.6
        y_sample = 261;
        ny = -1.3;
    otherwise
        y_sample = 141;
        ny = -0.7;
end


% Initialize array of point colors to 2 (white).
P = 2*ones(y_sample, x_sample);

parfor j=1:y_sample  % Try initial values with imaginary parts between
  y = ny + (j-1)*.01;      
  for i=1:x_sample   % and with real parts between
    x = nx + (i-1)*.01;   
    z = x + 1i*y;             % 1i is the MATLAB symbol for sqrt(-1).
    zk = z;
    iflag1 = 0;               % iflag1 and iflag2 count the number of iterations
    iflag2 = 0;               %   when a root is within 1.e-6 of a fixed point;
    kount = 0;                % kount is the total number of iterations.

    while kount < 100 & abs(zk) < 2 & iflag1 < 5 & iflag2 < 5 
      kount = kount+1;
      zk = phi(zk);           % This is the fixed point iteration.
      err1 = abs(zk-fixpt1);  % Test for convergence to fixpt1.
      if err1 < 1.e-6 
         iflag1 = iflag1 + 1;
      else
         iflag1 = 0;
      end
      err2 = abs(zk-fixpt2);  % Test for convergence to fixpt2.
      if err2 < 1.e-6
        iflag2 = iflag2 + 1;
      else
        iflag2 = 0;
      end
    end
    if iflag1 >= 5 | iflag2 >= 5 | kount >= 100   % If orbit is bounded, set this
      P(j,i) = 1;                                %   point color to 1 (red).
    end
  end
end



end

