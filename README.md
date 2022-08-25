This is a general idea for the Quantum ESPRESSO beginners. 

# Packages requirement
1. Quantum-ESPRESSO
2. VESTA
3. xcrysden
4. gnuplot/xmgrace

# Explore materials
1. At first visit: materialsproject.org 
2. Search for element, molecule, material, etc. you want to study.
3. Download its CIF file.
4. Open CIF file with VESTA for visualization.

# Create input file
1. Visit: materialscloud.org/work/tools/qeinputgenerator
2. Upload your CIF file and select file format to CIF. 
3. Customize the appear setting as you need.
4. Then, Generate the PWscf input file.
5. Copy the text and create input file.
6. You can also customize the input file as you need.

# PseudoPotential (PP)
1. Visit: quantum-espresso.org/pseudopotentials
2. Search PP file for the atom/element of your material.
3. Download PP file as you need.
4. Create folder-pseudo > Extract PP here > include the pseudo (filename.UPF) in the input file. 

# Shellscript (.sh) file [optional]
1. Used for optimization of kinetic energy cut-off, k-points and lattice parameter.
2. Start loop and use the formula and range for the data to be optimised.
3. Paste the PWscf input file here.
4. Write codes to export data. Plot the graph.
5. Save the .sh file. 
6. Make executable with: chmod a+x filename.sh
7. Run the file with: ./filename.sh

# General guidlines for optimisation
1. First optimise the structure with kinetic energy cut-off (ecut).
2. Use optimised ecut and again optimise for kpoints.
3. Use both optimised ecut and kpoints and again optimise for lattice parameter.
4. Then, using all three optimised parameters run the relax calculation.
5. After that follow the ReadME.md file.  

# Useful links
quantum-espresso.org/tutorials/
quantum-espresso.org/documentation/input-data-description/

