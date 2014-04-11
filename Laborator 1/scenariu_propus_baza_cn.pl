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


pred_cursuri(CL, P, SS, CR, L, E) :- (SS == 'AUNC', !, true; SS=='sanatos', !, true), 
									 (P=='matematica', profil_matematica('matematica', CL), (CR = 'matematica', CR = ''), L = 'Micul alpinist', E = 'laptop', !, true; 
									 	P=='filologie', profil_filologie('literatura_universa', CL);
									 	P=='artistic', profil_artistic('pictura', CL), !, true),
									 	(write(CR), write(L), write(E), !, true). 
*/
//fa un predicat care iti face daca este profil la mate, sa iti scuipe toate materiile in fct de anu in care e, 
// unu care in mom in care ii bagi sanatatea sa iti dea equipement
// unu care in mom in care bagi toate astea de mai sus sa iti scuipe locatia/
};














/*
/*------Solution Predicate-----------*/

getCycle(G,Cy) :- (G >= 1 , G =< 4) -> Cy is 0 ; (G >= 5 , G =< 8) -> Cy = 1 ; (G >= 9 , G =< 12) -> Cy = 2 ; write('Invalid'),fail.

getCourse(Cy,P,C) :- (Cy =:= 0 , P = 'mathematic') -> C = 'mathematics' ; 
((Cy =:= 1;Cy =:= 2) , P = 'mathematic') -> (C = 'mathematics' ; C = 'physics' ; C = 'computer science') ; 
(Cy =:= 0 , P = 'philological') -> C = '' ; 
(Cy =:= 1 , P = 'philological') -> C = 'literature' ; 
(Cy =:= 2 , P = 'philological') -> C = 'composition' ; 
((Cy =:= 0 ; Cy =:= 1) , P = 'artistic') -> C = 'drawing' ; 
(Cy =:= 2 , P = 'artistic') -> C = 'painting' ; write('Invalid'),fail.

getLocation(Cy,C,H,L) :- ((Cy =:= 0;Cy =:= 1; Cy =:= 2),
(C = 'mathematics';C = 'literature';C = 'painting'),
(H = 'healthy'; H = 'partially unhealthy c'; H = 'partially unhealthy uc')) -> L = 'Micul Aplinist' ; 
((Cy =:= 0; Cy =:= 1),(C = 'drawing';C = 'mathematics';C = 'computer science';C = 'physics'),
(H = 'healthy';H = 'partially unhealthy c'; 
	H = 'partially unhealthy uc' ; 
	H = 'severely unhealthy c' ; 
	H = 'severely unhealthy uc')) -> L = 'Internat Central' ; 
((Cy =:= 2),(C = 'physics'),
	(H = 'healthy';H = 'partially unhealthy c'; 
		H = 'partially unhealthy uc' ; 
		H = 'severely unhealthy uc')) -> L = 'Physics Institute' ; 
((H = 'severely unhealthy c' ; H = 'severely unhealthy uc'),
	(C = 'mathematics' ; 
		C = 'drawing' ; 
		C = 'painting' ; 
		C = 'composition' ; 
		C = 'literature')) -> L = 'Hospital' ; 
(C = 'composition') -> L = 'Cenaclul Scriitorasul' ; write('Invalid'),fail.

getEquipment(H,P,E) :- (H = 'severely unhealthy c' ; H = 'severely unhealthy uc') -> E = 'laptop' ; (P = 'mathematic') -> E = 'laptop' ; (P = 'philological') -> E = 'ebook reader' ; (P = 'artistic') -> E = 'drawing kit' ; write('Invalid'),fail.
*/