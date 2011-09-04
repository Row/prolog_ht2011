mammal(X):-
    vivaparous(X),
    carnivore(X).

vivaparous(lion).
vivaparous(tiger).

carnivore(Y):-
    has_sharp_teeth(Y),
    has_claws(Y).
    
has_sharp_teeth(lion).
has_sharp_teeth(tiger).

has_claws(tiger).
has_claws(lion).
