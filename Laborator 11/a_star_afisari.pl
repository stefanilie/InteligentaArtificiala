% Ilie Stefan Ionut 242 impreuna cu Stamate Oana, cu ajutorul lui Truta Marian
% Data: 31.05.2014

succ(a,b,7).
succ(a,c,4).
succ(a,d,5).
succ(b,f,6).
succ(b,g,3).
succ(c,b,2).
succ(c,e,8).
succ(c,f,5).
succ(d,h,11).
succ(d,e,5).
succ(e,h,6).
succ(e,f,4).
succ(f,h,10).
succ(g,i,2).
succ(g,j,3).

h(b,9).
h(c,10).
h(d,11).
h(e,6).
h(f,10).
h(g,6).
h(h,0).
h(i,4).
h(j,3).

scop(h).

%bestfirst(+Nod_initial,-Solutie)
bestfirst(Nod_initial,Solutie):-
expandeaza([],l(Nod_initial,0/0),9999999,_,
da,Solutie).

%expandeaza(+Drum,+Arbore,+Limita,-A1,-Rezultat,-Solutie),

expandeaza(Drum,l(N,_),_,_, da,[N|Drum]):-scop(N).

expandeaza(Drum,l(N,F/G),Limita,Arb1,Rez,Sol):-
write('Se expandeaza frunza: '),nl,write(N),write(' ('),write(F),write('/'),write(G),write(')'),nl,get_char(_),
F=<Limita,
(bagof(M/C,(succ(N,M,C), \+ (membru(M,Drum))),Succ),!,
listasucc(G,Succ,As),
cea_mai_buna_f(As,F1),
write('Se expandeaza subarborele:'),nl,write(N),write(' ('),write(F1/G),write(')'),nl,
scriere(As),get_char(_),
expandeaza(Drum,t(N,F1/G,As),Limita,Arb1, Rez,Sol);
Rez=imposibil).

expandeaza(Drum,t(N,F/G,[A|As]),Limita,Arb1,Rez,
Sol):-
F=<Limita,
cea_mai_buna_f(As,BF),
min(Limita,BF,Limita1),
expandeaza([N|Drum],A,Limita1,A1,Rez1,Sol),
continua(Drum,t(N,F/G,[A1|As]),Limita,Arb1,
Rez1,Rez,Sol).

expandeaza(_,t(_,_,[]),_,_,imposibil,_):-!.


expandeaza(_,Arb,Limita,Arb,nu,_):-
f(Arb,F),
F>Limita.


%continua(+Drum,+Arb,+Limita,-Arb1,-Rez1,-Rez,-Sol)

continua(_,_,_,_,da,da,_).

continua(P,t(N,_/G,[A1|As]),Limita,Arb1,nu,Rez,Sol):-
insereaza(A1,As,NAs),
cea_mai_buna_f(NAs,F1),
expandeaza(P,t(N,F1/G,NAs),Limita,Arb1,Rez,Sol).

continua(P,t(N,_/G,[_|As]),Limita,Arb1,imposibil,Rez,
Sol):-cea_mai_buna_f(As,F1),
expandeaza(P,t(N,F1/G,As),Limita,Arb1,Rez,Sol).


%listasucc(+G,+Succesori,-Arbore)
listasucc(_,[],[]).

listasucc(G0,[N/C|NCs],Ts):-
G is G0+C,
h(N,H),
F is G+H,
listasucc(G0,NCs,Ts1),
insereaza(l(N,F/G),Ts1,Ts).


%insereaza(+Arb,+ListArb, -ListArbrez)
insereaza(A,As,[A|As]):-
f(A,F),
cea_mai_buna_f(As,F1),
F=<F1,!.

insereaza(A,[A1|As],[A1|As1]):-insereaza(A,As,As1).

%min(+X,+Y,-M)
min(X,Y,X):-X=<Y,!.
min(_,Y,Y).

%f(+Arb, -F)
f(l(_,F/_),F). 
f(t(_,F/_,_),F). 

%cea_mai_buna_f(+Lista,-F)
cea_mai_buna_f([A|_],F):-f(A,F).
cea_mai_buna_f([],999999).

%scriere(+List)

scriere([]).
scriere([H|T]):-H=..[_,Nod,V1],write('|-'),write(Nod),write('('),write(V1),write(')'),nl,scriere(T).

%membru(+Element,+Lista)
membru(H,[H|_]).
membru(X,[_|T]):-membru(X,T).
