secret_number(66).

guess_a_number(X, X):-
    write('Correct!!!'),
    nl.
guess_a_number(Y, X):-
    Y<X,
    write('Too big!'),
    nl,
    guess_a_number(Y).
guess_a_number(Y, X):-
    Y>X,
    write('Too small!'),
    nl,
    guess_a_number(Y).
guess_a_number(Y):-
    write('Give an integer: '),
    read(X),
    guess_a_number(Y,X).
guess_a_number:-
    secret_number(Y),
    guess_a_number(Y).
