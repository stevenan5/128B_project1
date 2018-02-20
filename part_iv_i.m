% This is the first algorithm for part 4
% We are implementing the reticular cell counting method

function [b] = part_iv_i(J)

J = J*10000; % The accuracy of our julia sets is 0.0001, so we multiply to deal with integers
J = sort(J,'ComparisonMethod','real');
x = real(J)-real(J(1,1))+0.25; % Setting x values to the real values of J, while translating the values to the positive x axis
y = imag(J)-min(imag(J))+0.25; % Setting x values to the real values of J, while translating the values to the first quadrant
% Note we also add 0.25 so that we do not have boundary issues on the grid
% Because we already sorted by the real values, we don't have to use min
% for adjusting the x values

dist = max([x,y]); % finding the largest value in either direction
M = dist+0.75; % adding 0.75 to achieve an integer

len=length(x);

X = ones(10);
Y = ones(10);

for j=1:10
    s = 0.9^-(j+1);
    X(j) = s;
    N=0;
    for G=0:s:M
        for i=1:len
            if G<x(i) && x(i)<G+s && G<y(i) && y(i)<G+s
                N = N+1;
                break
            end
        end
    end
    
    Y(j) = N;
    
end
b = X\Y;
end