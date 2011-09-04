% part(X, Y) Y is the part of X
part(bike, saddle).
part(bike, wheel).
part(wheel, spoke).
part(wheel, tyre).
part(tyre, inner_tube).
part(inner_tube, valve_rubber).

% part_of_bike(X) X is a part of a bike or a part of a part of the bike
part_of_bike(X):-
    part(bike, X).
part_of_bike(X):-
    part(Y, X),
    part_of_bike(Y).
