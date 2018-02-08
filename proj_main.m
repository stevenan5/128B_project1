% Execution of all parts.
% parfor is used in the interest of runtime.

clc;
clear;

%% Part i

% the code for plotting has been moved outside of the function 
[M1, M2] = part_i();
figure(1);
colormap([1 0 0; 1 1 1]);      % Set the color map, 1 is red, 2 is white.
image([-1.8 1.8],[-.7 .7],M1), % This plots the results.
axis xy                        % If you don't do this, vertical axis is inverted.
title('c=-1.25')

figure(2)
colormap([1 0 0; 1 1 1]); 
image([-1 1],[-1 1],M2),
axis image;               % makes the image square.
axis xy
title('c=0')

%% Part ii

% Compute all fractals, with and without perturbation
% At |z| > 2, the  fixed point method is consdiered to diverge and the 
% point is marked white.

P1 = part_ii(0, 0, 0);
P2 = part_ii(0, 1, 1);
P3 = part_ii(0, 2, 2);
P4 = part_ii(1, 0, 0);
P5 = part_ii(1, 1, 1);
P6 = part_ii(1, 2, 2);

figure(2);
colormap([1 0 0; 1 1 1]);
subplot(2,3,1)
image([-1.8 1.8],[-.7 .7],P1),
axis xy
title('c=0.36+0.1i')
xlabel('no perturb')

subplot(2,3,2)
image([-1.9 1.9],[-.8 .8],P2),
axis xy
title('c=0.36+0.1i')
xlabel('pert: 1, 1')

subplot(2,3,3)
image([-2 2],[-.9 .9],P3), 
axis xy
title('c=0.36+0.1i')
xlabel('pert: 2, 2')

subplot(2,3,4)
image([-1.8 1.8],[-.7 .7],P4), 
axis xy
title('c=-0.123-0.745i')
xlabel('no perturb')

subplot(2,3,5)
image([-1.9 1.9],[-.8 .8],P5),
axis xy
title('c=-0.123-0.745i')
xlabel('pert: 1, 1')

subplot(2,3,6)
image([-2 2],[-.9 .9],P6), 
axis xy
title('c=-0.123-0.745i')
xlabel('pert: 2, 2')