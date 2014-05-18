
%ingrijeste(nume, lista_animalute)
%lista_animalute formata din structuri animalut(tip_animalut,nume)
ingrijeste(ion, [animalut(pisica,mitzi), animalut(pisica,kitty),animalut(hamster,pufi)]).
ingrijeste(dorin, [animalut(pisica,pufi)]).
ingrijeste(bobo, [animalut(catel,bobo), animalut(pisica,bobo), animalut(papagal,bobo),animalut(dinozaur,dino)]).
ingrijeste(teodor, [animalut(iepure,pufi),animalut(papagal,crantzy)]).
ingrijeste(alex, [animalut(catel,pufi),animalut(iepure,rontzy)]).
ingrijeste(diana, [animalut(catel,hamy),animalut(pisica,miauy),animalut(hamster,chitzy),animalut(hamster,rontzy),animalut(hamster,crantzy)]).


/* a)
Sa se adauge inca un om, cu animalutele sale, la baza de cunostinte, respectand formatul (se va scrie direct in fisier, nu se va adauga dinamic). 
Fara a folosi unul din predicatele predefinite care construiesc liste, afisati numele persoanelor pe ecran, 
cate unul pe linie, in ordinea in care apar in baza de cunostinte.
*/

ingrijeste(stefan, [animalut(sobolan, cangrena)]).

/*Listing:
| ?- ingrijeste(X,Y).
X = ion,
Y = [animalut(pisica,mitzi),animalut(pisica,kitty),animalut(hamster,pufi)] ? ;
X = dorin,
Y = [animalut(pisica,pufi)] ? ;
X = bobo,
Y = [animalut(catel,bobo),animalut(pisica,bobo),animalut(papagal,bobo),animalut(dinozaur,dino)] ? ;
X = teodor,
Y = [animalut(iepure,pufi),animalut(papagal,crantzy)] ? ;
X = alex,
Y = [animalut(catel,pufi),animalut(iepure,rontzy)] ? ;
X = diana,
Y = [animalut(catel,hamy),animalut(pisica,miauy),animalut(hamster,chitzy),animalut(hamster,rontzy),animalut(hamster,crantzy)] ? ;
X = stefan,
Y = [animalut(sobolan,cangrena)] ? ;
no
| */

/* b)
	Sa se scrie un predicat care afiseaza pe ecran numele animalutelor din baza de cunostinte in ordinea crescatoare a frecventei lor in baza de cunostinte.
*/


:-dynamic animal/2.

get_owner_list(List):-setof(X,ingrijeste(X,_),List).
count_animals([]).
count_animals([Animal|List]):-Animal=animalut(Tip,Nume),((animal(Tip,Nr),retract(animal(Tip,Nr)),Nr1 is Nr+1,assert(animal(Tip,Nr1)));(\+animal(Tip,Nr),assert(animal(Nume,1)))),count_animals(List).

parse_list([]).
parse_list([Owner|List]):-ingrijeste(Owner,PetList),count_animals(PetList),parse_list(List).

get_list(ListOrd):-get_owner_list(List),parse_list(List),setof((Nr,X),animal(X,Nr),ListOrd).

afisare:-get_list(ListOrd),write(ListOrd).