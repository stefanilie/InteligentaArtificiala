% Author: Ilie Stefan Ionut, Oana Stamate, Andrei Constantinescu
% Date: 30.05.2014

% Adaugam la baza de cunostiinte celulele din labirint.
succ(a,b).
succ(b,c).
succ(b,i).
succ(c,d).
succ(d,e).
succ(d,g).
succ(e,f).
succ(e,h).
succ(g,h).

% Definim scopul.
scop(i).
scop(f).

%concat(+Lista1,+Lista2,-Listarez)
concat([], L, L).
concat([H|T], L, [H|T1]):- concat(T,L,T1).


%membru(+Element,+Lista)
% Predicat care verifica pur si simplu daca elementul X este membru al listei
membru(H,[H|_]).
membru(X,[_|T]):- membru(X,T).

%extinde(+StareDrum,-ListaDrumuriDerivate)
% Predicatul va avea ca parametru lista cu drumul initial si va returna lista cu drumurile posibile.
extinde([Nod|Drum],DrumuriNoi):- write('Se extinde drumul '), write([Nod|Drum]), write('\n'),
				bagof([NodNou,Nod|Drum], (succ(Nod,NodNou), \+(membru(NodNou,[Nod|Drum]))),
				DrumuriNoi),
				!.
extinde(_,[]).


% BF(+Listadrumuri,-DrumSolutie)
% Acesta este predicatul care va efectua BFul propiu zis.
% Acesta mai exact este pasul de oprire, cazul in care head-ul listei, ultimul element 
% adaugat este destinatia. 
BF([[Nod|Drum]|_], [Nod|Drum]):- scop(Nod).

% Acesta este predicatul care va face parcurgerea recursiva. 
% Mai intai va afisa coada actuala, va apela predicatul extinde cu drumurile noi posibile,
% va afisa coada cu adaugirile de rigoare, si va apela recursiv cu noua lista de drum, in cauza, Drumuri1
BF([Drum|Drumuri], Sol) :- 
				write('Coada actuala: '), write([Drum|Drumuri]), write('\n'),
				extinde(Drum, DrumuriNoi),
				write('Se adauga in coada: '), ((DrumuriNoi==[]) -> write('nimic'); write(DrumuriNoi)), write('\n'),
				concat(Drumuri, DrumuriNoi, Drumuri1),
				BF(Drumuri1, Sol).



% rezolva_b(+Start,- Sol)
% Predicatul principal. Acesta va apela functia de BF prin 
rezolva_b(Start, Sol):- BF([[Start]],Sol).






/*
| ?- rezolva_b(a, Sol).
Coada actuala: [[a]]
Se extinde drumul [a]
Se adauga in coada: [[b,a]]
Coada actuala: [[b,a]]
Se extinde drumul [b,a]
Se adauga in coada: [[c,b,a],[i,b,a]]
Coada actuala: [[c,b,a],[i,b,a]]
Se extinde drumul [c,b,a]
Se adauga in coada: [[d,c,b,a]]
Sol = [i,b,a] ? ;
Coada actuala: [[i,b,a],[d,c,b,a]]
Se extinde drumul [i,b,a]
Se adauga in coada: nimic
Coada actuala: [[d,c,b,a]]
Se extinde drumul [d,c,b,a]
Se adauga in coada: [[e,d,c,b,a],[g,d,c,b,a]]
Coada actuala: [[e,d,c,b,a],[g,d,c,b,a]]
Se extinde drumul [e,d,c,b,a]
Se adauga in coada: [[f,e,d,c,b,a],[h,e,d,c,b,a]]
Coada actuala: [[g,d,c,b,a],[f,e,d,c,b,a],[h,e,d,c,b,a]]
Se extinde drumul [g,d,c,b,a]
Se adauga in coada: [[h,g,d,c,b,a]]
Sol = [f,e,d,c,b,a] ? ;
Coada actuala: [[f,e,d,c,b,a],[h,e,d,c,b,a],[h,g,d,c,b,a]]
Se extinde drumul [f,e,d,c,b,a]
Se adauga in coada: nimic
Coada actuala: [[h,e,d,c,b,a],[h,g,d,c,b,a]]
Se extinde drumul [h,e,d,c,b,a]
Se adauga in coada: nimic
Coada actuala: [[h,g,d,c,b,a]]
Se extinde drumul [h,g,d,c,b,a]
Se adauga in coada: nimic
no
*/