%%Lab 1 section c

% Calculate the structural errors throughout the given range of input angles and
%           at an increment of 5
% for the two cases in (a) and (b). 
%Plot the variation of the
%   structural errors as a function of the input angles for the two cases 
%       and in the same axis

%%
%Structural errors for a.
%Values of K1, K2 and K3
theta2 = chebyshev(15,165,3);
theta4 = rel (theta2);
%Values for K1, K2, K3 are found in the vector K
K = freudenstein(theta2, theta4);
k1 = K(1,1);
k2 = K(2,1);
k3 = K(3,1);
inpRange = (15: 5: 165)';
outRange = rel(inpRange);

%%
%%Computing the structural error
e = k1*(cosd(outRange)) - k2*(cosd(inpRange)) + k3 - cosd(inpRange - outRange);

plot (inpRange, e);
xlabel("Input Range");
ylabel("Structural Error");
%%Computing the structural error for b
