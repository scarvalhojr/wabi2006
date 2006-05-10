set terminal epslatex monochrome 10
set output "position_weights.eps"
set size .55,.55

#set terminal png size 880,660
#set output "position_weights.png"

set xtics nomirror
set ytics mirror
set mxtics
set mytic

# display grid
#set grid ytics xtics

set xlabel "$b_{s,k}$"
#set ylabel "$\\omega(s,k)$"

plot [-0.5:25.5] "data/position_weights.dat" with points pointtype 6 notitle