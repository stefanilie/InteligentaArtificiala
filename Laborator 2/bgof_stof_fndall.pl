%Author: Ilie Stefan Ionut 242
%Date: 29.05.2014

%laptop(id, tip, frecventa procesor(MHz), baterie(ore),kg)
laptop(l1, hp, 1800, 4, 2.45).
laptop(l2, lenovo, 2300, 4, 2.5).
laptop(l3, acer, 1600, 7, 1.3).
laptop(l4, hp, 1300, 5, 2).
laptop(l5, samsung, 1700, 3, 1.9).
laptop(l6, samsung, 1400, 5, 2.1).
laptop(l7, hp, 2000, 6, 3).

%Acesta este faptul adaugat de mine
laptop(l8, asus, 1600, 1, 1). 

% Predicat care dupa cum ii spune numele, nu face altceva 
% decat sa vada daca elementul apartine multimii.
apartine(X,[]) :- fail.
apartine(X,[X|_]).
apartine(X,[H|T]) :- apartine(X,T).

/*Predicat de numarare al elementelor */
count([],0).
count([H|T], Contor) :- count(T, Contor1), Contor is Contor1+1.

/* Predicat care returneaza toate marcile de laptopuri
   Se foloseste de setof */
lista_branduri(L) :- setof(X,Y^Z^W^K^laptop(Y,X,Z,W,K),L).



% Predicat ce va returna clasa de greutate (usor sau greu) pe baza greutatii acestuia in kg 
% si o lista corespunzatoare.
clasagr_list(ClasaGr, ListaCalc) :- apartine(ClasaGr, [usor, greu]), setof(X,A^B^C^D^(laptop(X,A,B,C,D),((D=<2 ,ClasaGr == usor); (D > 2, ClasaGr == greu))), ListaCalc).


% Predicat ce va returna pentru brand, numarul de laptopuri pe care le produce.
nr_laptop_brand(Nume, NrL) :- lista_branduri(L), apartine(Nume,L), setof(X,A^V^C^D^(laptop(X,A,V,C,D),A==Nume), List),count(List, NrL).


% Predicat ce va returna in ordinea frecventei procesorului brandurile.
brandOrderFreq:- setof([F, B], Id^Bt^G^laptop(Id, B, F, Bt, G), ListFrq), write(ListFrq).
/*Listing
| ?- brandOrderFreq.
[[1300,hp],[1400,samsung],[1600,acer],[1600,asus],[1700,samsung],[1800,hp],[2000,hp],[2300,lenovo]]
yes
*/

% Predicat ce va returna laptopurile care au sub 2.5 kg si durata bateriei de peste 4 ore.
laptop2kg4h(ListOut):- setof(I,T^F^B^G^(laptop(I,T,F,B,G), B >= 4, G =< 2.5), ListOut).
/*Listing
| ?- laptop2kg4h(ListOut).
ListOut = [l1,l2,l3,l4,l6] ? 
yes
*/

% Predicat ce returneaza greutatea medie a laptopurilor
% Mai intai vom calcula greutatea totala a tuturor laptopurilor cu ajutorul predicatului suma.
% Apoi vom calcula greutatea medie, mai intai cu bagof vom face lista de greutati,
% cu count vom calcula numarul de elemente iar cu suma suma greutatilor.
suma([],0).
suma([H|T],S) :- suma(T,S1),S is S1 + H.
greutate_medie(Gm) :- bagof(G,I^T^F^B^(laptop(I,T,F,B,G)), L), count(L,C) ,suma(L,S),Gm is S/C.
/*Listing
| ?- greutate_medie(Gm).
Gm = 2.03125 ? 
yes
*/

%predicat ce returneaza laptopul cu raportul greutate/Baterie cel mai bun
% Predicat care va returna raportul greutate baterie cel mai convenabil. 
% va face asta cu ajutorul setof, care va face o lista ordonata de liste ce vor contine 3 elemente. 
% Idul laptopului, greutatea lui si durata bateriei. 
% Cu acea lista se va apela predicatul bestRatio care va genera valorile dorite.
bestRatio([[Id,Gr,Bat]], Gr/Bat, Id).
bestRatio([[Id,Gr,Bat]|T], Max, MaxId) :-bestRatio(T, Max1 ,MaxId1),((Gr/Bat > Max1)->(Max is Gr/Bat, MaxId = Id);
										(Max is Max1,MaxId = MaxId1)).
laptop_eficient(Max, MaxId) :- setof([Id, Gr, Bat], T^F^(laptop(Id, T, F, Bat, Gr)), List), bestRatio(List, Max, MaxId).
/*Listing
| ?- laptop_eficient(Max,MaxId). 
Max = 1.0,
MaxId = l8 ? 	
yes
*/

%predicat ce citeste de la tastatura un id de laptop si returneaza atributele sale
dateLaptop:-read(Id), laptop(Id, T, F, B, G), format('Marca: ~w Frecventa: ~d Durata Baterie: ~d Greutate: ~f',[T,F,B,G]).
/*Listing
| ?- dateLaptop.
|: l3.
Marca: acer Frecventa: 1600 Durata Baterie: 7 Greutate: 1.300000
yes
*/

%predicat ce primeste o lista de branduri si returneaza o sublista a acelei lista cu laptopuri existente si in baza de cunostinte
pred(LB,LBE) :- lista_branduri(L), setof(B, (apartine(B,L), apartine(B,LB)), LBE).
/*Iterogari
| ?- pred([acer,samsung,hp,cafea,lapte],LE).
LE = [acer,hp,samsung] ? 
yes
*/

% Predicatul acesta va returna o lista de laptopuri asemanatoare, adica cele care au diferenta dintre frecvente =<400.
lista_perechi_laptopuri_asemanatoare(ListAlike) :- setof([L1,L2],T^F^B^G^T1^F1^B1^G1^(laptop(L1,T,F,B,G),
											laptop(L2,T1,F1,B1,G1), (abs(F-F1) =< 400), (abs(B-B1)<2), (abs(G-G1) < 1), L1 \== L2), ListAlike).
/*Listing
| ?- lista_perechi_laptopuri_asemanatoare(L).
L = [[l1,l5],[l1,l6],[l4,l6],[l5,l1],[l6,l1],[l6,l4]] ? 
yes
*/