% define a global variable which holds the postscript file identifier
global PSFID
% open the file that will contain the postsript commands
PSFID=fopen('exercise2.ps','w')
% write the header that every ps file needs
header
% write the bounding box to the file
boundingbox(5,5,105,105)
% write some shorthand notations to the file
prolog
a=10;
b=90;
newpath
moveto(a,a)
rlineto(b,0)
rlineto(0,b)
rlineto(-b,0)
closepath
setlinewidth(5)
stroke
showpage
% write some closing postscript statements to the file
trailer
eof
% close the file
fclose(PSFID)
