% Example to homework assignment 5, TAM 674 spring 2003.
% Lagrange equations, fully automatic.

%	A.L. Schwab	20-feb-98
%	Copyright (c) 1998 by TU-Delft, the Netherlands.
clear
 
% define some symbolic variables
syms m g l 
syms u v ud vd udd vdd fu fv

% generalized coordinates q=(u,v)
% u is angle of bar 1 with respect to x-axis
% v is angle of bar 2 with respect to bar 1, straight = 0.
q=[u; v];
qd=[ud; vd];
qdd=[udd; vdd];
Q=[fu; fv];

I=1/12*m*l^2;

% position cm bar 1
p1=[l/2*cos(u);l/2*sin(u)];
pB=[l*cos(u);l*sin(u)];
% position cm bar 2
p2=pB+[l/2*cos(u+v);l/2*sin(u+v)];

% velocities of cm's, just partial derivatives times qdot
p1d=jacobian(p1,q)*qd;
p2d=jacobian(p2,q)*qd;

% Kinetic energy of bar 1 and 2
T1=1/2*m*p1d.'*p1d+1/2*I*ud^2;
T2=1/2*m*p2d.'*p2d+1/2*I*(ud+vd)^2;
% Kinetic energy of the system
T=T1+T2;

% Potential energy, only gravity
V=-m*g*p1(1)-m*g*p2(1);

T=simple(T);
pretty(T);

% Lagrange equations of motion
dT=jacobian(T,qd);
eqn=jacobian(dT,qd)*qdd+jacobian(dT,q)*qd-jacobian(T,q).'+jacobian(V,q).'-Q;
eqn=simple(eqn);
pretty(eqn);

% The eqn's are linear in the accelerations,
% a way to find the massmatrix is:
M=jacobian(eqn,qdd);
M=simple(M);
pretty(M);
%The righthandside of the eqn's is M*qdd minus the eqn's
rhs=M*qdd-eqn;
rhs=simple(rhs);
pretty(rhs);
% Solve for the accelerations, but........
% this is not a good way in general !
lhs=inv(M)*rhs;
lhs=simple(lhs);
pretty(lhs);

% parameters from assignment 1
l0=0.5;
A0=0.050*0.045;
g0=9.81;
% specific mass of wood
rho0=450;
% dependent parameters
m0=rho0*A0*l0;
% Substitute the initial conditions 1a and parameter values, but...
% as stated above you should never do it this way!
icvar={u,v,ud,vd,fu,fv,m,g,l};
icval={pi/2,0,0,0,0,0,m0,g0,l0};
qdd0=subs(lhs,icvar,icval)
