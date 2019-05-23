set terminal postscript portrait enhanced size 6.48in,4in color "Helvetica" 10 
set output outputfile

set autoscale                    
set ytic auto 
set title "Cell density dynamics"
set xlabel "Number interations in log scale"
set ylabel "Fractional occupancy"

set tics scale 0

set key left top #outside
set logscale x
plot  	inputfile every 1  using ($1):($3):($3-$5):($3+$5) notitle   with yerrorbar pt 7 ps 0.6 lc rgb "blue" lw 1, \
        inputfile every 1  using ($1):($4):($4-$6):($4+$6) notitle   with yerrorbar pt 7 ps 0.6 lc rgb "red"  lw 1, \
	inputfile every 1  using ($1):($3) title 'Type 1' with lines lt 1 lc rgb "blue" lw 2 , \
        inputfile every 1  using ($1):($4) title 'Type 2' with lines lt 1 lc rgb "red"  lw 2 

