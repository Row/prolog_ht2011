% 
% Assignment 3 - Jon Borglund - 2011-09-10
% Declarative Problem Solving Methods Fall 2011
%%% 

%
% Task 3 from lab 4
%  Define a relation between two lists where one list should contain all the
%  all the elements in the first list that starts with a given combination
%  of letters.
%%%


% prefix(+Prefix, +List)
%  Succeeds if the list Prefix is the prefix of List
% Example of use:
% ?- prefix([a,b],[a,b,c]).
% true.
% ?- prefix([a,b],[b,c,d]).
% false.
prefix([], _).
prefix([H|T0], [H|T1]):-
    prefix(T0, T1).

% beginning(+List, +Prefix, -NewList).
%  NewList contains the atoms from List which has the prefix Prefix.
% Example of use:
% ?- beginning([ba,abc,ca,aa],a,NewList).
% NewList = [abc, aa].     
beginning([], _, []).
beginning([H|T], Prefix, [H|Rest]):-
    name(H, ListH),
    name(Prefix, ListPrefix),
    prefix(ListPrefix,ListH),
    !,
    beginning(T, Prefix, Rest).
beginning([_|T], Prefix, Rest):-
    beginning(T, Prefix, Rest).
    

