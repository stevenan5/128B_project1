% Execution of all parts.

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
title('c = -1.25')

figure(2)
colormap([1 0 0; 1 1 1]); 
image([-1 1],[-1 1],M2),
axis image;                    % makes the image square.
axis xy
title('c = 0')

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
image([-1.8 1.8],[-.7 .7],P1),
axis xy
title('c = 0.36 + 0.1i')
xlabel('no perturb')

figure(4);
colormap([1 0 0; 1 1 1]);
image([-1.9 1.9],[-.8 .8],P2),
axis xy
title('c=0.36+0.1i')
xlabel('pert +0.4')

figure(5);
colormap([1 0 0; 1 1 1]);
image([-2 2],[-.9 .9],P3), 
axis xy
title('c=0.36+0.1i')
xlabel('pert +0.6')

figure(6);
colormap([1 0 0; 1 1 1]);
image([-1.8 1.8],[-.7 .7],P4), 
axis xy
title('c=-0.123-0.745i')
xlabel('no perturb')

figure(7);
colormap([1 0 0; 1 1 1]);
image([-1.9 1.9],[-.8 .8],P5),
axis xy
title('c=-0.123-0.745i')
xlabel('pert + 0.4')

figure(8);
colormap([1 0 0; 1 1 1]);
image([-2 2],[-.9 .9],P6), 
axis xy
title('c=-0.123-0.745i')
xlabel('pert +0.6')

%% Part iii 

[J1, J1_matrix] = part_iii(0);
[J2, J2_matrix] = part_iii(1);
[J3, J3_matrix] = part_iii(2);
[J4, J4_matrix] = part_iii(3);

figure(9);
plot(real(J1), imag(J1), '.')
axis equal
axis xy
title('c = -1.25')

figure(10);
plot(real(J2), imag(J2), '.')
axis equal
axis xy
title('c = 0')

figure(11);
plot(real(J3), imag(J3), '.')
axis equal
axis xy
title('c = - 0.123 - 0.745i')

figure(12);
plot(real(J4), imag(J4), '.')
axis equal
axis xy
title('c = 0.36 + 0.1i')

%% Part iv
load('part_iii_matrix_data.mat')
[J1X, J1Y, J1b] = part_ivRBC(J1_matrix);
[J2X, J2Y, J2b] = part_ivRBC(J2_matrix);
[J3X, J3Y, J3b] = part_ivRBC(J3_matrix);
[J4X, J4Y, J4b] = part_ivRBC(J4_matrix);
%scatter(log(J1X), log(J1Y))
%lsline
%[J2X, J2Y, J1b] = part_ivRBC(J2_matrix);
%scatter(log(J2X), log(J2Y))
%lsline

figure(13);
subplot(2,2,1); scatter(log(J1X), log(J1Y)) 
    lsline
    xlabel(strcat('D=',num2str(J1b)))
    title('Reticular Box Counting Method for c = -1.25')
    
subplot(2,2,2); scatter(log(J2X), log(J2Y))
    lsline
    xlabel(strcat('D=',num2str(J2b)))
    title('Reticular Box Counting Method for c = 0')
    
subplot(2,2,3); scatter(log(J3X), log(J3Y))
    lsline
    xlabel(strcat('D=',num2str(J3b)))
    title('Reticular Box Counting Method for c = - 0.123 - 0.745i')
    
subplot(2,2,4); scatter(log(J4X), log(J4Y)) 
    lsline
    xlabel(strcat('D=',num2str(J4b)))
    title('Reticular Box Counting Method for c = 0.36 + 0.1')
%% Part v

connected_1 = part_v(-1.25);
connected_2 = part_v(0);
connected_3 = part_v(0.36 + 0.1i);
connected_4 = part_v(- 0.123 - 0.745i);

fprintf('For c = -1.25, boolean value for connected is %d\n', connected_1);
fprintf('For c = 0, boolean value for connected is %d\n', connected_2);
fprintf('For c = 0.36 + 0.1i, boolean value for connected is %d\n', connected_3);
fprintf('For c = -0.123 - 0.745i, boolean value for connected is %d\n', connected_4);

%% Part vi

[count] = part_vi(0);
[count1] = part_vi(1);
[count2] = part_vi(2);
[count3] = part_vi(3);

figure(13);
colormap( [jet(520); halfjet; 0 0 0] );
imagesc(linspace(-1.4, 1.4, 2801), linspace(-1.4, 1.4, 2801), log(count));
axis equal
axis xy
axis off
title('c = -1.25')

figure(14);
colormap( [jet(520); halfjet; 0 0 0] );
imagesc(linspace(-1, 1, 2001), linspace(-1, 1, 2001), log(count1));
axis equal
axis xy
axis off
title('c = 0')

figure(15);
colormap( [jet(520); halfjet; 0 0 0] );
imagesc(linspace(-1.4, 1.4, 2801), linspace(-1.4, 1.4, 2801), log(count2));
axis equal
axis xy
axis off
title('c = - 0.123 - 0.745i')

figure(16);
colormap( [jet(520); halfjet; 0 0 0] );
imagesc(linspace(-1.4, 1.4, 2801), linspace(-1.4, 1.4, 2801), log(count3));
axis equal
axis xy
axis off
title('c = 0.36 + 0.1i')
colormap( [jet(520); halfjet; 0 0 0] );

%% Part vii

[count, basin] = part_vii(3);
[count2, basin2] = part_vii(4);

% compute roots of unity
rou3 = zeros(3, 1);
for i = 0:2
   rou3(i + 1) = exp(2 / 3 * 1i * pi * i);  
end

rou4 = zeros(4, 1);
for i = 0:3
   rou4(i + 1) = exp(1 / 2 * 1i * pi * i);  
end

figure(17);
colormap(flipud(jet(200)));
imagesc(linspace(-3, 3, 601), linspace(-3, 3, 601), count);
hold on
plot(real(rou3), imag(rou3), 'w*');
axis equal
axis xy
hold off
title('z^3-1 orbit')

figure(18);
colormap(flipud(jet(200)));
imagesc(linspace(-3, 3, 601), linspace(-3, 3, 601), basin);
hold on
plot(real(rou3), imag(rou3), 'w*');
axis equal
axis xy
hold off
title('z^3 - 1 basin of roots')


figure(19)
imagesc(linspace(-3, 3, 601), linspace(-3, 3, 601), count2);
hold on
plot(real(rou4), imag(rou4), 'w*');
axis equal
axis xy
hold off
title('z^4 - 1')
colormap(flipud(jet(200)));

figure(20)
imagesc(linspace(-3, 3, 601), linspace(-3, 3, 601), basin2);
hold on
plot(real(rou4), imag(rou4), 'w*');
axis equal
axis xy
hold off
title('z^4 - 1 basin of roots')



%% Part viii

[count] = part_viii(0);
[count2] = part_viii(1);

figure(21);

colormap( [jet(520); halfjet; 0 0 0] );
imagesc(linspace(-2.1, 0.5, 4000), linspace(-1.4, 1.4, 4000), log(count));
axis equal
axis xy
axis off
title('Mandelbrot Set')

figure(22);
colormap( [jet(520); halfjet; 0 0 0] );
imagesc(linspace(0.2, 0.45, 4000), linspace(0.45, 0.71, 4000), log(count2));
axis equal
axis xy
axis off
title('1985 Sci. Amer. Cover')
