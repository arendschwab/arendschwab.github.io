function fig4

global PSFID
if exist('tdleans')~=1
  load run19sm.mat;
end;
PSFID=fopen('fig3bLeanYawRateStableBicycle.ps','w')
header
boundingbox(164,381,401,582)
pstitle('Stable Bicycle GB7Sv9e lean and yaw angles and rates measured and simulated')
creator('pshacker')
creationdate(date)
prolog
d=0.24;
translate(200,400)
selectfont('Helvetica-Oblique',8)
% b=5*40;
% h=8*18;
b=5*40;
h=8*22.5;


xmin=0;
xmax=5;
dx=xmax-xmin;

ymin=-0.8;
ymax=0.8;
dy=ymax-ymin;

newpath
setlinewidth(3*d)
moveto(0,h+1*d/2)
lineto(0,0)
lineto(b+1*d/2,0)
stroke
%rectstroke(0,0,b,h)
newpath
setlinewidth(1*d)
nb=5;
% gridlines
% moveto(0,0)
% for x=b/nb:b/nb:b
%   moveto(x,0)
%   lineto(x,h)
% end
% ticks
tl=4;
moveto(0,0)
for x=b/nb:b/nb:b
  moveto(x,0)
  rlineto(0,tl)
%   moveto(x,h)
%   rlineto(0,-tl)
end
nh=8;
% gridlines
% moveto(0,0)
% for y=h/nh:h/nh:h
%   moveto(0,y)
%   lineto(b,y)
% end
% ticks
tl=4;
moveto(0,0)
for y=h/nh:h/nh:h
  moveto(0,y)
  rlineto(tl,0)
%   moveto(b,y)
%   rlineto(-tl,0)
end
% zero line
moveto(0,h/dy*(0-ymin))
lineto(b,h/dy*(0-ymin))
moveto(b/dx*(0-xmin),0)
lineto(b/dx*(0-xmin),h)
stroke



ch1={'0';'1';'2';'3';'4';'5'};
x=-3:b/nb:b;
x(1)=-2;
x(end)=x(end)-4;
for i=1:length(ch1)
  moveto(x(i),-10)
  show(char(ch1(i)))
end
ch2={'-0.8';'-0.6';'-0.4';'-0.2';'    0';' 0.2';' 0.4';' 0.6';' 0.8'};
y=-3:h/nh:h;
y(1)=0;
y(end)=y(end)-2;
for i=1:length(ch2)
  moveto(-17,y(i))
  show(char(ch2(i)))
end

comment('de grafiek')
rectclip(0,0,b,h)
setlinejoin(1)
setlinewidth(4*d)


% leanrate simulated and measured
setlinewidth(4*d)
setdash([],0)
xa=b/dx*(tdleans-xmin);
ya=h/dy.*(dleans-ymin);
newpath
moveto(xa(1),ya(1))
for i=2:length(xa)
  lineto(xa(i),ya(i))
end
stroke

msize=12*d;

setlinewidth(2*d)
xb=b/dx*(tdleanm-xmin);
yb=h/dy.*(dleanm-ymin);
newpath
for i=1:length(xb)
  marker(xb(i),yb(i),msize,2)
end
stroke

% yawrate simulated and measured
gray=0.6;
setgray(gray);
setlinewidth(4*d)
setdash([6 2],0)
xc=b/dx*(tdyaws-xmin);
yc=h/dy.*(dyaws-ymin);
newpath
moveto(xc(1),yc(1))
for i=2:length(xc)
  lineto(xc(i),yc(i))
end
stroke

setlinewidth(2*d)
setdash([],0)
xd=b/dx*(tdyawm-xmin);
yd=h/dy.*(dyawm-ymin);
newpath
for i=1:length(xd)
  marker(xd(i),yd(i),msize,4)
end
stroke


initclip
setgray(0)

newpath
% selectfont('Symbol',8)
% moveto(-36,h-0)
% show('f')
% rmoveto(-3,7)
% show('.')
selectfont('Helvetica-Oblique',8)
moveto(-35,6.5/8*h-2)
show('[rad/s]')
selectfont('Helvetica-Bold',10)
moveto(-35,175)
show('B')

% selectfont('Symbol',8)
% moveto(-36,h-20)
% show('d')
% rmoveto(-3,7)
% show('.')
% selectfont('Helvetica-Oblique',8)
% moveto(-29,h-20)
% show('[rad/s]')

selectfont('Helvetica-Oblique',8)
moveto(122,-17)
show('t [sec]')
stroke

tx=-50;ty=40;
translate(tx,ty)
selectfont('Helvetica-Oblique',8)
setlinewidth(2*d)
newpath
marker(94,107,msize,2)
moveto(100,105)
show('measured lean rate')
stroke
setlinewidth(4*d)
newpath
moveto(88,97)
rlineto(10,0)
moveto(100,95)
show('simulated lean rate')
stroke
translate(-tx,-ty)

tx=0;ty=10;
translate(tx,ty)
translate(0,0)
setgray(gray)
setlinewidth(2*d)
newpath
marker(100,27,msize,4)
moveto(107,25)
show('measured yaw rate')
stroke
setlinewidth(4*d)
setdash([6 2],2)
newpath
moveto(95,17)
rlineto(10,0)
moveto(107,15)
show('simulated yaw rate')
stroke

showpage
trailer
eof
fclose(PSFID)

end

function marker(x,y,size,type)
%function marker(x,y,size,type)
% type: 1=+ 2=x 3=0 4=triangle

if nargin==3
    type=1
end

dx=size/2;
if type==1
    moveto(x-dx,y-dx)
    rlineto(size,size)
    rmoveto(-size,0)
    rlineto(size,-size)
elseif type==2
    moveto(x-dx,y)
    rlineto(size,0)
    rmoveto(-dx,dx)
    rlineto(0,-size)
elseif type==3
    circle(x,y,dx)
elseif type==4
    dx=2*dx;
    moveto(x,y+dx)
    rlineto(-dx/2,-0.866*dx)
    rlineto(dx,0)
    rlineto(-dx/2, 0.866*dx)
    rlineto(-dx/2,-0.866*dx)

end
end


