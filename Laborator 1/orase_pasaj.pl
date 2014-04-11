%Ilie Stefan Ionut 242
%23.03.2014

localitate('Bucuresti',1921751).
localitate('Iasi',321580).
localitate('Cluj-Napoca',318027).
localitate('Turda',55770).
localitate('Alexandria',50591).
localitate('Mangalia',40037).
localitate('Bunesti',911).
localitate('Alunisu',172).

sat('Alunisu').
sat('Bunesti').

orasMare(X)      :- localitate(X,Y), Y > 150000.
orasMijlociu(X)  :- localitate(X,Y), Y > 50000 , Y < 150000.
orasMic(X)       :- localitate(X,Y), Y > 10000 , Y < 50000.
orasFoarteMic(X) :- localitate(X,Y), Y < 10000.

oras(X)        :- \+ sat(X) .
oras(_).

aceasiPop(X,Y)   :- (orasMare(X),orasMare(Y));(orasMijlociu(X),orasMijlociu(Y));(orasMic(X),orasMic(Y));(orasFoarteMic(X),orasFoarteMic(Y)).

pasaj(X,Y)       :- oras(X),oras(Y),aceasiPop(X,Y).


/*
	Avem in primul rand repartizarea oraselor si satelor,
	in 2 categorii: localitati si sat.

	Apoi avem predicatele de verificare al oraselor, pe baza
	ipotezei problemei.

	predicatul de verificare al numarului de populatie,
	verifica daca orasele fac parte din aceeasi categorie.

	Predicatul pasaj verifica pe rand daca 
	cele 2 orase date ca parametru sunt orase, si daca sunt de 
	acelasi fel, prin intermediul predicatelor mentionate mai sus.


	Listing:
	| ?- consult('orase_pasaj.pl').
	compiling /home/stefan/Documents/AIISem2/git/InteligentaArtificiala/Laborator 1/orase_pasaj.pl for byte code...
	/home/stefan/Documents/AIISem2/git/InteligentaArtificiala/Laborator 1/orase_pasaj.pl compiled, 42 lines read - 4407 bytes written, 11 ms

	yes
	| ?- pasaj('Bucuresti','Bunesti').

	no
	| ?- pasaj('Bucuresti','Cluj-Napoca').

	true ? 

	yes
	| ?- pasaj('Bucuresti','Mangalia').   

	no

*/