function [transmissionAngl] = transmissionAngle(a, b, c, d, input)
    %%Using this function to compute the transmission angles based on a
    %  particular input angle
    a2 = a^2;
    b2 = b^2;
    c2 = c^2;
    d2 = d^2;
    transmissionAngl = ( (b2 + c2 - a2 - d2 + 2*a*d*(cosd(input)) ) / (2*b*c) );
end

