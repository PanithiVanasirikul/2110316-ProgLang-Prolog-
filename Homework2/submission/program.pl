:- reconsult('data.pl').

start:- write('Player1, please select a position for a bomb (1-3)'), nl, 
		read(X), bomb(B), retract(bomb(B)), asserta(bomb(X)), 
		write('Player2, please pick a position (1-3)'), nl,
		read(Y), result(Y).
		
result(Y):- bomb(B), B==Y, write('Player1 wins this round.'), nl, store(player1).
result(Y):- bomb(B), \+B==Y, write('Player2 wins this round.'), nl, store(player2).

store(Player):- rec(Player,Score), retract(rec(Player,Score)), 
				Newscore is Score+1, asserta(rec(Player,Newscore)).

printRec:- rec(player1, Score1), rec(player2, Score2),
		   write('Player1 wins = '), write(Score1), write('.'), nl,
		   write('Player2 wins = '), write(Score2), write('.'), nl.
		   
save:- tell('data.pl'),listing(rec/2), listing(bomb/1), told.


