/*Predicatul de citire. Acesta va citi sirul de caractere din fisier.*/
%list_char(FisIn,ListCh):-seeing(Input_curent), see(FisIn), read(String), seen, see(Input_curent), atom_chars(String,ListCh).

:-dynamic lit/1.
list_char(Fisin, ListCh):-seeing(Input_curent),
                       see(Fisin),
                       repeat,
                         get_char(X),
                           (X==end_of_file
                           ;
                           assert(lit(X)), fail),
                       !,
                       faLista(ListCh),
                       seen,
                       see(Input_curent).


faLista(Lista):- findall(X, lit(X), Lista).

/*Pasul de oprire al recursivitatii.*/
check([],_,_,_,_,[]).

/*Predicatul care va efectua verificarea. Acesta este impartit pe 3 cazuri: (indiferent care dintre ele, mai intai se verifica daca cele 3 sunt diferite*/
/*Primul caz: nu mai am timp, scuze :(*/
check([Ch|ListCh],Lit1,Lit2,Nr1,Nr2,List):-Lit1 \== Lit2,((Lit1 == Ch,Nr1Aux is Nr1+1,check(ListCh,Lit1,Lit2,Nr1Aux,Nr2,List));
										  (Lit2 == Ch,Nr2Aux is Nr2+1,Nr2Aux<Nr1,check(ListCh,Lit1,Lit2,Nr1,Nr2Aux,List));
										  (Lit1 \==Ch,Lit2 \==Ch,List=[Ch|Rest],check(ListCh,Lit1,Lit2,Nr1,Nr2,Rest))).


/*Acesta este predicatul propiu zis. El va citi prima litera, a doua litera, le va unifica cu Lit1 si respectiv Lit2 si va apela list_char, care va citi si alcatui lista de caractere*/
pred(FisIn, Lit1, Lit2, List):-	list_char(FisIn,ListCh), check(ListCh,Lit1,Lit2,0,0,List).