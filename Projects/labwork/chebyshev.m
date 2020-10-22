function [precisionPoints1] = chebyshev(theta1,theta2, n)
%An implementation of the chebyshev spacing equation
%Input parameters: (theta1 <= theta <= theta2) for j number of precision
%points
%               theta1--> minimum value in the range for theta
%               theta2--> maximum value in the range for theta
%               n     --> number of precision points
%The input angles are computed as shown in the formula below
% theta = 0.5(theta1 + theta2) + 0.5(theta2 - theta1)*cos((pi*(2*j -1)/2n)

precisionPoints = zeros(n,1);
precisionPoints1 = zeros(n,1);
li = n;

    for index = 1:n
        a = n;
        x = 0.5*(theta1 + theta2)+ 0.5*(theta2 - theta1)*cos((pi*(2*a - 1)/(2*li)));
        precisionPoints (n, 1) = x;
       % precisionPoints (n, 1) = 0.5*(theta1 + theta2)+ 0.5*(theta2 - theta1)*cos((pi*(2*n - 1)/(2*li)));

    end
    
    i = 1;
    while ~(i < n)
        x = 0.5*(theta1 + theta2)+ 0.5*(theta2 - theta1)*cos((pi*(2*i - 1)/(2*n)));
        precisionPoints1 (i, 1) = x;
        i = i+1;
    end
end

