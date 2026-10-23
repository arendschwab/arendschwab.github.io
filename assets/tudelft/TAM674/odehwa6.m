% This files contains the ordinary differential equations
% for a double pendulum.
%
% The first order kinematic transform function Fij
% and the convective accelerations gk are cut-and-pasted
% from the symbolic derivations as done by: hwa6sym.m
% 
% Homework Assigment 6, double pendulum.
% TAM674, Applied Multibody Dynamics, Spring 2003.

%     Arend L. Schwab 26-Feb-2003
%     Copyright (c) 2003 by TU-Delft, the Netherlands.

function dy = odehwa6(t,y)
global m l J g

% copy the input to meaningfull variables
u = y(1);
v = y(2);
ud = y(3);
vd = y(4);

% copy-and-pasted result from symbolic derivations
Fij = [            -1/2*l*sin(u),                        0
                    1/2*l*cos(u),                        0
                               1,                        0
        -l*sin(u)-1/2*l*sin(u+v),          -1/2*l*sin(u+v)
         l*cos(u)+1/2*l*cos(u+v),           1/2*l*cos(u+v)
                               1,                        1];
gk = [                                            -1/2*l*cos(u)*ud^2
                                                  -1/2*l*sin(u)*ud^2
                                                                   0
 -1/2*l*(2*cos(u)*ud^2+cos(u+v)*ud^2+2*ud*cos(u+v)*vd+cos(u+v)*vd^2)
 -1/2*l*(2*sin(u)*ud^2+sin(u+v)*ud^2+2*ud*sin(u+v)*vd+sin(u+v)*vd^2)
                                                                  0];
% mass matrix
Mik = diag([m, m, J, m, m, J]);

% reduced massmatrix
Mr=Fij.'*Mik*Fij;

% applied forces
fi = [m*g; 0; 0; m*g; 0; 0];
% applied generalized forces
Qj = [0; 0];

% reduced generalized forces vector
Qr=Qj+Fij.'*(fi-Mik*gk);

% solve for qdd
qdd = Mr\Qr;

% copy the qd and qdd to the output dy
dy=[ud; vd; qdd];
                                                             
                                                                 
