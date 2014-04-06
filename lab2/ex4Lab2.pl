%membru(+E, +L).
membru(E, [E|_]).
membru(E, [_|T]) :- membru(E,T).
