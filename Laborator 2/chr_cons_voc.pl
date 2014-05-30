%Author: Ilie Stefan Ionut 242
%Date: 29.05.2014

% Aici voi defini atomii pentru vocale, bazandu-ma pe valorile lor in codul ASCII.
vocala(65).
vocala(69).
vocala(73).
vocala(79).
vocala(87).
vocala(97).    
vocala(101).   
vocala(105).   
vocala(111).   
vocala(117).   

% Predicatele pentru consoane si respectiv pentru alte simboluri. 
% Se vor baza pe atomii de vocale. 
consoana(X):- \+(vocala(X)), X>=65, X=<122.
alte_simboluri(X):- \+(consoana(X)), \+(vocala(X)).


% verifica va verifica daca variabila este sau nu instantiata.
verifica(X):- var(X), write_term(X, [numbervars(true)]).

% Aici verifica va verifica daca este numar
verifica(X):-number(X), format('Valoarea introdusa este numar: ~d', X).

% Aici daca valoarea introdusa este atom, verifica va verifica daca valoarea introdusa este atom.
% Daca da, va face o lista din denumirea sa, ii va numara consoanele utilizand predicatul numara_consoane, apoi vocalele 
% si la final alte semne. Va afisa la final toate datele obtinute.
verifica(X):- atom(X), name(X,List), numara_vocale(List, Vocale), numara_consoane(List, Consoane), numara(List, Alte), write('This is an atom!\n'), 
		  format('Vocale: ~d ~n', Vocale), format('Consoane: ~d ~n', Consoane), format('Alte simboluri: ~d ~n', Alte).

% numara_vocale (la fel ca si celelalte 2 predicate de numarare care il urmeaza), va returna numarul de vocale.
% va calcula aceasta valoare in mod recursiv, incrementand pe Vocale1 in cazul in care este vocala, si lasand-ul asa in caz contrar.
numara_vocale([],0).
numara_vocale([A|List],Vocale):- numara_vocale(List, Vocale1), (vocala(A), Vocale is Vocale1 + 1; \+(vocala(A)), Vocale is Vocale1).

numara_consoane([],0).
numara_consoane([A|List], Consoane):- numara_consoane(List, Consoane1), (consoana(A), Consoane is Consoane1 + 1; \+(consoana(A)), Consoane is Consoane1).

numara([],0).
numara([A|List],Alte):- numara(List, Alte1),(alte_simboluri(A),Alte is Alte1 + 1;\+(alte_simboluri(A)),Alte is Alte1).
