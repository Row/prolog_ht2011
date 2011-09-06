% 
% Assignment 2 - Jon Borglund - 2011-09-06
% Declarative Problem Solving Methods Fall 2011
%%% 

%
% Task 3 from lab 3
%  Write a program that search for journals based in a set of subjects and a 
%  small database with information about the journals.
%%%

% Since I do not have access to ping poing I conducted my test on the following 
% database.
% journal(Name, Subject_list).
journal('A', ['X', 'Y', 'Z']).
journal('B', ['X', 'Z']).
journal('C', ['X', 'J']).

% sub_list(+SubList, +List)
%  True if SubList is a sublist of List 
sub_list([], _).
sub_list([H|T], L):-
    member(H, L),
    sub_list(T, L).

% find_journal(+SubList, ?Journal)
%  Succeeds if SubList is a sublist of the journal subject list in Journal. 
%  If Journal is an unbound variable, Journal is bound to the journals with
%  SubList in their subject list.
% Examples of use:
% ?- find_journal(['X'], 'A').
% true.
% ?- find_journal(['X'], J).
% J = 'A';
% J = 'B';
% J = 'C';
% false.
find_journal(SubList, Journal):-
    journal(Journal, JournalSubjectList),
    sub_list(SubList, JournalSubjectList).
    
%
% Task 4 from lab 3
%  Write a program that calculates the number of positive integers, negative
%  integers, and zeros in a list of integers.
%%%

% calculate(+List, -Positive, -Negative, -Zero)
%  Pre: List is a list with integers.
%  Post: Positive is the number of positive integers in List.
%  Post: Negative is the number of negative integers in List.
%  Post: Zero is the number of zeros in List.
% Examples of use:
% ?- calculate([1, 0, 0, -1], Positive, Negative, Zero).
% Zero = 2,
% Positive = 1,
% Negative = 1.
calculate([], 0, 0, 0).
calculate([0|T],Positive, Negative, Zero):-
    calculate(T, Positive, Negative, NewZero),
    Zero is NewZero + 1.
calculate([H|T],Positive, Negative, Zero):-
    H > 0,
    calculate(T, NewPositive, Negative, Zero),
    Positive is NewPositive + 1.
calculate([H|T], Positive, Negative, Zero):-
    H < 0,
    calculate(T, Positive, NewNegative, Zero),
    Negative is NewNegative + 1.
