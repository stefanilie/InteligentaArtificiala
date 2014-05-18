/*total 9 clauze: cele genera;e si cele in care mai lipseste un termen*/

/*
Cele mai importante aspecte ale acestui exercitiu sunt definirea operatorilor(1/2 din punctaj) si scrierea clauzei 
celei mai complete (cand ambele structuri de adunat sunt si cu saptamani si cu zile) care reprezinta 1/4 din punctaj. 
Apoi definirea a cat mai multor clauze pentru cazurile particulare (doar saptamani adunate cu stuctura completa, doar zile adunate cu structura completa etc.) 
care sa se defineasca prin intermediul clauzei generale (acestea vor fi punctate cu (1/4)/nr_total_clauze_secundare din punctajul alocat exercitiului).

Z este 1 saptamani si 2 zile + 3 saptamani si 6 zile.
Z = 5 saptamani si 1 zile ? 
*/
:- op(600,xfy,este).
:- op(80,xfx,si).
:- op(70,xf, sapt).
:- op(70,xf, zile).

/*Acest predicat va primi X si Y de dupa ce se vor aduna, el va reduce numarul de subunitati si il va creste pe cel de unitati,
prin impartirea numarului de subunitati la limita sa, in cazul acesta 7, si catul se va aduna la numarul de unitati.*/
Z este X1 sapt si Y1 zile:- Y1>=7, !, C is Y1//7, C1 is Y1 mod 7, X is X1 + C, Z=X sapt si C1 zile; (X1 == 0, Z=Y1 zile);
							(Y1==0, Z=X1 sapt);	Z=X1 sapt si Y1 zile.

/*Acesta este predicatul general. Pe baza lui vom genera cazurile particulare.*/
Z este X1 sapt si Y1 zile + X2 sapt si Y2 zile:- A1 is X1+X2, A2 is Y1+Y2, Z este A1 sapt si A2 zile.

/*
 Cazurile particulare:
X1 Y1 + X2 Y2
 0  1    1  1  X
 1  0    1  1  X
 1  1    0  1  X
 1  1    1  0  X

 1  0    1  0  X
 0  1    0  1  X
 1  0    0  1  X
 0  1    1  0  X
 */



Z este Y1 zile + X2 sapt si Y2 zile:- Z este 0 sapt si Y1 zile + X2 sapt si Y2 zile.
Z este X1 sapt + X2 sapt si Y2 zile:- Z este X1 sapt si 0 zile + X2 sapt si Y2 zile.
Z este X1 sapt si Y1 zile + Y2 zile:- Z este X1 sapt si Y1 zile + 0 sapt si Y2 zile.
Z este X1 sapt si Y1 zile + X2 sapt:- Z este X1 sapt si Y1 zile + X2 sapt si 0 zile.
Z este X1 sapt + X2 sapt:- Z este X1 sapt si 0 zile + X2 sapt si 0 zile.
Z este Y1 zile + Y2 zile:- Z este 0 sapt si Y1 zile + 0 sapt si Y2 zile.
Z este X1 sapt si Y1 zile + X2 sapt si Y2 zile:- Z este X1 sapt si Y1 zile + X2 sapt si Y2 zile.
Z este X1 sapt + Y2 zile:- Z este X1 sapt si 0 zile + 0 sapt si Y2 zile.
Z este Y1 zile + X2 sapt:- Z este 0 sapt si Y1 zile + X2 sapt si Y2 zile.

/*Listing:

| ?- Z este 5 zile + 11 zile.
Z = 2 sapt si 2 zile ? 
yes


| ?- Z este 2 zile + 2 zile.                                         
Z = 4 zile ?                       
yes
*/