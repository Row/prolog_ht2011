even(X):-
    0 is X mod 2.
    
divisible(X,Y):-
    0 is X mod Y.

odd(X):-
    0 =\= X mod 2.
    
undivisible(X,Y):-
    0 =\= X mod Y.

is_leap_year(Y):-
    divisible(Y,100),
    divisible(Y,400).
is_leap_year(Y):-
    undivisible(Y,100),
    divisible(Y, 4).
    
