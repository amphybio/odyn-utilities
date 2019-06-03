reset
set term gif animate transparent size 780, 720
unset title
unset key
unset xtics
unset ytics
unset ztics
unset colorbox
set border 0
set xrange [ -1.2 : 202 ] noreverse nowriteback
set yrange [ -1 : 202 ] noreverse nowriteback
set cbrange [0:2] noreverse nowriteback
set palette defined (0 "white", 1 "blue", 2 "red")
i=0
end_time = 94
load "anime.gnuplot"
set output
