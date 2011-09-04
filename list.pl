divide([X,Y|T], [X,Y], T).

find([X|_], X).
find([_|T], X):-
    find(T, X).

fond_of(L):-
    find(L, of),
    find(L, fond).
    
every_second([],[]).
every_second([E|[]],[E]).
every_second([E,_|T], [E|List]):-
    every_second(T,List).


