%journal(Name, Subject_list).
journal('A',['X', 'Y', 'Z']).
journal('B',['X', 'Z']).
journal('C',['X', 'J']).

sub_list([], _).
sub_list([H|T], L):-
    member(H, L),
    sub_list(T, L).

find_journal(SubList, Journal):-
    journal(Journal, JournalSubjectList),
    sub_list(SubList, JournalSubjectList).
    
    
