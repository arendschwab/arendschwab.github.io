% Example of a m-file script in Matlab.
% Homework Assigment 1, double pendulum.
% TAM674, Applied Multibody Dynamics, Spring 2003.

%     A.L. Schwab 21-mar-2000
%     Copyright (c) 2000 by TU-Delft, the Netherlands.
global m l I g

% parameters
l=0.50;
w=0.05;
h=0.045;
g=9.81;
% specific mass of wood
rho=450;
% dependent parameters
A=w*h;
m=rho*A*l;
I=1/12*m*l^2;
% initial position
x=[0 l/2 pi/2 0 3*l/2 pi/2];
% initial velocities
xd=[0 0 0 0 0 0];
t=0;
w0=sqrt(g/l);
T0=2*pi/w0;
%dt=T0/32;
dt=0.1;
figure;
hold on
axis([-0.2*l 2.2*l -0.2*l 2.2*l]);
grid
axis equal
T=t;
X=x;
XD=xd;
% Calculate the accelerations and constraint forces 
% in the initial state.
[xdd,Fv]=daehwa1(x,xd);
XDD=xdd;
FV=Fv;
for i=2:4
  % Estimate new position and new velocity by an Euler step.
  x=x+xd.*dt;
  xd=xd+xdd.*dt;
  % Acc. and Cons. Forces in new state.
  [xdd,Fv]=daehwa1(x,xd);
  % Increment time.
  t=t+dt;
  % Plot this configuration.
  line([x(1)-l/2*cos(x(3)),x(1)+l/2*cos(x(3))],[x(2)-l/2*sin(x(3)),x(2)+l/2*sin(x(3))]);
  si=sprintf('%d',i);
  %text(x(1),x(2),si);
  line([x(4)-l/2*cos(x(6)),x(4)+l/2*cos(x(6))],[x(5)-l/2*sin(x(6)),x(5)+l/2*sin(x(6))]);
  %text(x(4),x(5),si);
  % Save this state
  T(i)=t;
  X(i,:)=x;
  XD(i,:)=xd;
  XDD(i,:)=xdd;
  FV(i,:)=Fv;
end

format short
a=XDD.'
v=XD.'
x=X.'
Fv=FV.'