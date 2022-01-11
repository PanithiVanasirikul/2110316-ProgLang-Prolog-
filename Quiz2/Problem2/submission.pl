diff(R,X1,X2):- X1<X2, R is X2-X1.
diff(R,X1,X2):- X1>X2, R is X1-X2.
diff(R,X1,X2):- X1==X2, R is 0.

get_higher(R,X,Y):- X>Y, R is X.
get_higher(R,X,Y):- X<Y,  R is Y.
get_higher(R,X,Y):- X==Y, R is X.

greatestdiff([H1|[]],[H2|[]],Result):- diff(H1,H2,Result).
greatestdiff([H1|T1],[H2|T2],Result):- greatestdiff(T1,T2,Result), diff(H1,H2,AResult), get_higher(Result, AResult), !.