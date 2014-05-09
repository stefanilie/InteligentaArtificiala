
%dans(nume_dans, lista_perechi)
%lista perechi: [ [nume_baiat, nume_fata], .....]
dans(tango,[[ion, andreea],[marin, ana],[doru, elena]]).
dans(vals,[[mihai, elena],[ion, oana],[daniel, carmen], [doru, andreea], [marin, ana]]).
dans(quickstep, [[ion, andreea],[marin,carmen]]).
dans(jive,[[marin, ana], [doru, elena],[daniel, oana],[ion, andreea]]).
dans(pasodoble,[[marin, elena]]).
dans(vals_vienez,[[daniel, carmen],[doru,oana]]).

/*a*/
afis:-dans(D,_), write(D), nl, fail; true.

/*b*/
dans_nr_perechi(NrP, D) :- dans(D, L), lung(L, NrP). /*unde lung predicat care calc numarul de perechi*/
/*unde lst va primi rezultatul de la setof*/
pred_B(LDans):-setof(st(NrP, D), dans_nr_perechi(NrP, D), Lst), calculeaza_l(Lst, LDans).
calculeaza_l([st(_,Dans)|Tst], [Dans|T]):-calculeaza_l(Tst, T).
calculeaza_l([],[]).

/*c*//*va returna pe rand in A, B cate o pereche*/
dansatori_nr_dans(Dansator, NrDans):-dans(_,Lper), membru([A, B], Lper),
							(X=A; X=B), (reatract(pers(X, Nr))->Nr1 is Nr+1, assert(pers, Nr1)); assert(pers(X, 0)), fail; 
									retract(pers(Dansator, NrDans)).

ultim([E], E):- !.
ultim([_|T], E):-ultim(T,E).

pred_C(Nume):-setof(st(NrD, Dansator), dans_nr_dans(Dansator, NrD), Lst), ultim(L, Elem), Elem=st(_, Nume). 