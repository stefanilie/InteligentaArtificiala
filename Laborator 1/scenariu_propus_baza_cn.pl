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

retEtapa(X, Et) = (X >= 1, X =< 4) -> Et = 'primara'; (X>=5, X=< 8) -> Et = 'gimnaziu'; (X >= 9, X =< 12) -> Et = 'liceu'.

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

echipament(SS, P, E) :- (SS = 'boala grava contagioasa'; SS='boala grava necontagioasa') -> E = 'laptop';
						(P = 'matematica') -> E = 'laptop';
						(P = 'filologie') -> E = 'ebook reader';
						(P = 'artistic') -> E = 'trusa desen'.

/* et=etapa, co = curs de urmat, ss=stare sanatate, l=locatie*/
locatie(Et, Co, SS, L) :- ((Et == 'primara'; Et == 'gimnaziu'; Et == 'liceu'),
								(Co = 'matematica'; C = 'literatura'; C = 'pictura'),
								(SS = 'sanatos'; SS = 'afectiune usoara c'; SS = 'afectiune usoara nc')) -> L = 'Micul Alpinist';
						  ((Et == 'primara'; Et == 'gimnaziu'), (Co = 'desen'; Co = 'matematica'; Co = 'informatica'; Co = 'fizica'),
						  	(SS = 'sanatos'; SS = 'afectiune usoara c'; SS = 'afectiune usoara nc'; SS = 'boala grava c'; SS = 'boala grava nc'))-> L = 'Internat Central';
						  ((Et == 'liceu'), (Co = 'fizica'), 
						  	(SS = 'sanatos'; SS = 'afectiune usoara c'; SS = 'afectiune usoara nc'; SS = 'boala grava nc')) -> L = 'Institutul de cercetare fizica';
						  ((SS ='boala grava c'; SS = 'boala grava nc'), 
						  	(Co = 'matematica'; Co = 'desen'; Co = 'copuneri libere'; Co = 'literatura universala';)) -> L = 'Spitatul pediatric';
						  (Co = 'compuneri libere') -> L = 'Cenaclul Scriitorasul'.


alege(Cl, Pr, SS, Co, L, E) :- retEtapa(Cl, Et), materie_profil_an(Pr, Cl, O), locatie(Et, O, SS, L), echipament(SS, Pr, E).







/*
Stack trace:
| ?- consult('scenariu_propus_baza_cn.pl').
compiling /home/stefan/Documents/AIISem2/git/InteligentaArtificiala/Laborator 1/scenariu_propus_baza_cn.pl for byte code...
/home/stefan/Documents/AIISem2/git/InteligentaArtificiala/Laborator 1/scenariu_propus_baza_cn.pl:108:3: syntax error: . or operator expected after expression
	1 error(s)
compilation failed

no
| ?- consult('scenariu_propus_baza_cn.pl').
compiling /home/stefan/Documents/AIISem2/git/InteligentaArtificiala/Laborator 1/scenariu_propus_baza_cn.pl for byte code...
/home/stefan/Documents/AIISem2/git/InteligentaArtificiala/Laborator 1/scenariu_propus_baza_cn.pl compiled, 111 lines read - 14937 bytes written, 16 ms

(4 ms) yes
| ?- materie_profil_an('matematica', 5)
.
uncaught exception: error(existence_error(procedure,materie_profil_an/2),top_level/0)
| ?- materie_profil_an('matematica', 5, O).

O = matematica ? ;

O = fizica ? ;

O = informatica

yes
| ?- materie_profil_an('matematica', 1, O).

O = matematica

yes
| ?- materie_profil_an('matematica', 12, O).

O = matematica ? ;

O = fizica ? ;

O = informatica

(4 ms) yes
| ?- materie_profil_an('filologie', 1, O).  

O = ''

(4 ms) yes
| ?- materie_profil_an('filologie', 5, O).

O = 'literatura universala'

yes
| ?- materie_profil_an('filologie', 12, O). 

O = 'compuneri liberere'

yes


*/


