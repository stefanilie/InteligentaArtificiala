% Author: Ilie Stefan Ionut 242 
% Date: 31.05.2014
  
:-dynamic nr/1. %numarul de pasi 
:-dynamic lista/1. %lista
  
cit_sir_fis(Fin,Fout):- read_next(Fin), output(Fout). 
  
output(Fout):- open(Fout,write,Stream),retract(lista(L)),afiseaza(Stream,L),close(Stream).% se afiseaza lista din baza lista([..]) 
afiseaza(Stream,[H|T]):- afiseaza(Stream,T),write(Stream,H),write(Stream,' '). 
afiseaza(_,[]). 

% Predicatul de citire. Mai intai vom initializa numarul de pasi si lista in sine. Apoi aca gasim alt numar numar special, il sterge.
5 apoi daca ajunge la sfarsitul fisierului, actualizam nr si lista si punem numerel in lista.
read_next(Fin):-retractall(lista(_)),retractall(nr(_)), 
                open(Fin,read,Stream),assert(nr(0)), assert(lista([])), %initializam numarul de pasi si lista 
                repeat,read(Stream,X), 
                         once(retract(nr(N))),     
                         (N==0->                    
                            (X==end_of_file->true;  
                                write(X),nl,N1 is X-1,
                                assert(nr(N1)),X==0);   
                                (X==end_of_file-> !,close(Stream),fail;
                                N1 is N-1,assert(nr(N1)),
                                once(retract(lista(Lv))), 
                                assert(lista([X|Lv])),fail)),!,
                                close(Stream). 
  
/* 
Listing: 
| ?- cit_sir_fis('fin.txt','fout.txt'). 
3 
5 
1 
3 
4 
0 
yes 
| 
  
in fis.out:2 4 2 2 0 3 2 4 1 2 3 
*/ 