function [xdd,Fv]=daehwa1(x,xd)
%function [xdd,Fv]=daehwa1(x,xd)

%	A.L. Schwab	21-mar-2000
%	Copyright (c) 2000 by TU-Delft, the Netherlands.
global m l I g

% Assign properties to the individual bodies
l1=l;
l2=l;
m1=m;
m2=m;
I1=I;
I2=I;
% Copy the position
x1=x(1);
y1=x(2);
phi1=x(3);
x2=x(4);
y2=x(5);
phi2=x(6);
% Copy the velocties
phid1=xd(3);
phid2=xd(6);
% Shorthand for sine and cosine
s1=sin(phi1);
c1=cos(phi1);
s2=sin(phi2);
c2=cos(phi2);
% Setup the Equations of motion
Bmat=[m1 0 0 0 0 0 -1 0 1 0
      0 m1 0 0 0 0 0 -1 0 1
	  0 0 I1 0 0 0 -l1/2*s1 l1/2*c1 -l1/2*s1 l1/2*c1
	  0 0 0 m2 0 0 0 0 -1 0
	  0 0 0 0 m2 0 0 0 0 -1
	  0 0 0 0 0 I2 0 0 -l2/2*s2 l2/2*c2];
% Determine the right-hand side
rhsB=[m1*g 0 0 m2*g 0 0]';
% Setup the Constraint equations on the Acc. level
Vmat=[1 0  l1/2*s1 0 0 0 0 0 0 0 
      0 1 -l1/2*c1 0 0 0 0 0 0 0
	  -1 0 l1/2*s1 1 0 l2/2*s2 0 0 0 0
	  0 -1 -l1/2*c1 0 1 -l2/2*c2 0 0 0 0];
% Right-hand side of these constraint eqns.
rhsV=[-l1/2*c1*phid1^2
      -l1/2*s1*phid1^2
	  -l1/2*c1*phid1^2-l2/2*c2*phid2^2
	  -l1/2*s1*phid1^2-l2/2*s2*phid2^2];
% Assemble the set of Differential and Algebraic Equations (DAE)
Smat=[Bmat;Vmat];
% and their right-hand side.
rhs=[rhsB;rhsV];
% Solve them by lhs=inv(Smat)*rhs or even better with the slash operator:
lhs=Smat\rhs;
% type 'help slash'
% Copy the solution into xdd and Fv.
xdd=lhs(1:6)';
Fv=lhs(7:10)';



