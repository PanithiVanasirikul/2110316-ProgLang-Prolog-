rank(joruno,0).    %ranking in the gang. 0 is the lowest.
rank(naransha,0).
rank(doppio,0).
rank(bujaratti,1).
rank(resotto,1).
rank(porupo,1).

promoteRank(0,1,100000). %money to pay to move from rank 0 to 1 (gang member cannot move down the rank).
promoteRank(1,2,1000000). %money to pay to move from rank 1 to 2 (gang member cannot move down the rank).
promoteRank(0,2,1100000). % money to pay to move from rank 0 to 2 (gang member cannot move down the rank).

bossFavor(joruno,2).   %number of special favor the member did for the boss. 
bossFavor(naransha,5).
bossFavor(doppio,13).
bossFavor(bujaratti,2).
bossFavor(resotto,7).
bossFavor(porupo,10).


discountMultiplication(elephant, 0.5).  % multiplication to the money member has to pay The Boss if the member has the "elephant" coupon.
discountMultiplication(buffalo, 0.8).   % multiplication to the money member has to pay The Boss if the member has the "buffalo" coupon.

coupon(Name,buffalo):- bossFavor(Name,N), N >= 5, N < 10.
coupon(Name,elephant):- bossFavor(Name,N), N >= 10.

actualPay(MemberName, RankToBuy, Amount):- rank(MemberName,Rank), Rank >=RankToBuy, write('Not Possible.'), nl, Amount = 0.
actualPay(MemberName, RankToBuy, Amount):- rank(MemberName,Rank), Rank <RankToBuy, \+coupon(MemberName,elephant),\+coupon(MemberName,buffalo), promoteRank(Rank,RankToBuy,Amount).
actualPay(MemberName, RankToBuy, Amount):- rank(MemberName,Rank), Rank <RankToBuy, coupon(MemberName,C), promoteRank(Rank,RankToBuy,AmountI), discountMultiplication(C,M), Amount is (AmountI*M).
