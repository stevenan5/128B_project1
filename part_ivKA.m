function [X,Y,b] = part_ivKA(J)
J=J-1; % Making the matrix valued with 0s and 1s
switch size(J,2) % switching between the two J matrix sizes, adding columns and rows to achieve multiples of 32
    case 721
        J=[J zeros(281,15)];
        J=[J; zeros(7,736)];
    case 401
        J=[J zeros(401,15)];
        J=[J; zeros(15,416)];
end


nrow = size(J,1); % Getting the number of rows
ncol = size(J,2); % Getting the number of columns

X = 2.^[0 1 2 3 4 5]; % Setting X as our scaling factor vector (larger number is finer mesh, scales linearly with factor)
Y = []; % Initializing an empty Y to later hold our N Values
for i = 32./X
    N = 0;
    n = i^2;
    M = (nrow+ncol)/i;
    for m=1:n
        Nprime = 0;
        for r=1:nrow/i
            for c=1:ncol/i
                if nnz(J((r-1)*i+1:r*i,(c-1)*i+1:c*i))==m
                    Nprime = Nprime+1;
                end
            end
        end
        N=N+(Nprime/M)/m;
    end
    Y=[Y N];
end

b=LinearModel.fit(log(X),log(Y)).Coefficients{2,1};
end