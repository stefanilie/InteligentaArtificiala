%Ilie Stefan Ionut grupa 242
%19.03.2014

/*ec1(A,B) :- (nonvar(A), nonvar(B), -A+B=2) .*/
/*ec1(A,B) :- (nonvar(A), nonvar(B), -A+B =:= 2) .*/

ec1(A,B):-(var(A), X=A, Semn is -1, A1=0; \+var(A), A1=A),
          (var(B),(var(Semn),X=B,Semn is 1,B1=0;\+var(Semn),B1=1,B=B1);
	   	  \+var(B),B1=B),
          (var(Semn), -A+B=:=2; \+var(Semn), X is (2-B1+A1)*Semn).

/*
	Instructiunea este impartita pe 3 "verificari" sau cazuri.

	Prima, verifica mai intai daca A este variabila neinstantiata (var(A)), o unifica cu variabila X, 
	stabileste valoarea variabile Semn la -1, initializam o variabila A1 cu 0, verificam daca A
	a fost instantiata, si unificam pe A1 cu A.

	A doua, verifica daca B si Semn sunt neinstantiate, il uneste pe X cu B si initializeaza pe B1 cu 0.
	Apoi verifica din nou daca Semn este instantiat, il atribuie lui B1 valoare 1 si unifica pe B cu B1. 
	Nu in ultimul rand, verifica daca B este instantiat, si il unifica pe B1 cu B.

	A treia, verifica daca Semn este neinstantiata, verifica daca -A+B = 2, verifica daca Semn a fost
	instantiat x.
	




	Predicatul ec1(A,B):
   -> var(B)    : verifica daca A este variabila neinstantiata
   -> X=A       : variabila X este unificata cu vaiabila A
   -> Semn is-1 : semnul lui A devine -1 [ -A + B = 2, semnul lui A este negativ ]
   -> A1=0      : cream o variabila A1 pe care o egalam cu 0
   -> \+var(A)  : verifica daca variabila A a fost instantiata
   -> A1=A      : A1 preia aceasta valoare [ 0 - daca a variabila nu a fost instantiata sau A, daca a fost insantiata ]
   
   -> var(B)    : verifica daca B este variabila neinstantiata
   -> var(Semn) : verifica daca Semn este variabila neinstantiata [ In acest caz A a fost instantiat ]
   -> X=B       : variabila X este unificata cu variabila B
   -> Semn is 1 : semnul lui B  devine 1 [ -A + B = 2, semnul lui B este pozitiv ]
   -> B1=0      : cream o variabila B1 pe care o egalam cu 0
   ->\+var(Semn): verifica daca variabila Semn a fost instantiata [ In acest caz A nu a fost instantiat ]
   -> B1=1      : variabila B1 este egaalata cu 1 
   -> B=B1      : variabila B este unificata cu variabila B1
   -> \+var(B)  : verifica daca variabila B a fost instantiata
   -> B1=B      : B1 preia aceasta valoare [ In vazul in care B a fost deja instantiat ]
   
   -> var(Semn) : verifica daca Semn este variabila neinstantiata [ In avest caz A si B au fost instantiate ]
   -> -A+B=:=2  : verifica daca egalitatea aritmetica -A + B = 2 este adevarata
   ->\+var(Semn): verifica daca variabila Semn a fost instantiata [ In acest caz A si B nu a fost instantiate ]
   ->X is (2-B1+A1)*Semn : variabila X este instantiata (2 - B + A ) * Semn, folosing variabilele auxiliare A1 si B1
*/