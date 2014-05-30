%add(X,L,L1).
%adds element X to the beginning of the list L and returns L1
add(X,L,[X|L]).

listing(L):-write(L).