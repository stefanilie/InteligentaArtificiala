/*Exercitiul 1 - Ilie Stefan Ionut*/
%paianjen(nume, lista_structuri_insecta)
%structura: insecta(tip, nr_prins_de_painjen) paianjen(spidy,[insecta(musca,5),insecta(fluture, 8)]).
paianjen(ochisori,[insecta(lacusta,7),insecta(fluture, 2), insecta(albina,7), insecta(libelula,5)]).
paianjen(pufy, [insecta(fluture, 5),insecta(lacusta,1), insecta(albina,3)]).
paianjen(zumi, [insecta(musca, 7)]).
paianjen(flamandu, []).
paianjen(buhu, [insecta(musca, 5),insecta(lacusta,1), insecta(albina,3), insecta(libelula,10)]).

/*a)*/

paianjen(dorel, [insecta(musca, 10), insecta(fluture, 2)]).

/*Listing
% consulting c:/users/ilie/documents/github/inteligentaartificiala/exemplu test/test.pl...
% consulted c:/users/ilie/documents/github/inteligentaartificiala/exemplu test/test.pl in module user, 0 msec -176 bytes
yes
| ?- paianjen(X,Y).                                                              X = ochisori,
Y = [insecta(lacusta,7),insecta(fluture,2),insecta(albina,7),insecta(libelula,5)] ? ;
X = pufy,
Y = [insecta(fluture,5),insecta(lacusta,1),insecta(albina,3)] ? ;
X = zumi,
Y = [insecta(musca,7)] ? ;
X = flamandu,
Y = [] ? ;
X = buhu,
Y = [insecta(musca,5),insecta(lacusta,1),insecta(albina,3),insecta(libelula,10)] ? ;
X = dorel,
Y = [insecta(musca,10),insecta(fluture,2)] ? ;
no*/

/*b*/
/*un predicat care sa ia per fiecare paianjen insectele, 
si sa calculeze cate insecte mananca*/
getNumber(insecta(A,Nr), O):- O is Nr.
nr_insecte([H|T], Nr):- nr_insecte(T, Nr1), Nr is Nr1+getNumber(H,O). 
nr_insecte([], _).


/*Predicatul care va lua toata toti paianjenii si va crea
o lista ordonata pe baza numarului de insecte mancate, 
folosind functia setof.*/

predicat_b(X, ListOut) = setof(paianjen(X,Lista), nr_insecte(Lista, Nr), ListOut).



/*c*/
/*Primul e numele paianjenului, al doilea va returna insecta preferata.*/
/*Predicat care va calcula insecta preferata, primeste lista, si scoate insecta*/
insecta_pref([H|T], Out):-setof([H|T], getNumber(H), Out).

/*Scoate ultimul element din lista*/
ultim([E], E):- !.
ultim([_|T], E):-ultim(T,E).

/*Ia parametru numele paianjenului, ii scoate lista, si va scoate pe Numar*/
predicat_c(Nume, Numar):- List is paianjen(Nume, List), insecta_pref(List, Out), ultim(List, Numar).
