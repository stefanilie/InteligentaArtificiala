/* Autor: Ilie Stefan Ionut
 Data: 10.05.2014
*/


/* Al n-lea termen din sir*/


/*
	Predicatul va avea 2 parametrii. Numar si Out. Numar va reprezenta elementul cautat, al n-lea termen.
	Predicatul mai intai face pasul recursiv pana cand ajungem sa avem valorile cunoscute deja, termenul t0 si t1, 
	apoi in cazul in care Test deja a fost unificat cu o valuare se va intra in cea de-a doua conditie, unde 
	vor fi 2 cazuri: 1) cand Test<10 caz in care termenul n va fi egal cu 2*n-1-n-2 
					 2) cand Test>10 caz in care se va lua ultima cifra a sumei n-1+n-2. In acest caz se va folosi 
					predicatul ultimaCifra.
*/

ultimaCifra(Nr, Cfr) :- (Nr < 0)->(Cfr is -(mod(Nr, -10))); (Cfr is mod(Nr, 10)).
termen(0,0).
termen(1,3).
termen(N, Out) :- (N1 is N-1, N2 is N-2, termen(N1,Test)),
					((( abs(Test) =< 10 ), (termen(N2,Y), Out is (2*Test-Y) ));
					 (( abs(Test) > 10 ), (termen(N2,X), PreResult is (Test + X), 
					 	ultimaCifra(PreResult,Out)))).

/*
| ?- consult('C:/Users/Ilie/Documents/GitHub/InteligentaArtificiala/Laborator 2/elem_sir_.pl').
% consulting c:/users/ilie/documents/github/inteligentaartificiala/laborator 2/elem_sir_.pl...
% consulted c:/users/ilie/documents/github/inteligentaartificiala/laborator 2/elem_sir_.pl in module user, 0 msec -176 bytes
yes
| ?- termen(4, Out).
Out = 12 ? 
yes
| ?- 
*/