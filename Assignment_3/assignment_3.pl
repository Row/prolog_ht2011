% 
% Assignment 3 - Jon Borglund - 2011-09-14
% Declarative Problem Solving Methods Fall 2011
%%% 

%
% Task 3 from lab 4
%  Define a relation between two lists where one list should contain all the
%  elements in the first list that starts with a given combination of letters.
%%%

% prefix_list(+Prefix, +List)
%  Succeeds if the list Prefix is the prefix of List
% Example of use:
% ?- prefix_list([a,b],[a,b,c]).
% true.
% ?- prefix_list([a,b],[b,c,d]).
% false.
prefix_list([], _).
prefix_list([H|T0], [H|T1]):-
    prefix_list(T0, T1).

% prefix(+Prefix, +String)
%  Succeeds if the atom Prefix is the prefix of the atom String
% Example of use:
% ?- prefix(ab,abc).
% true.
% ?- prefix(ab,bcd).
% false.
prefix(Prefix, String):-
    name(Prefix, ListPrefix),
    name(String, ListString),
    prefix_list(ListPrefix,ListString).

% beginning(+List, +Prefix, -NewList).
%  NewList contains the atoms from List which has the prefix Prefix.
% Example of use:
% ?- beginning([ba,abc,ca,aa],a,NewList).
% NewList = [abc, aa].     
beginning([], _, []).
beginning([H|T], Prefix, [H|Rest]):-
    prefix(Prefix, H),
    beginning(T, Prefix, Rest).
beginning([H|T], Prefix, Rest):-
    \+ prefix(Prefix, H),
    beginning(T, Prefix, Rest).

%
% Task 4a from lab 4
% Write a program that deletes elements in a list using no cut.
%%%

% delete(Elem, List, NewList)
%  NewList is List without the elements matching Elem.
% Example of use:
%  | ?- delete(a, [a,b,a,b,a,c,a], NewList).
%  NewList = [b,b,c]
delete(_, [], []).
delete(Elem, [Elem|T], Rest):-
    delete(Elem, T, Rest).
delete(Elem, [H|T], [H|Rest]):-
    \+ Elem = H,
    delete(Elem, T, Rest).

%
% Task 4b from lab 4
% Write a program that deletes elements in a list using green cut.
%%%

% delete_green(Elem, List, NewList)
%  NewList is List without the elements matching Elem.
% Example of use:
%  | ?- delete_green(a, [a,b,a,b,a,c,a], NewList).
%  NewList = [b,b,c]
delete_green(_, [], []).
delete_green(Elem, [Elem|T], Rest):-
    !,
    delete_green(Elem, T, Rest).
delete_green(Elem, [H|T], [H|Rest]):-
    \+ Elem = H,
    !,
    delete_green(Elem, T, Rest).

% 
% Task 4c from lab 4
% Write a program that deletes elements in a list using red cut. 
%%%

% delete_red(Elem, List, NewList)
%  NewList is List without the elements matching Elem.
% Example of use:
%  | ?- delete_red(a, [a,b,a,b,a,c,a], NewList).
%  NewList = [b,b,c]
delete_red(_, [], []).
delete_red(Elem, [Elem|T], Rest):-
    !,
    delete_red(Elem, T, Rest).
delete_red(Elem, [H|T], [H|Rest]):-
    delete_red(Elem, T, Rest).
