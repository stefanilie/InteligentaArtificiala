%Ilie Stefan Ionut 242
%20.03.2014

/*
Scrieti un predicat cu 3 parametri. 
Primul reprezinta a cata zi din luna este, al doilea reprezinta numarul lunii si al 3-lea reprezinta anul. 
Predicatul va trebui sa verifice daca o data este corecta, in caz ca da, va returna yes, 
altfel va returna no. Atentie la anii bisecti! 
*/

bisect(A) :- (A mod 400 =:= 0) ; (A mod 100 =\= 0, A mod 4 =:= 0) .
data(Z, L, A) :- L =:= 2, bisect(A), Z =< 29;
	L =:= 2, \+bisect(A), Z=<28;
	L>0, L < 13, L =\= 2, (L =< 7, L mod 2 =:= 1, Y = 31;
						   L =< 7, L mod 2 =:= 0, Y = 30;
						   L > 7, L mod 2 =:= 1, Y = 30;
						   L > 7, L mod 2 =:= 0, Y = 31),
	Z =< Y .


/*
	Listing:
	| ?- consult('data_valida.pl').
	compiling /home/stefan/Documents/AIISem2/git/InteligentaArtificiala/Laborator 1/data_valida.pl for byte code...
	/home/stefan/Documents/AIISem2/git/InteligentaArtificiala/Laborator 1/data_valida.pl compiled, 17 lines read - 4728 bytes written, 13 ms

	yes
	| ?- data(2, 4, 1992) .        

	true ? 

	yes
	| ?- data(98, 22, 1234) .      

	no


	Programul are 2 predicate. Unul care verifica daca 
	anul este bisect, iar al doilea, cel propiu zis, 
	care verifica mai intai daca anul este bisect, si in functie de 
	rezultat verifica daca luna feb are numarul coresp de zile.
	Apoi verifica pe baza lunii, numarul de zile al acesteia.

*/
