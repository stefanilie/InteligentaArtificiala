% Author: Ilie Stefan Ionut impreuna cu Stamate Oana si cu ajutorul lui Truta Marian
% Date: 31.05.2014

%Predicatul oposed_sides(X,Y) este adevarat daca X si Y sunt malurile opuse.

oposed_sides(est,vest).
oposed_sides(vest,est)

between(A,A,B):-A=<B.
between(X,A,B):-A<B,A1 is A+1, between(X,A1,B).

%Definim relatia de succesiune
%Predicatul st(S1,S2) este adevarat daca exista un arc intre S1 si S2 in spatiul starilor
succ(st(B,NMB,NCB,NMis,NCan,M,N),st(B1,NMisB1,NCanB1,NMis1,NCan1,M,N)):-
			oposed_sides(B,B1),  % se ia malul opus barcii B1
			between(K1,0,M),
				%determinam numarul de misionari care trec cu barca
			between(K2,0,M),
				%determinam numarul de canibali care trec cu barca
			K1+K2=<M, K1+K2>0,
				%astfel incat sa fie cineva in barca dar sa nu fie mai multi decat numarul de locuri
			(K1=0;K1=\=0,K1>K2), 	%sa fie sau 0 misionari sau acestia sa fie mai multi decat canibalii
			NMB>=K1,NCB>=K2,NMisB1 is NMis+K1,NCanB1 is NCan+K2,
			NMis1 is NMB-K1, NCan1 is NCB-K2, is_ok(NMisB1,NCanB1),
			is_ok(NMis1,NCan1).
				%is_ok verifica sa fie pe ambele maluri ramasi mai multi misionari decat canibali
			
			
member(X,[X|_]).
member(X,[_|Y]):-member(X,Y).

%In starea initiala toti se afa pe malul estic
initial(st(est,N,N,0,0,M,N),M,N).

%In starea finala toti se afla pe malul vestic
scop(st(vest,N,N,0,0,_,N))..

is_ok(0,_).
is_ok(X,Y):-X>0,X>=Y.

%Implementarea algoritmului breadth-first folosind reprezentarea listelor prin diferente

extinde([Node|Path],NewPaths):-
		findall_liste_dif([NewNode,Node|Path],
		(succ(Node,NewNode),
		\+ (member(NewNode,[Node|Path]))),
		NewPaths).

findall_liste_dif(X,Scop,L):-
		call(Scop),assertz(elem(X)),fail;
		assertz(elem(baza)),colectez(L).
		
colectez(L):-retract(elem(X)),!,
			(X==baza,!,L=Z-Z;
			colectez(Rest),concat_liste_dif(Rest,[X|A]-A,L)).
			
concat_liste_dif(A1-Z1,Z1-Z2,A1-Z2).

rezolva_bf_dif(Nod_initial,Solutie):-
		breadthfirst_dif([[Nod_initial]|Z]-Z,
						  Solutie).
						  
breadthfirst_dif([[Nod|Drum]|_]-_,[Nod|Drum]):-
			scop(Nod).
breadthfirst_dif([Drum|Drumuri]-Z1,Solutie):-
			extinde(Drum,LL),
			concat_liste_dif(Drumuri-Z1,LL,A2-Z2),
			A2\==Z2,
			breadthfirst_dif(A2-Z2,Solutie).
			
%Utilizarea algoritmului breadth-first pentru rezolvarea problemei

solutie(N,M):-
	tell('C:\\Users\\StefanIlie\\Desktop\\canib_rez.txt'),
	initial(Start,M,N),   %configuratie initiala(mal,nr mis,nr can, nr mis mal opus, nr c m o, locuri in barca,nr)
	%cauta solutia prin bf
	(rezolva_bf_dif(Start,Solutie),lung(Solutie,N1),!,
	NN is N1-1,afisare(Solutie),nl,nl,
	write('Nr mutari: '),write(NN);
	nl,write('Problema nu are solutie')), told.
	
scrie(st(B,MX,CX,MY,CY,_,_)):-
	write('Barca se afla pe malul de '), write(B),
	write('.'),nl,oposed_sides(B,B1),
	(B=est, write('Pe malul de '),write(B),
	write(' se afla '),write(MX),scrie_nr(MX,m),
	write(' si '), write(CX), scrie_nr(CX,c),
	write('.'),nl,write('Pe malul de '),write(B1),
	write(' se afla '),write(MY),scrie_nr(MY,m),
	write(' si '),write(CY),scrie_nr(CY,c);
	B=vest, write('Pe malul de '),write(B1),
	write(' se afla '),write(MY),scrie_nr(MY,m),
	write(' si '),write(CY),scrie_nr(CY,c),
	write('.'),nl,write('Pe malul de '),write(B),
	write(' se afla '),write(MX),scrie_nr(MX,m),
	write(' si '), write(CX), scrie_nr(CX,c)),write('.').
	
scrie_nr(X,Y):-
		Y==m, (X==1, write(' misionar');
		X\==1,write(' misionari'));
		Y==c, (X==1, write(' canibal');
		X\==1, write(' canibali')).
		
afisare([]).
afisare([H|T]):- afisare(T),scrie(H),nl,nl.

lung([],0).
lung([_|T],N):-lung(T,N1),N is N1+1.
