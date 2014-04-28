concat([H|T], L2, [H|Trez]) :- concat(T, L2, Trez).
concat([], L2, L2).