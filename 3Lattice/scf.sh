#!/bin/bash

# This written bash script is used to optimize the lattice 
# parameter of cubic Mg scanning from 
# 6.00 - 6.50 a.u with increment of 0.05 a.u. 


rm -rf etot.dat 
for i in {0..7}
  do
    lp=`echo "6.00+$i*0.05" | bc -l`
    vol=`echo "$lp*$lp*$lp" | bc -l`
cat << EOF > scf.in

&CONTROL
  calculation = 'scf'
  prefix = 'pwscf'
  pseudo_dir = './pseudo/'
  outdir = './out/'
  tprnfor = .true.
  tstress = .true.
  verbosity = 'high'
  etot_conv_thr = 1.0000000000d-05
  forc_conv_thr = 1.0000000000d-04
/
&SYSTEM
  ibrav = 1
  nat = 1
  nosym = .false.
  ntyp = 1
  celldm(1) = $lp 
  occupations = 'smearing'
  smearing = 'cold'
  degauss = 1.4699723600d-02
  ecutwfc = 60           !use optimised ecut here
  ecutrho = 480
/
&ELECTRONS
  diagonalization = 'cg'
  mixing_mode = 'plain'
  conv_thr = 2.0000000000d-10
  electron_maxstep = 80
  mixing_beta = 4.0000000000d-01
/
ATOMIC_SPECIES
Mg     24.305 Mg.pbe-spn-rrkjus_psl.1.0.0.UPF
ATOMIC_POSITIONS crystal
Mg           0.0000000000       0.0000000000       0.0000000000 
K_POINTS automatic
12 12 12 0 0 0              !use optimised kp here

EOF
mpirun -np 4 pw.x -nk 1 -npw 4 -i scf.in > scf.out
te=`grep ! scf.out | tail -1 | awk '{print $5}'`
echo "$lp $te" >> etot.dat
echo "$vol $te" >> volume.dat
mv scf.out scf$i.out
done

gnuplot -persist <<-EOFMarker
set terminal postscript enhanced color font 'Helvetica-Bold,16'
set output 'lp.ps'
set title 'Convergence test of Lattice Parameter'
set xl 'Lattice Parameter (alat)'
set yl 'Total energy (Ry)'
set grid
set key top center
set style line 1 lt 1 lw 2 pt 6 ps 2 lc rgb 'red'
plot 'etot.dat' w lp noti ls 1
set output
! ps2pdf 'lp.ps'
! rm lp.ps
EOFMarker






