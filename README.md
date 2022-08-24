This is a general idea for the Quantum ESPRESSO beginners. 

# Packages requirement
1. Quantum-ESPRESSO
2. xcrysden
3. gnuplot

# General guidlines
1. First optimise the structure with kinetic energy cut-off (ecut).
2. Use optimised ecut and again optimise for kpoints.
3. Use both optimised ecut and kpoints and again optimise for lattice parameter.
4. Then, using all three optimised parameters run the relax calculation. 


