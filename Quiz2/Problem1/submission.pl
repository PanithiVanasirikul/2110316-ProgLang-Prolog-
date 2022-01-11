:-reconsult('data.pl').

get_higher(R,X,Y):- X>=Y, R is X.
get_higher(R,X,Y):- X<Y, R is Y.
  
start:- write('Please enter student name'), nl, 
        read(X),  
        write('Please enter student score.'), nl, 
        read(Y),
	

	% write codes
	asserta(score(X,Y)),
	sum(SU), retract(sum(SU)), SU2 is SU+Y, asserta(sum(SU2)),
	count(CNT), retract(count(CNT)), CNT2 is CNT+1, asserta(count(CNT2)),
	max(MA), retract(max(MA)), get_higher(R,MA,Y), asserta(max(R)),
	AVG is SU2 / CNT2, write('Average = '), write(AVG),nl,
	

	start.