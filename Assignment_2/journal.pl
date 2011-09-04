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

find_journal(SubList, Journal):-
    journal(Name, JournalSubjectList),
    sub_list(SubList, JournalSubjectList),
    Journal = Name.
    
    
