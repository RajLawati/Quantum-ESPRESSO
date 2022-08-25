# for relax calculation run:
mpirun -np 4 pw.x -nk 1 -npw 4 -i relax.in |tee relax.out
 
# after the calculation is done
1. open the relax.out file
2. copy the text which is in between begin co-ordinate and end co-ordinate.
For example:	
	begin co-ordinate
	ATOMIC_POSITIONS (crystal)
	Mg            0.0000000000        0.0000000000        0.0000000000
	end co-ordinate
3. paste the text in the input of scf file. 
