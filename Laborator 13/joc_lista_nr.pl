% Author: Ilie Stefan Ionut 242 impreuna cu Stamate Oana
% Data: 31.05.2014

%st(Jucator_curent,Lista_numere,Scor_jucator_curent,Scor_jucator_opus,Nivel,Max)  <-- starea curenta (nivel = cate nivele mai pot sa mai extind din arbore)

mutare_max(st(Max,_,_,_,_,Max)).
mutare_min(st(J,_,_,_,_,Max)):- J\==Max.

mutari(Poz,LPoz):- bagof(Xpoz,mutare(Poz,Xpox),Lpoz).

mutare(st(JC,Lnr,SJC,SJO,N,Max),st(Jopus,Lnr1,SJO,SJC1,N1,Max)):- N>0, N1 is N-1, jucator_opus(JC,Jopus),alege_nr(Lnr,Nr,Lnr1), SJC1 is SJC+Nr.

jucator_opus(J1,J2).
jucator_opus(J2,J1).

alege_nr([H|T],H,T).
alege_nr([_|T],E,LT):- ultim_elem(T,E,LT).
ultim_elem([E],E,[]).
ultim_elem([H|T],E,[H|LT]):- ultim_elem(T,E,LT).

staticval(st(Max,_,SJC,_,_,Max),SJC):- !.
staticval(st(_,_,_,SJO,_,_),SJO).

%minimax(+Poz, ? SuccBun, -Val)   % primeste o configuratie poz si gaseste cel mai bun succesor
minimax(Poz,SuccBun,Val):-    % calc succesorul si scorul val
mutari(Poz,ListaPoz),!, % gen succesor bf, df (toate config posibile dintr-o mutare)--- lista poz - lista tuturor succesorilor  /// "!" (if)<-- daca avem mutari // nu suntem in frunze
celmaibun(ListaPoz,SuccBun,Val);  % alegem cel mai bun succesor din lista poz (compara succesorii) si calc scorul lui
staticval(Poz,Val). % daca nu avem mutari (suntem in frunze) -- calc scorul starii finale

%celmaibun(+ListaPoz, -Succesor, -Valoare) -- ia succ si ii compara
celmaibun([Poz],Poz,Val):-  % pasul de oprire // val = scorul (calculat cu minmax)
minimax(Poz,_,Val),!.

celmaibun([Poz1|ListaPoz],PozBun,ValBuna):-  % izolam poz1
minimax(Poz1,_,Val1), % calc val lui poz1
celmaibun(ListaPoz,Poz2,Val2), % face acelasi lucru pt poz 2
maibine(Poz1,Val1,Poz2,Val2,PozBun,ValBuna). % compara poz1 si poz 2

%maibine(+Poz1,+Val1, +Poz2, +Val2, -PozRez, -ValRez )
maibine(Poz0,Val0,Poz1,Val1,Poz0,Val0):-  % compara poz1 si poz 2
mutare_min(Poz0),   % il luam pe cel mai mare dintre ele
Val0>Val1,!   % "!" intra pe celalalt caz
;
mutare_max(Poz0),   % luam minimul
Val0<Val1,!.  % "!" intra pe celalat caz
maibine(Poz0,Val0,Poz1,Val1,Poz1,Val1).

