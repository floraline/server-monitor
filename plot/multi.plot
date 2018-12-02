set title "CKO Performance Summary"

set output './output/multi-usage.svg'
set terminal svg size 600,400 dynamic #mouse jsdir 'js'

set multiplot

set xdata time
set timefmt "%m/%d/%y_%H:%M"

set style line 12 lc rgb '#99808080' lt 0 lw 0.5
set grid back ls 12 noxtics

set xlabel ""
set xrange [ARG1:ARG2]
set format x "%l:%M %p"
set xtics ARG1,21600,ARG2 #21600
set mxtics 6

set lmargin screen 0.1
set rmargin screen 0.9

# plot 1
set key on l t inside height -0.8 noreverse

set ylabel "Percent Used" offset 1.5, 0
set yrange [0:100<*]
set format y "%.0f%%"

plot "./data/cpu-load" using 1:2 with lines linestyle 1 title "CPU", \
     "./data/disk-space" using 1:2 with lines linestyle 2 title "Disk", \
     "./data/memory" using 1:2 with lines linestyle 3 title "Memory"

# plot 2
set key on l t inside width 12 height -0.8

set y2label "Players" #offset -5, 0
set y2range [0:50<*]
set format y2 "%.0f"
set y2tics scale 0 #offset -6, 0

set border 3 front back

unset grid

plot "./data/players" using 1:2 axes x1y2 with steps linestyle 4 title "Players"

unset multiplot
