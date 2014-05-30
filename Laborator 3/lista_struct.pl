% Author: Ilie Stefan Ionut 242
% Date: 30.05.2014

:-dynamic magazin/2 .

% Predicatul care imi creaza lista de magazine, si care le adauga in baga de cunostiinte(assert).
adauga([H|T]):- H=..[_,Produs,Nume] , assert(magazin(Produs,Nume)),adauga(T) .
adauga([]) .

% predicatul cu ajutorul caruia pun in List toate timpurile de magazine existente, fara dubluri(setof)
toateMag(List):- setof(P,Nume^magazin(P,Nume), List).

% predicatul prin intermediul caruia iau pe rand magazinele si caut unde au acel tip de produse, si le afisez.
printList([H|T]):- write(H), write(' : '), setof(Nume, magazin(H,Nume), L), write(L), nl, printList(T) .
printList([]) .

afiseaza_magazine(L):- adauga(L), toateMag(L1) , printList(L1).
