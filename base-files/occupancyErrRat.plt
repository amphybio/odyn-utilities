set terminal postscript portrait enhanced size 3.24in,2in color "Helvetica" 10 
set output outputfile

set autoscale                    
#set xtics ("1" 1, "3" 3, "5" 5, "7" 7, "9" 9)
set ytic auto
set title "Final densities"
set xlabel "{/Symbol a}_2/{/Symbol a}_1"

set tics scale 0
unset ylabel

set key right top #outside
#set logscale x
plot  	inputfile every 1  using ($1):($3):($3-$5):($3+$5) notitle   with yerrorbar pt 7 ps 0.6 lc rgb "blue" lw 1, \
        inputfile every 1  using ($1):($4):($4-$6):($4+$6) notitle   with yerrorbar pt 7 ps 0.6 lc rgb "red"  lw 1, \
	inputfile every 1  using ($1):($3) title 'Type 1' with lines lt 1 lc rgb "blue" lw 2 , \
        inputfile every 1  using ($1):($4) title 'Type 2' with lines lt 1 lc rgb "red"  lw 2 

