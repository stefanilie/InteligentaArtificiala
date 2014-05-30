%Author: Ilie Stefan Ionut 242
%Data 29.05.2014

% Declaram un operator dinamic elev cu 4 parametrii
:-dynamic elev/4.

% Baza curenta de cunostiinte
elev(ion, matematica4, romana10, informatica8).
elev(petre, matematica8, romana2, informatica9).
elev(simona, matematica10, romana10, informatica10).
elev(bogdan, matematica2, romana3, informatica4).
elev(andreea, matematica9, romana7, informatica8).

%adaugam un elevnou la baza de cunsotiinte
:-assert(elev(stefan, matematica10, romana4, informatica8)).

ultimul([Last],X):-Last=:=48,X = 58;X = Last.
ultimul([_|List],Last):-ultimul(List,Last).

%Predicatul care va calcula media propiu zisa a elevlui
media(NotaMate, NotaRo, NotaInfo, Media):-nota(NotaMate, MediaMate), nota(NotaRo, MediaRo), nota(NotaInfo,MediaInfo), Media is (MediaMate+MediaRo+MediaInfo)/3.
nota(X,Y):-name(X,List), ultimul(List,Last),Y is Last-48.


% Predicatul de redefinire.
redefine([]).
redefine([H|List]):- elev(H,NotaMate, NotaRo, NotaInfo), media(NotaMate, NotaRo, NotaInfo, Media), 
					retract(elev(X,NotaMate, NotaRo, NotaInfo)) ,assert(elev(X,medie(Media))),redefine(List).

% Predicatul principal.
medie_elev :-findall(X, elev(X,_,_,_), List), redefine(List). 

:-retract(elev(stefan,_,_,_)).