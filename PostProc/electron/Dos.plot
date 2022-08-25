# This gnuplot script plot the density of state (dos) of Mg. 
# Here x-axis is offset to VBM.

 
# set terminal type
set terminal postscript enhanced color font 'Helvetica-Bold,16'
set output 'Dos.ps'
xmin=-0.5
xmax=9.0
ymin=-0.5
ymax=10.0
set xr [xmin : xmax]
set yr [ymin : ymax]
set title 'Plot of Density of states (spin-down)'
set xl 'Energy (eV)'
set yl 'Density of States (Arb. unit)'
set format y '%9.4f'
unset ytics
set xtics 1
set mxtics 2
set key default
# defining line/arrowstyles
set style arrow 1 lt 0 lw 1 lc rgb 'black' nohead
set style line 1 lt 1 lw 3 pt 5 ps 2 lc rgb 'blue'
set style line 2 lt 1 lw 2 pt 6 ps 2 lc rgb 'red'

set arrow from 0,0 to 0,ymax as 1

#plot 'Dos.dat' u 1:2 w l noti ls 1
plot 'Dos.dat' u 1:3 w l noti ls 2

set output
! ps2pdf Dos.ps
! rm Dos.ps




