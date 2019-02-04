set title "7 days"

set output './output/multi-usage-7.svg'
set terminal svg size 600,400 dynamic #mouse jsdir 'js'

set multiplot

set xdata time
set timefmt "%m/%d/%y_%H:%M"

set style line 12 lc rgb '#99808080' lt 0 lw 0.5
set grid back ls 12 noxtics

set xlabel ""
set xrange [ARG1:ARG2]
set format x "%a"
set xtics ARG1,86400,ARG2 #21600=6hrs, 86400=24hrs
set mxtics 2

set lmargin screen 0.1
set rmargin screen 0.9

# plot 1
set key on l t inside height -0.8 noreverse

set ylabel "Percent Used" offset 1.5, 0 rotate
set yrange [0:100<*]
set format y "%.0f%%"
set ytics scale 0

plot "./data/disk-space" using 1:2 with fillsteps linestyle 6 fillstyle solid fillcolor "#DD009292" title "Disk", \
     "./data/cpu-load" using 1:2 with lines linestyle 5 title "CPU", \
     "./data/memory" using 1:2 with lines linestyle 7 title "Memory"

# plot 2
set key on l t inside width 12 height -0.8

set y2label "Players" #offset -5, 0
set y2range [0:25<*]
set format y2 "%.0f"
set y2tics scale 0 #offset -6, 0

unset grid

plot "./data/players" using 1:2 axes x1y2 with fsteps linestyle 8 title "Players"

unset multiplot
