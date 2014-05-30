%lista_prieteni(nume, ocupat, lista_efectiva_prieteni).
:-dynamic lista_prieteni/3.
:-dynamic initiale/2.
:-dynamic nr_msg/2.
:-dynamic gasit/1.


close_all:-current_stream(_,_,S), close(S), fail; true.

citeste_fisier(F):- close_all, retractall(lista_prieteni(_,_,_)),
					open(F, read, Stream),
					repeat, 
						citeste_rand(Stream), 
					!, close(Stream).

citeste_rand(Stream):-read(Stream, Nume), assert(nr_msg(Nume, 0)), read(Stream, Ocup), assert(lista_prieteni(Name, Ocup, [])),
						repeat,
							read(Stream, X),
							(X==0 -> !, fail;
								(X==end_of_file -> !;
								once(retract(lista_prieteni(Nume,Ocup,L))),
								assert(lista_prieteni(Nume, Ocup, [X|L])),
								fail)).




scop(Nume):- initiale(F, N), atom_chars(Nume, LNume), LNume=[P|RestNume], initiala2(N, RestNume).

initiala2(N, [' ',N|_]).
initiala2(N, [_|Restnume]):- initiala2(N, Restnume).


%succesor: suc(Nume, Nume1)
suc(Nume, Nume1):- lista_prieteni(Nume, _, L), member(Nume1, L).

rezolva_b(Start, Sol):- breathfirst([[Start]], Sol).

breathfirst([[Nod|Drum]|Restdrumuri],[Nod|Drum]):-scop(Nod).
breathfirst([Drum|Restdrumuri], Sol):- extinde(Drum, DrumuriExtinse);  % asa arata DrumuriExtinse:   [[], [], []]
									   append(Restdrumuri, DrumuriExtinse, NouaCoada),
									   breathfirst(NouaCoada, Sol).

extinde([Om|Drum], DrumuriExtinse):- (poate_trimite_mesaj(Om) -> bagof([OmUrmator, Om|Drum], (suc(Om, OmUrmator),
										\+member(OmUrmator, Drum), once(retract(nr_msg(OmUrmator, NrM))), NrM1 is NrM+1, assert(nr_msg(OmUrmator, NrM1))), DrumuriExtinse);
										DrumuriExtinse=[[Om|Drum]]
										).
extinde(_,[]).
poate_trimite_mesaj(Om):- lista_prieteni(Om, Ocup, _),
						  (Ocup==liber;
						  	Ocup==ocupat, nr_msg(Om, NrM), NrM>=2;
						  	Ocup==foarte_ocupat, nr_msg(Om, NrM), NrM>=3).

calculeaza_sol(Cautator):- rezolva_b(Cautator, Sol), Sol=[Gasit|_],
						   \+gasit(Gasit), assert(gasit(Gasit)), afis(Sol), nl, 
						   fail; true.

afis([Nume]):- write(Nume).
afis([Nume|RestNume]):-afis(RestNume), write('->'), write(Nume).

curata:- retractall(gasit(_)), retractall(nr_msg(_,_)), retractall(initiale(_,_)).

pred_principal(Fis, P, N, Cautator):- curata, citeste_fisier(Fis), assert(initiale(P,N)), calculeaza_sol(Cautator).