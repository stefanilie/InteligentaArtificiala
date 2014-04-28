%Author: Ilie Stefan Ionut
%Data: 28.04.2014



suma(0, 0).
suma(N, S):- N >= 0, N1 is N-1,  suma(N1,S1), S is S1+N, true.


/* Aici am probleme, nu reusesc sa dau de capat recursivitatii....
C is 0.
sumaInvers(N, S) :- N1 is sumaAux(C, N), 
sumaAux(C, S) :- C =< S, C is C + 1,  sumaAux(C, S).
*/


sumaFormula(N, S) :- N1 is N+1, D is N1*N, S is D/2.



/*
suma(2, X) n1=1, S = s1+2; suma(1, s1)
							n1=0, s = s1+1, suma(0, s1) //il va unifica pe s1 cu 0
									s = 0+1 = 1
				 S = 1 + 2 = 3;

Care sunt specificatiile predicatului suma?
Predicatul suma are 2 parametrii, N si S. Va generea suma primelor N numere, in ordine descrescatoare.
Problema este ca initial nu avea verificarea daca N este pozitiv, si putea cicla la infinit.

Scrieti predicatul sub o alta forma (tot recursiva, suma sa se calculeze de la ultimul 
element catre primul - in exemplul de mai sus se calcula de la primul element catre ultimul).

Scrieti si o a treia varianta a predicatului folosind formula de calcul a sumei numerelor naturale de la 1 la n.
*/