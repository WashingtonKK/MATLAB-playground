%%Part b of lab1 work

%     Evaluate the link lengths ratios K1, K2 and K3 using the least square method
%     for five precision points, and hence determine the length of the other links. 
%     Use Chebyshev’s spacing.


%Solving for K1, K2 and K3 with 5 precision points using the least square method
%
%%
%Finding the 5 precision points using chebyshev spacing
theta2 = chebyshev(15, 165, 5);

%Finding the value for output angle using the relationship (Theta4 = 65 +
%                                                                          0.43*theta2
theta4 = rel (theta2);

%%Formulating and solving the equation using Least square method
k1 = cosd(theta4);
k2 = cosd(theta2);
sol = cosd(theta2 - theta4);

mat = zeros (5,3);
