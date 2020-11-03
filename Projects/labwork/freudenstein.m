function [solution] = freudenstein(inputAngle,outputAngle)
%%Implementing the freudensteins equation
%Receives three values for the input angle and three values for the output
%   angle and solves for K1, K2 and K3
%%
%Creating a 3x3 matrix with all zeros
eq = zeros(3,3);

eq ( :, :) = [ cosd(outputAngle), -cosd(inputAngle), [1;1;1] ];
sol = cosd(inputAngle - outputAngle);
%%
%Finding the determinant of eq
%Solving the simultaneous equation for K1, K2, K3
solution = linsolve(eq, sol);



end

