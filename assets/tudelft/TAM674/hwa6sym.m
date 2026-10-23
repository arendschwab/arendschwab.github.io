% This files derives the necessary derivatives for
% setting up the equations of motion in terms of 
% generalized independant coordinates.
%
% The result is cut-and-pasteed in the file with
% the equations of motion: odehwa6.m
% 
% Homework Assigment 6, double pendulum.
% TAM674, Applied Multibody Dynamics, Spring 2003.

%     Arend L. Schwab 26-Feb-2003
%     Copyright (c) 2003 by TU-Delft, the Netherlands.

clear all

syms x1 y1 p1 x2 y2 p2
syms xd1 yd1 pd1 xd2 yd2 pd2

syms u v
syms ud vd

syms l

x = [x1; y1; p1; x2; y2; p2];
q = [u; v];
qd = [ud; vd];

x1 = l/2*cos(u);
y1 = l/2*sin(u);
p1 = u;
x2 = l*cos(u)+l/2*cos(u+v);
y2 = l*sin(u)+l/2*sin(u+v);
p2 = u+v;

Fi = [x1; y1; p1; x2; y2; p2];

Fij = jacobian(Fi,q);
Fij = simple(Fij)

Fdi=Fij*qd;
gk=jacobian(Fdi,q)*qd;
gk = simple(gk)

