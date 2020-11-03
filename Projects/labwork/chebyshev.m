function [precisionPoints] = chebyshev(theta1,theta2, n)
%An implementation of the chebyshev spacing equation
%Input parameters: (theta1 <= theta <= theta2) for j number of precision
%points
%               theta1--> minimum value in the range for theta
%               theta2--> maximum value in the range for theta
%               n     --> number of precision points
%The input angles are computed as shown in the formula below
% theta = 0.5(theta1 + theta2) + 0.5(theta2 - theta1)*cos((pi*(2*j -1)/2n)

precisionPoints = zeros(n,1);

    for index = 1:n
%         x = 0.5*(theta1 + theta2)+ 0.5*(theta2 - theta1)*cos((pi*(2*a - 1)/(2*li)));
%         precisionPoints (n, 1) = x;
        precisionPoints (index , 1) = 0.5 * (theta1 + theta2) +  0.5*(theta2 - theta1) * cos((pi*(2*index - 1)/(2*n)));

    end
    
end

