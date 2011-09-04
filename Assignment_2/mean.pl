mean(L, Mean):-
    length(L, Length),
    mean(L, Mean, Length).
mean([H], Mean, Length):-
    Mean is H / Length.
mean([H|T], Mean, Length):-
    mean(T,MeanNew,Length),
    Mean is MeanNew + H / Length.
