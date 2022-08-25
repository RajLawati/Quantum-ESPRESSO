# for relax calculation run:
mpirun -np 4 pw.x -nk 1 -npw 4 -i relax.in |tee relax.out
 
# after the calculation is done
open the relax.out file
copy the text which is in between begin co-ordinate and end co-ordinate
  for example:	
	begin co-ordinate
	ATOMIC_POSITIONS (crystal)
	Mg            0.0000000000        0.0000000000        0.0000000000
	end co-ordinate
paste the text in the input of scf file. 
