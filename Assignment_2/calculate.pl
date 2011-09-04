calculate([], Positive, Negative, Zero):-
    Positive is 0,
    Negative is 0,
    Zero is 0.
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
