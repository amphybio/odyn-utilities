# loop
outputfile = sprintf('./figures/heat%d.gif',i)
set output outputfile
plot inputfile index i matrix with image
i = i + 1
if(i<end_time) reread;
