%Author: Ilie Stefan Ionut impreuna cu Stamate Oana
%Data: 31.05.2014

succ([Gol|Placute],[Placuta|Placute1],1):- interschimba(Gol,Placuta,Placute,Placute1) .
modul(A,B,D):- D is A-B, D>=0,!; D is B-A .
distman(X/Y,X1/Y1,D):- modul(X,X1,Dx),modul(Y,Y1,Dy), D is Dx+Dy .
interschimba(Gol,Placuta,[Placuta|Ts],[Gol|Ts]):- distman(Gol,Placuta,1) .
interschimba(Gol,Placuta,[T1|Ts],[T1|Ts1]):- interschimba(Gol, Placuta,Ts, Ts1) .
membru(H,[H|_]) .
membru(X,[_|T]):- membru(X,T) .
h([Gol|Placute],H):- scop([Gol1|Placute_final]), disttot(Placute,Placute_final,D), secv(Placute,S), H is D+3*S .
secv([Prima|Placute],S):- secv([Prima|Placute],Prima,S) .
secv([Placuta1,Placuta2|Placute],Prima,S):- scor(Placuta1,Placuta2,S1), secv([Placuta2|Placute],Prima,S2), S is S1+S2 .
secv([Ultima],Prima,S):- scor(Ultima,Prima,S) .
scor(2/2,_,1):- ! .
scor(1/3,2/3,0):- ! .
scor(2/3,3/3,0):- ! .
scor(3/3,3/2,0):- ! .
scor(3/2,3/1,0):- ! .
scor(3/1,2/1,0):- ! .
scor(2/1,1/1,0):- ! .
scor(1/1,1/2,0):- ! .
scor(1/2,1/3.0):- ! .
scor(_,_,2) .
disttot([],[],0) .
disttot([T|Ts],[S|Ss],D):- distman(T,S,D1), disttot(Ts,Ss,D2), D is D1+D2 .
scop([2/2,1/3,2/3,3/3,3/2,3/1,2/1,1/1,1/2]) . 

initial([2/1,1/2,1/3,3/3,3/2,3/1,2/2,1/1,2/3]) . 

arata_solutie([]) .
arata_solutie([P|L]):- arata_solutie(L),nl,write('-------'), arata_poz(P) .
arata_poz([S0,S1,S2,S3,S4,S5,S6,S7,S8]):- membru(Y,[3,2,1]),nl,membru(X,[1,2,3]),membru(P-X/Y,[' '-S0,1-S1,2-S2,3-S3,4-S4,5-S5,6-S6,7-S7,8-S8]), write(P),write('  '),fail; true .

puzzle:- tell('C:\\temp\\puzzle.txt'),initial(Poz),bestfirst(Poz,Sol), arata_solutie(Sol), told .

bestfirst(Nod_initial,Solutie):- expandeaza([],l(Nod_initial,0/0),9999999,_,da,Solutie) . 
expandeaza(Drum,l(N,_),_,_, da,[N|Drum]):-scop(N) . 

expandeaza(Drum,l(N,F/G),Limita,Arb1,Rez,Sol):- F=<Limita, (bagof(M/C,(succ(N,M,C), \+ (membru(M,Drum))),Succ),!, listasucc(G,Succ,As),cea_mai_buna_f(As,F1), 
expandeaza(Drum,t(N,F1/G,As),Limita,Arb1, Rez,Sol); Rez=imposibil) . 


expandeaza(Drum,t(N,F/G,[A|As]),Limita,Arb1,Rez,Sol):- F=<Limita, cea_mai_buna_f(As,BF),min(Limita,BF,Limita1), expandeaza([N|Drum],A,Limita1,A1,Rez1,Sol), 
continua(Drum,t(N,F/G,[A1|As]),Limita,Arb1,Rez1,Rez,Sol) . 


expandeaza(_,t(_,_,[]),_,_,imposibil,_):-! . 
expandeaza(_Arb,Limita,Arb,nu,_):- f(Arb,F), F>Limita .
continua(_,_,_,_,da,da,Sol) .  
continua(P,t(N,F/G,[A1|As]),Limita,Arb1,nu,Rez, Sol):- insereaza(A1,As,NAs),cea_mai_buna_f(NAs,F1),expandeaza(P,t(N,F1/G,NAs),Limita,Arb1,Rez,Sol) . 
continua(P,t(N,F/G,[_|As]),Limita,Arb1,imposibil,Rez,Sol):- cea_mai_buna_f(As,F1),expandeaza(P,t(N,F1/G,As),Limita,Arb1,Rez,Sol) . 

listasucc(_,[],[]) . 
listasucc(G0,[N/C|NCs],Ts):- G is G0+C,h(N,H),F is G+H,listasucc(G0,NCs,Ts1), insereaza(l(N,F/G),Ts1,Ts) . 

insereaza(A,As,[A|As]):- f(A,F),cea_mai_buna_f(As,F1),F=<F1,! . 
insereaza(A,[A1|As],[A1|As1]):- insereaza(A,As,As1) . 
min(X,Y,X):- X=<Y,! . 
min(_,Y,Y) . 
f(l(_,F/_),F) . 
f(t(_,F/_,_),F) . 

cea_mai_buna_f([A|_],F):- f(A,F) . 
cea_mai_buna_f([],999999) . 

% interogare: puzzle.