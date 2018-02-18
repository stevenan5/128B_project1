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

figure(3);
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

%% Part iii 
figure(4);
J1 = part_iii(0);
subplot(2,2,1)
plot(real(J1), imag(J1), '.')
axis equal
axis xy
title('c = -1.25')

J2 = part_iii(1);
subplot(2,2,2)
plot(real(J2), imag(J2), '.')
axis equal
axis xy
title('c = 0')

J3 = part_iii(2);
subplot(2,2,3)
plot(real(J3), imag(J3), '.')
axis equal
axis xy
title('c = - 0.123 - 0.745i')

J4 = part_iii(3);
subplot(2,2,4)
plot(real(J4), imag(J4), '.')
axis equal
axis xy
title('c = 0.36 + 0.1i')

%% Part viii
% create new colormap (collapse jet into matrix half the height)
% this is to emphasize the red around the border
j = flipud(jet(520));
halfjet = j(1:130, :);

figure(5);
subplot(1,2,1)
[MB1, count] = part_viii(0);
colormap( [jet(520); halfjet; 0 0 0] );
imagesc(linspace(-2.1, 0.5, 4000), linspace(-1.4, 1.4, 4000), log(count));
axis equal
axis xy
axis off
title('Mandelbrot Set')

subplot(1,2,2)
[MB2, count] = part_viii(1);
imagesc(linspace(0.2, 0.45, 4000), linspace(0.45, 0.71, 4000), log(count));
axis equal
axis xy
axis off
title('1985 Sci. Amer. Cover')