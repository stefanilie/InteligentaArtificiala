%Ilie Stefan Ionut 242
%1.04.2014

/*
	Copiii impartiti pe 3 categorii:
	->profil mate
	->profil filo
	->profil art

	Etapele scolare:
		scoala primara:
		->mate: matematica
		->filo: -
		-> art: desen

		gimnaziu:
		->mate: mate, fizica, info
		->filo: lit universala
		->art: desen

		liceu:
		->mate: mate, fizica, informatica
		->filo: compuneri libere
		->art: pictura

	Nivele sanatate copil:
    ->sanatos
    ->afectiune usoara contagioasa (de exemplu gripa, guturai)
    ->afectiune usoara necontagioasa (de exemplu: dureri de cap)
    ->boala grava contagioasa
    ->boala grava necontagioasa

    Ex. predicat dorit:
    	pred_cursuri(+Clasa, +Profil, +Stare_sanatate, -Curs, -Loc, -Echipament_special )
*/


/* Mai intai definim clasele posibile. */
clasa(1).
clasa(2).
clasa(3).
clasa(4).
clasa(5).
clasa(6).
clasa(7).
clasa(8).
clasa(9).
clasa(10).
clasa(11).
clasa(12).

/* Apoi definim etapele scolare. Predicatul va avea 2 parametrii.
Unul care va contine numele etapei, iar al doilea un numar.
Numarul va fi verificat, a.i. sa apartina etapei corespunzatoare. */
etapa('primara', X) :- X >=1, X =< 4.
etapa('gimnaziu', X) :- X > 4, X =< 8.
etapa('liceu', X) :- X > 8, X =< 12.

/* Predicatele urmatoare verifica daca materia "interogata", se face in anul pus in variabila X*/
profil_matematica('matematica', X) :- (etapa('primara', X), !, true); (etapa('gimnaziu', X), !, true); (etapa('liceu', X), !, true).
profil_matematica('fizica', X) :- (etapa('gimnaziu', X), !, true); (etapa('liceu', X), !, true). 
profil_matematica('informatica', X) :- (etapa('liceu', X), !, true).
profil_filologie('literatura_universa', X) :- (etapa('gimnaziu', X), !, true).
profil_filologie('compuneri_libere', X) :- (etapa('liceu', X), !, true).
profil_artistic('desen', X) :- (etapa('primara', X), !, true); (etapa('gimnaziu', X), !, true).
profil_artistic('pictura', X) :- (etapa('liceu', X), !, true).

stare_sanatate('sanatos').
stare_sanatate('AUC').
stare_sanatate('AUNC').
stare_sanatate('BGC').
stare_sanatate('BGNC').

/* Urmatoarii atomi repartizeaza ce materii contin profilele. 
Diferenta fata de cele de mai sus este ca aici doar le repartizez 
pe profile, si mai sus verific in ce etapa se fac.*/
profil_matematica('matematica').
profil_matematica('fizica').
profil_matematica('informatica').
profil_filologie('literatura_universa').
profil_filologie('compuneri_libere').
profil_artistic('desen').
profil_artistic('pictura').

profil('matematica') :- profil_matematica(_), !, true.
profil('filologie') :- profil_filologie(_), !, true.
profil('artistic') :- profil_artistic(_), !, true.

verif(_) :- X is 'shaorma', write(X).

/*   pred_cursuri(+Clasa, +Profil, +Stare_sanatate, -Curs, -Loc, -Echipament_special )

/* acest predicat va primi ca parametru numele unui profil, iar pe baza celui de-al doilea va genera materiile pe care le contine */
materie_profil_an(P, X, O) :- (P == 'matematica') ->
									(((etapa('primara', X), !, true), O = 'matematica'); 
									((etapa('gimnaziu', X), !, true), (O = 'matematica'; O = 'fizica'; O = 'informatica')); 
									((etapa('liceu', X), !, true), (O = 'matematica'; O = 'fizica'; O = 'informatica')));
							   (P == 'filologie') ->
							   		(((etapa('primara', X), !, true), O = '');
							   		((etapa('gimnaziu', X), !, true), (O = 'literatura universala'));
							   		((etapa('liceu', X), !, true), (O = 'compuneri liberere')));
							   (P == 'artistic') ->
							   		(((etapa('primara', X), !, true), O = 'desen');
							   		((etapa('gimnaziu', X), !, true), O = 'desen');
							   		((etapa('liceu', X), !, true), O = 'pictura')).
