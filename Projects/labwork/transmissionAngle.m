function [Angl] = transmissionAngle(crank, coupler, follower, fixed, input)
    %%Using this function to compute the transmission angles based on a
    %  particular input angle
    %     a2 = a^2;
    %     b2 = b^2;
    %     c2 = c^2;
    %     d2 = d^2;
    Angl = acosd( ((coupler^2)+(follower^2)-(crank^2)-(fixed^2)+(2*crank*fixed*(cosd(input))) )/(2*coupler*follower) );
end

