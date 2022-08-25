# This gnuplot script plot the band structure of cubic Mg. 
# Here y-axis is offset to VBM.


# set terminal type
set encoding iso_8859_15
set terminal postscript enhanced color font 'Helvetica-Bold,16'
set output 'bandstr.ps'
set key off
set xrange [0:4.5]
ymin=-0.5; ymax=18.0; y0=0.4
set yrange [ymin:ymax]
set style arrow 1 lt 0 lw 1 lc rgb 'black' nohead
set arrow from 0,7.1854 to 4.4873,7.1854 as 1

set arrow from 0.5,ymin to 0.5,ymax nohead lw 1 lt -1 front
set arrow from 1.0,ymin to 1.0,ymax nohead lw 1 lt -1 front
set arrow from 1.7071,ymin to 1.7071,ymax nohead lw 1 lt -1 front
set arrow from 2.5731,ymin to 2.5731,ymax nohead lw 1 lt -1 front
set arrow from 3.2802,ymin to 3.2802,ymax nohead lw 1 lt -1 front
set arrow from 3.9873,ymin to 3.9873,ymax nohead lw 1 lt -1 front

set xzeroaxis lw 2 lt -1
set border lw 2
unset xtics
set mytics 5
set size 1,1
set ylabel 'Energy (eV)'
set label '{/Symbol G}' at 0.0, ymin-y0      # Gamma
set label 'X' at 0.5, ymin-y0                # X (0+0.5)
set label 'M' at 1.0, ymin-y0                # M (0.5+0.5)
set label '{/Symbol G}' at 1.7071, ymin-y0   # Gamma (1.0+0.7071)
set label 'R' at 2.5731, ymin-y0             # R (1.7071+0.8660)
set label 'X' at 3.2802, ymin-y0             # X (2.5731+0.7071)
#set label 'R' at 3.2802+0.1, ymin-y0         # R (3.2802)
set label 'R' at 3.9873, ymin-y0             # R (3.2802+0.7071)
set label 'M' at 4.4873, ymin-y0             # M (3.9873+0.5)

plot 'bands.dat.gnu' u 1:2 w l noti lc rgb 'red'
set output
! ps2pdf 'bandstr.ps'
! rm bandstr.ps







