#!/bin/bash

# This written bash script is used to optimize the Kinetic 
# energy cutoff of cubic Mg scanning from 
# 20 - 80 Ry with increment of 5 Ry.


rm -rf etot.dat 
for i in {0..12}
  do
    ecut=`echo "20+$i*5" | bc -l`
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
  celldm(1) = 6.02            !use alat unit 
  occupations = 'smearing'
  smearing = 'cold'
  degauss = 1.4699723600d-02
  ecutwfc = $ecut
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
8 8 8 0 0 0


EOF
mpirun -np 4 pw.x -nk 1 -npw 4 -i scf.in > scf.out
te=`grep ! scf.out | tail -1 | awk '{print $5}'`
echo "$ecut $te" >> etot.dat
mv scf.out scf$i.out
done

gnuplot -persist <<-EOFMarker
set terminal postscript enhanced color font 'Helvetica-Bold,16'
set output 'ecut.ps'
set title 'Convergence test of Kinetic energy cutoff'
set xl 'Kinetic energy cutoff (Ry)'
set yl 'Total energy (Ry)'
set grid
set key top center
set style line 1 lt 1 lw 2 pt 6 ps 2 lc rgb 'red'
plot 'etot.dat' w lp noti ls 1
set output
! ps2pdf 'ecut.ps'
! rm ecut.ps
EOFMarker






