function moveto(x,y)
global PSFID

if nargin==1
  fprintf(PSFID,'%g %g M\n',x(1),x(2));
else
  fprintf(PSFID,'%g %g M\n',x,y);
end