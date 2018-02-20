% Execution of all parts.
% parfor is used in the interest of runtime.

clc;
clear;

% create new colormap (collapse jet into matrix half the height)
% this is to emphasize the red around the border
j = flipud(jet(520));
halfjet = j(1:130, :);

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

J1 = part_iii(0);
J2 = part_iii(1);
J3 = part_iii(2);
J4 = part_iii(3);

figure(4);
subplot(2,2,1)
plot(real(J1), imag(J1), '.')
axis equal
axis xy
title('c = -1.25')

subplot(2,2,2)
plot(real(J2), imag(J2), '.')
axis equal
axis xy
title('c = 0')

subplot(2,2,3)
plot(real(J3), imag(J3), '.')
axis equal
axis xy
title('c = - 0.123 - 0.745i')

subplot(2,2,4)
plot(real(J4), imag(J4), '.')
axis equal
axis xy
title('c = 0.36 + 0.1i')

%% Part vi
[count] = part_vi(0);
[count1] = part_vi(1);
[count2] = part_vi(2);
[count3] = part_vi(3);

figure(6);
subplot(2, 2, 1);
%colormap( [jet(520); halfjet; 0 0 0] );
imagesc(linspace(-1.4, 1.4, 2801), linspace(-1.4, 1.4, 2801), log(count));
axis equal
axis xy
axis off
title('c = -1.25')

subplot(2, 2, 2);
%colormap( [jet(520); halfjet; 0 0 0] );
imagesc(linspace(-1, 1, 2001), linspace(-1, 1, 2001), log(count1));
axis equal
axis xy
axis off
title('c = 0')

subplot(2, 2, 3);
%colormap( [jet(520); halfjet; 0 0 0] );
imagesc(linspace(-1.4, 1.4, 2801), linspace(-1.4, 1.4, 2801), log(count2));
axis equal
axis xy
axis off
title('c = - 0.123 - 0.745i')

subplot(2, 2, 4);

imagesc(linspace(-1.4, 1.4, 2801), linspace(-1.4, 1.4, 2801), log(count3));
axis equal
axis xy
axis off
title('c = 0.36 + 0.1i')
colormap( [jet(520); halfjet; 0 0 0] );

%% Part vii

[count] = part_vii(3);
[count2] = part_vii(4);

rou3 = zeros(3, 1);
for i = 0:2
   rou3(i + 1) = exp(2 / 3 * 1i * pi * i);  
end

rou4 = zeros(4, 1);
for i = 0:3
   rou4(i + 1) = exp(1 / 2 * 1i * pi * i);  
end

figure(7);
imagesc(linspace(-3, 3, 601), linspace(-3, 3, 601), count);
hold on
plot(real(rou3), imag(rou3), 'b*');
axis equal
axis xy
hold off
title('z^3-1')

figure(8);
imagesc(linspace(-3, 3, 601), linspace(-3, 3, 601), count2);
hold on
plot(real(rou4), imag(rou4), 'b*');
axis equal
axis xy
hold off
title('z^4-1')

colormap(flipud(jet(200)));

%% Part viii

[count] = part_viii(0);
[count2] = part_viii(1);

figure(10);
subplot(1,2,1)
colormap( [jet(520); halfjet; 0 0 0] );
imagesc(linspace(-2.1, 0.5, 4000), linspace(-1.4, 1.4, 4000), log(count));
axis equal
axis xy
axis off
title('Mandelbrot Set')

subplot(1,2,2)
imagesc(linspace(0.2, 0.45, 4000), linspace(0.45, 0.71, 4000), log(count2));
axis equal
axis xy
axis off
title('1985 Sci. Amer. Cover')