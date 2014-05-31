%  Ilie Stefan Ionut 242 impreuna cu Oana Stamate

%st(JC,Tabla,Nivel,Max)  % Max = X sau O

mutare_max(st(Max,_,_,Max)).
mutare_min(Poz):- \+ mutare_max(Poz).

mutari(st(JC,Tabla,N,Max),LPoz):- \+ config_final(Tabla,_), N>0, bagof(X,mutare(Poz,X),LPoz).

mutare(st(JC,Tabla,N,Max),st(JO,Tabla1,N1,Max)):- N1 is N-1, jc_opus(JX,JO), pune_simbol(JC,Tabla,Tabla1).

jc_opus(X,O).
jc_opus(O,X).

pune_simbol(JC,[nul|Tabla],[JC|Tabla]).
pune_simbol(JC,[Simbol|Tabla],[Simbol|Tabla1]):- pune_simbol(JC,Tabla,Tabla1).

config_final([J,J,J|_],J):- J\==nul.    %linie
config_final([J,_,_,J,_,_,J,_,_],J):- J\==nul.  %coloana
config_final([J,_,_,_,J,_,_,_,J],J):- J\==nul.  % diagonala

config_final(Tabla,nul):-\+ membru(nul,Tabla).

staticval(st(_,Tabla,_,Max,),Val):- config_final(Tabla,J),(J==Max ,!, Val is 10,
                                                           J== nul, !, Val is 0,
                                                           Val is -10).
                                                           
staticval(st(_,Tabla,_,Max),Val):-  nr_linid(Tabla,Max,NMaxd), jc_opus(Max,Min), nr_linid(Tabla,Min,NMind), Val is NMaxd-NMind.

nr_linid(Tabla,J,Nr):-linia1(Tabla,J,N1), linia2(Tabla,J,N2),.... col1, col2, col3, d1,d2 ... Nris N1+N2+...+N8.

linia1([X1,X2,X3|_],J,N1):- cond(X1,J),cond(X2,J),cond(X3,J),!,N=1;N=0.   % analog pt celelalte

cond(X,J): X==nul; X==J.