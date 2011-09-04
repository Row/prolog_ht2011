father(ove,jon).
father(ove,dan).
father(dan, wille).
father(dan, manna).
mother(gunnel,jon).
mother(gunnel,dan).
man(ove).
man(jon).
man(dan).
man(wille).
woman(gunnel).
woman(manna).

grandfather(X,Y):-
    father(X,Z),
    father(Z,Y).

