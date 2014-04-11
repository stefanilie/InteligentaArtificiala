pereche_p-c returneaza pe rand toate perechiile pokemon copil

pereche_p-c(P,C):-copil(C, LP), member(P, LP).

pokemon_listcp(-Poke, lCopii):-setof(NumeCopil, pereche_p-c(Poke, numeCopil), LCopii)