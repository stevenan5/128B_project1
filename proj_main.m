% Execution of all parts.

clc;
clear;

%% Part i

% the code for plotting has been moved outside of the function 
M = part_i();
figure(1);
image([-1.8 1.8],[-.7 .7],M),  % This plots the results.
axis xy                        % If you don't do this, vertical axis is inverted.

