% Author: Ilie Stefan Ionut 242 impreuna cu Oana Stamate
% Date: 31.05.2014
/*
Modificati programul pentru depthfirst iterativ astfel incat sa afiseze la fiecare pas nodul extins si drumul imediat rezultat, 
de asemenea pentru fiecare drum testat sa se afiseze ca e testat ca drum solutie si in caz ca Da sa se afiseze 
Da(apoi urmand si randul scris de prolog cu solutia oferita), altfel sa se afiseze Nu.

Modificati de asemenea programul, astfel incat sa ofere toate solutiile fara a se bloca.
*/
s(a,b).
s(c,b).
s(a,c).

scop(b).


%membru(+Element,+Lista)
membru(H,[H|_]).
membru(X,[_|T]):-membru(X,T).

%cale(+Nod,-NodScop,-Solutie).
cale(Nod,Nod,[Nod],_).%:-write(Nod),nl.%,get_char(_).
cale(NodInitial,NodUltim, [NodUltim|Drum],D):-
	D=<1,
	D1 is D+1,
	cale(NodInitial,NodPenultim, Drum,D1),	
	s(NodPenultim,NodUltim),
	\+ membru(NodUltim,Drum),
	write('extinde nod: '),write(NodInitial),nl,
	write([NodUltim|Drum]),nl.%, get_char(_).

%depthfirst_iterative_deepening(+NodStart, -Solutie)
depthfirst_iterative_deepening(NodStart, Sol):-cale(NodStart,NodScop,Sol,0),write('testeaza solutie: '),write(Sol),((scop(NodScop),write('-Da'),nl);(write('-Nu'),nl,fail)).


%Exemplu de interogare
/*
?- depthfirst_iterative_deepening(a, Sol).
testeaza solutie: [a]-Nu
extinde nod: a
[b,a]
testeaza solutie: [b,a]-Da
Sol = [b, a] ;
-Nu
extinde nod: a
[c,a]
testeaza solutie: [c,a]-Nu
extinde nod: a
[b,a]
extinde nod: a
[c,a]
extinde nod: a
[b,c,a]
testeaza solutie: [b,c,a]-Da
Sol = [b, c, a] ;
-Nu
false.
*/



