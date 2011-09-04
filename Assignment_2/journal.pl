%journal(Name, Subject_list).
journal('A',['X', 'Y', 'Z']).
journal('B',['X', 'Z']).
journal('C',['X', 'J']).


find([X|_], X).
find([_|T], X):-
    find(T, X).

sub_list([E], L):-
    find(L, E).
sub_list([H|T], L):-
    find(L, H),
    sub_list(T, L).

init_list([H|T],X):-
    X is [H|T].
init_list(_,X):-
    X is [].

find_journal(SubList, Journals):-
    journal(Name, JournalSubjectList),
    sub_list(SubList, JournalSubjectList),
    init_list(Journals, Journal1),
    Journals is [Name|Journal1].
    
    
