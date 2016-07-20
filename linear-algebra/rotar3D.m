function [x1,y1,z1] = rotar3D(x,y,z,theta,axis)
if nargin < 5
    axis = 'z';
end
theta = theta*(pi/180);
if strcmpi(axis,'x')
    M = [1       0          0     ;
         0  cos(theta) -sin(theta);
         0  sin(theta) cos(theta)];
elseif strcmpi(axis,'y')
    M = [cos(theta)  0  -sin(theta);
               0     1       0;
         sin(theta)  0  cos(theta)];
elseif strcmpi(axis,'z')
    M = [cos(theta) -sin(theta) 0 ;
         sin(theta) cos(theta)  0 ;
              0          0      1 ];
end

ROT = M*[x;y;z];

x1 = ROT(1);
y1 = ROT(2);
z1 = ROT(3);

end