find([H|_],E):- H==E, !.
find([H|_],E)   :- H==E, !.
find([H|T],E):- H\==E, find(T,E).

union([],List2,R):- R = List2, !.
union([H|T],List2,R):- \+find(List2,H), union(T,List2,RT), R=[H|RT], !.
union([H|T],List2,R):- find(List2,H), union(T,List2,R), !.

unionAll([],[]).
unionAll([H|T],R):- unionAll(T,RT), union(H,RT,R).