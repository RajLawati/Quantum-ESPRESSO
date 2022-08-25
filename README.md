This is a general idea for the Quantum ESPRESSO beginners. 

# Packages requirement
1. Quantum-ESPRESSO
2. VESTA
3. xcrysden
4. gnuplot/xmgrace

# Explore materials
1. At first visit materialsproject.org 
2. Search for element, molecule, material, etc.
3. Download CIF file.
4. Open CIF file with VESTA.

# Create input file
1. Visit materialscloud.org/work/tools/qeinputgenerator
2. Upload your CIF file and select file format to CIF. 
3. Customize the appear setting as you need.
4. Then, Generate the PWscf input file.
5. Copy the text and create input file.

# PseudoPotential (PP)
1. Visit quantum-espresso.org/pseudopotentials
2. Search PP file for the atom/element of your material.
3. Download pseudopotential file as you need.
4. Extract > create folder-pseudo > include the pseudo file name (.UPF) in the input file. 

# Shellscript(.sh) file
1. Used for optimization of kinetic energy cut-off, k-points and lattice parameter.
2. Start loop and use the formula and range for the data to be optimised.
3. Export data. Plot the graph.
4. Save the .sh file. 
5. Make executable with: chmod a+x filename.sh
6. Run the file with: ./filename.sh

# General guidlines
1. First optimise the structure with kinetic energy cut-off (ecut).
2. Use optimised ecut and again optimise for kpoints.
3. Use both optimised ecut and kpoints and again optimise for lattice parameter.
4. Then, using all three optimised parameters run the relax calculation. 


