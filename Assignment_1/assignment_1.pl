% 
% Assignment 1 - Jon Borglund - 2011-09-06
% Declarative Problem Solving Methods Fall 2011
%%% 

%
% Task 3 from lab 2 
%  Write a program that calculates whether a given year is a leap-year.
%%%

% divisible(X,Y) - succeeds if X is divisible by Y
divisible(X,Y):-
    0 is X mod Y.

% divisible(X,Y) - succeeds if X is undivisible by Y
undivisible(X,Y):-
    0 =\= X mod Y.

% is_leap_year(Y) - succeeds if Y is a leap year
is_leap_year(Y):-
    divisible(Y,100),
    divisible(Y,400).
is_leap_year(Y):-
    undivisible(Y,100),
    divisible(Y, 4).

%
% Task 8 from lab 2 
%  Write a hilo-program that gives the player a possibility to guess numbers
%  without posing a question to prolog for every guess. 
%%%

% The secret number
secret_number(66).

% guess_a_number - inits the game
guess_a_number:-
    secret_number(Y),
    guess_a_number(Y).
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
