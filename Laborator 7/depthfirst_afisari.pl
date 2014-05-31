% Author: Ilie Stefan Ionut impreuna cu Oana Stamate
% Date: 31.05.2014
% Baza de cunostiinte.
succ(a,b).
succ(b,c).
succ(b,i).
succ(c,d).
succ(d,e).
succ(d,g).
succ(e,f).
succ(e,h).
succ(g,h).

% Valorile terminale, destinatiile.
scop(i).
scop(f).

%membru(+Element,+Lista)
% Predicat care verifica recursiv daca X apartine listei.
membru(H,[H|_]).
membru(X,[_|T]):-membru(X,T).

%rezolva1_d(+Nod,-DrumSolutie)
rezolva1_d(N,Sol):-depthfirst([],N,Sol).

%depthfirst(+Drum,+Nod, -Solutie)
depthfirst(Drum, Nod, [Nod|Drum]):-scop(Nod), write('Stiva actuala care e si solutie: '),write([Nod|Drum]),nl.
depthfirst(Drum, Nod, Sol):-
			write('Stiva actuala: '),write([Nod|Drum]),nl, 
			(succ(Nod,Nod1),
			\+ (membru(Nod1,Drum)),
			write('adauga nodul: '),write(Nod1),nl,nl,
			depthfirst([Nod|Drum],Nod1, Sol));
			(write('<-Se intoarce'),nl,fail).


/*
Listing:
| ?- rezolva1_d(a, Sol).
Stiva actuala: [a]
adauga nodul: b

Stiva actuala: [b,a]
adauga nodul: c

Stiva actuala: [c,b,a]
adauga nodul: d

Stiva actuala: [d,c,b,a]
adauga nodul: e

Stiva actuala: [e,d,c,b,a]
adauga nodul: f

Stiva actuala care e si solutie: [f,e,d,c,b,a]
Sol = [f,e,d,c,b,a] ? ;
Stiva actuala: [f,e,d,c,b,a]
<-Se intoarce
adauga nodul: h

Stiva actuala: [h,e,d,c,b,a]
<-Se intoarce
<-Se intoarce
adauga nodul: g

Stiva actuala: [g,d,c,b,a]
adauga nodul: h

Stiva actuala: [h,g,d,c,b,a]
<-Se intoarce
<-Se intoarce
<-Se intoarce
<-Se intoarce
adauga nodul: i

Stiva actuala care e si solutie: [i,b,a]
Sol = [i,b,a] ? ;
Stiva actuala: [i,b,a]
<-Se intoarce
<-Se intoarce
<-Se intoarce
no
*/