clc;
%part a (Freudenstein's)
fixed = input('Input the length of the fixed link: ');
theta_2 = [];
theta_4 = [];
theta_not = input('Input the starting range of theta 2: ');
theta_f = input('Input the final value of the range of theta 2: ');
n = input('Input the number of precision points: ');
j = 1;
while (j < 4)
    precision_2 = 0.5*(theta_not+theta_f)- 0.5*(theta_f-theta_not)*cosd(180*(2*(j)-1)/(2*n));
    precision_4 = (precision_2)*0.43 +65;
    theta_2 = [theta_2, precision_2];
    theta_4 = [theta_4, precision_4 ];
    j = j+1;
end

A = [cosd(theta_4(1,1)), -cosd(theta_2(1,1)), 1 ; cosd(theta_4(1,2)), -cosd(theta_2(1,2)), 1 ; cosd(theta_4(1,3)), -cosd(theta_2(1,3)), 1];
B = [cosd(theta_2(1,1) - theta_4(1,1)) ; cosd(theta_2(1,2) - theta_4(1,2)) ; cosd(theta_2(1,3) - theta_4(1,3)) ];
sol = linsolve(A,B);

K1 = sol(1,1);
K2 = sol(2,1);
K3 = sol(3,1);

fprintf('K1 = %.15g\n',K1);
fprintf('K2 = %.15g\n',K2);
fprintf('K3 = %.15g\n',K3);

crank_length = fixed /K1;
follower_length = fixed / K2;
coupler_length = sqrt((crank_length*crank_length)+(follower_length*follower_length)+(fixed*fixed)-(K3*2*crank_length*follower_length));

fprintf('crank_length = %.15g\n',crank_length);
fprintf('follower_length = %.15g\n',follower_length);
fprintf('coupler_length = %.15g\n',coupler_length);

%transmssion_angle;
theta = 15 :5 :165;
transmission_angle = acosd(((coupler_length^2)+(follower_length^2)-(crank_length^2)-(fixed^2)+(2*crank_length*fixed*cosd(theta)))/(2*coupler_length*follower_length));
disp(' ')
disp('TABLE OF ANGULAR INPUT AND TRANSMISSION ANGLES')
disp('   input    transmission   ')
disp([theta',transmission_angle'])
subplot(2,1,1),plot(theta,transmission_angle),xlabel('\theta(degrees)'),ylabel('transmission angle'),title('transmission angle vs \theta'),grid on
output = 65 + 0.43*theta;


%structural error part a)
structural_error = K1*cosd(output)- K2*cosd(theta)+K3-cosd(theta - output);
disp(structural_error)
disp('TABLE OF INPUT ANGLES AND STRUCTURAL ERRORS')
disp('   input    error   ')
disp([theta',structural_error'])
subplot(2,1,2),plot(theta,structural_error),xlabel('\theta(degrees)'),ylabel('structural error'),title('structural error vs \theta'),grid on

%part b (Least Square)
disp('LEAST   SQUARE')
n5 = input('Input the number of precision points: ');
theta_22 = [];
theta_42 = [];
p=1;
while (p < 6)
    precision_22 = 0.5*(theta_not+theta_f)- 0.5*(theta_f-theta_not)*cosd(180*(2*(p)-1)/(2*n5));
    precision_42 = (precision_22)*0.43 +65;
    theta_22 = [theta_22, precision_22];
    theta_42 = [theta_42, precision_42 ];
    p = p+1;
end
ci = cosd(theta_22);
sumci = sum(cosd(theta_22));
co = cosd(theta_42);
sumco = sum(cosd(theta_42));
sumci2 = sum(cosd(theta_22).^2);
sumco2 = sum(cosd(theta_42).^2);
diff = cosd(theta_22-theta_42);
sumd = sum(diff);
e1 =     [
        sumco2,  - sum(co.*ci), sum(co);
        sum(co.*ci), -sumci2, sumci;
        sumco,-sumci,5];
e2 = [sum(co.*diff); sum(ci.*diff); sumd];
als = linsolve(e1,e2);

K1 = als(1);
K2 = als(2);
K3 = als(3);

fprintf('K1 = %.15g\n',K1);
fprintf('K2 = %.15g\n',K2);
fprintf('K3 = %.15g\n',K3);

crank_length = fixed /K1;
follower_length = fixed / K2;
coupler_length = sqrt((crank_length*crank_length)+(follower_length*follower_length)+(fixed*fixed)-(K3*2*crank_length*follower_length));

fprintf('crank_length = %.15g\n',crank_length);
fprintf('follower_length = %.15g\n',follower_length);
fprintf('coupler_length = %.15g\n',coupler_length);

%structural error part b)
structural_error = K1*cosd(output)- K2*cosd(theta)+K3-cosd(theta - output);
disp('TABLE OF INPUT ANGLES AND STRUCTURAL ERRORS')
disp('   input    error   ')
disp([theta',structural_error'])
hold all
subplot(2,1,2),plot(theta,structural_error),xlabel('\theta(degrees)'),ylabel('structural error'),title('structural error vs \theta'),grid on




    