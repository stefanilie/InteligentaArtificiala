/*
Author: Ilie Stefan Ionut, 242
Date: 06.05.2014
*/

/*Solutie 1 - lista de liste*/
matrice(m1,[[1,2,3],[4,5,6],[7,8,9]]).

element_matrice('m1', 0, 0, 1).
element_matrice('m1', 0, 1, 2).
element_matrice('m1', 0, 2, 3).
element_matrice('m1', 1, 0, 4).
element_matrice('m1', 1, 1, 5).
element_matrice('m1', 1, 2, 6).
element_matrice('m1', 2, 0, 7).
element_matrice('m1', 2, 1, 8).
element_matrice('m1', 2, 2, 9).

/*Solutie 2 - vectori separati
Vor fi n predicate pentru cele n elemente. Fiecare va avea primul predicat numele
matricei, cel de-al doilea un index, iar cel de-al 3lea, va fi reprezentat de o lista
ale carei elemente, primul va fi valoarea propiu zisa, iar celelalte 2 vor fi coordonatele sale, 
X si Y elementului in matrice

ID va tine minte numarul elementului. Predicatul va face mai intai o unificare a listei, 
apoi va cauta coordonatele sale in matrice, le va verifica daca X si Y gasite, sunt egale cu cele date ca parametru si daca da, 
va cauta recursiv in lista de elemente.
*/


indexID([],ID,X) :- write('Nu exista'),nl.
indexID([H|T], 1, X) :- X is H, nl.
indexID([H|T], ID, X) :- N1 is ID-1, indexID(T,N1,X). 

element_2('m2', 0,[1,0,0]).
element_2('m2', 1,[2,0,1]).

element_2('m2', 2,[3,1,0]).
element_2('m2', 3,[4,1,1]).

element_matrice2(nume, ID, X, Y, Val) :- element_2(nume, ID, list), indexID(list, 3, newX), indexID(list, 3, newY), 
											((X =:= newX, Y =:= newY) -> indexID(list,1,Val); 
											(N1 is ID+1,element_matrice2(nume,N1,X,Y,Val))).



/*
This solution is similar to the first.
The difference is that it uses only the index of the element and not the
coordinates.
In order to retrieve the element from the matrix, an index search is performed.
The appropriate coordinates in the matrix will be calculated using the formula:
X = index mod length ( X axis ).
Y = index divide depth ( Y axis ).
*/

/*Solutia 3 - indice*/

/*
	Aceasta solutie va avea drept caracteristica definitorie indexul, sau IDul. 
	In loc sa stocheze pentru fiecare numar sau element, pozitia sa in matrice (X si Y), 
	va stoca numai un ID, incapand de la 0. Astfel daca avem o matrice de 3x3 implicit vom
	avea 9 indexi cu valori cuprinse intre 0 si 8.

	Predicatul va avea 5 paramterii: 
	-Nume - numele matricei
	+ID - ID ul elementului care va fi unificat dupa apelul predicatului element.
	-Vad - care va reprezenta valoare cautata
	+X - X ul elementului
	+Y - Y ul elementului

	Predicatul va apela predicatul element, va unifica atomul ID, va unifica mai apoi L(lenght) 
	si D(depth) prin intermediul predicatului latime respectiv adancime iar apoi se vor afla 
	X-ul si Y-ul.

*/

element_3('m3', 0, 0).
element_3('m3', 1, 1).
element_3('m3', 2, 2).
element_3('m3', 3, 3).
element_3('m3', 4, 4).
element_3('m3', 5, 5).
element_3('m3', 6, 6).
element_3('m3', 7, 7).
element_3('m3', 8, 8).

latime(X) :- X is 3.
adancime(Y) :- Y is 3.

getElement(Nume, ID, Val, X, Y) :- element(Nume, ID, Val), latime(L), adancime(D), X is mod(ID,L), Y is ID/D.   