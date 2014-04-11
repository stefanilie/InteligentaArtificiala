%Ilie Stefan Ionut grupa 242
%19.03.2014

init(A) :- nonvar(A) .
notInit(B) :- var(B) .

ambele(A, B) :- init(A), init(B) .
unaA(A, B) :- init(A), notInit(B) .
unaB(A, B) :- init(B), notInit(A) .
nema(A, B) :- notInit(A), notInit(B) .

ec(A, B) :- ambele(A, B), -A+B =:= -2 .
ec(A, B) :- unaA(A, B), B is -2+A .
ec(A, B) :- unaB(A, B), A is 2+B .
ec(A, B) :- nema(A, B), A = 4, B = -2 .

/*
	Instructiunea este impartita pe 3 "verificari" sau cazuri.

	Prima, daca A sau B este instantiate, rezolvam ecuatia. 

	A doua, daca ambele sunt instantiate, se verifica daca egalitatea este valida.
	
   A treia, daca niciuna din ele nu este instantiata, caz in care rezultatul este "hardcodat".

   Avem deci 3 seturi de predicate. Primul care ma ajuta sa verific daca valorile sunt initializate, 
   al doilea facut pe baza primelor predicate, care imi permite sa verific in care caz ma incadrez: 
   cel in care stiu ambele valori si verific egalitatea, cel in care stiu doar una si rezolv ecuatia,
   si nu in ultimul rand, cel in care nu stiu nici o valoare, caz in care rezultatul este prestabilit.



   Listing:
   | ?- consult('ex_ec_ab.pl').
   compiling /home/stefan/Documents/AIISem2/git/InteligentaArtificiala/Laborator 1/ex_ec_ab.pl for byte code...
   /home/stefan/Documents/AIISem2/git/InteligentaArtificiala/Laborator 1/ex_ec_ab.pl compiled, 38 lines read - 2797 bytes written, 16 ms

   yes
   | ?- ec(4, B).              

   B = 2 ? 

   yes
   | ?- ec(4, 2).              

   yes
   | ?- ec(4, -2).             

   no
   | ?- ec(A, B) .             

   A = 4
   B = -2

   yes

*/