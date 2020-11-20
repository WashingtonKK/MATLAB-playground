clear
%%
%The striking mechanism of a weaving machine consists of a four bar linkage. 
%In a particular case, such a linkage is required to coordinate five positions of the rocker follower
%with five positions of the input crank as shown in the Table 1. 
%The length of the fixed link is required to be 180mm.

%%
%Values of input and output angles are given below
input_angle = [40; 45; 50; 55; 60];
output_angle = [70; 76; 83; 91; 100];

%%
sum_in = cosd(input_angle);
sum_in = sum(sum_in , 'all');
sum_out = sum(cosd(output_angle), 'all' );
sol = cosd ( input_angle - output_angle );
sum_sol = sum ( sol, 'all' );

%%
syms k1 k2 k3
F = (0.51471*k1 - 3.1895*k2 + 5*k3 - 4.1369)^2 == 0;
F1 = diff(F, k1);
F2 = diff( F, k2 );
F3 = diff ( F, k3 );
%%
[A, B] = equationsToMatrix( [F1, F2, F3] , [k1, k2, k3] );
A = double (A);
B = double (B);
%%
K = linsolve (A, B);