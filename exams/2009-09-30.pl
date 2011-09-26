%% 1a. 
% A Prolog program consists of restricted sentences in predicate calculus 
% in form of Horn clauses. The Horn clauses can have three different formats. 
% Which are these formats and what do they denote? Present the three formats
% through examples in Prolog and describe them also in text.
%
%%% Answer
% First we have rules, if the relation e.g.
% A :- B, C .. N.
% If B and C to N are true, A is true also.
%
% Second we have facts.
% A.
% Where the given fact A is always true.
%
% Second we have the queries, e.g.
% ?- A.
% Which is used to query the system XXX
%
%% 1b.
% The execution of a Prolog program is a derivation. What is the proof 
% procedure in the derivation called? Describe shortly the type of derivation
% and how the proof is organized?
%
%%% Answer
% The derivation is called the resolution rule. It has two premises and a
% conclusion, the conclusion can also be called resolvent and the premises its 
% parents. 
% The deduction is peformed by negating the statment. Then the resolution
% rule is used until a contradiction is reached.
%
%% 1c.
% During the course we have sometimes written programs that generate a solution
% through the problem solving method generate-and-test. Discuss the benefits
% and drawbacks with such a problem solving method in general. What makes 
% declarative programming languages suitable for solving problems with
% this method? 
%
%%% Answer
% The benefits is that the developer do not need indept understanding of 
% the problem at hand. But the solution will be very naive and uneffecient.
% The backtracking of prolog implements the generate-and-test in a natural way,
% Generate, fail, backtrack, generate, fail, backtrack, genereate... until a 
% solution is found.

%% 2 XXX


%% 3a
% Write a program check_double(List) which checks that every couple of elements
% in List consists of the same element. Update the program so it follows the 
% given definition.
% ?- check_double([1,1,5,5,3,3]).
% yes
% ?- check_double([1,1,5,3,3]).
% no
% ?- check_double([1,1,3,3,3]).
% no

% check_double([]).
% check_double([_]).
% check_double([A,A| Rest]):-
%   check_double([A|Rest]).
% check_double([A,B| Rest]):-
%   check_double([B|Rest]).

%% Solution
check_double([A,A]).
check_double([A,A | Rest]):-
    check_double(Rest).

%% 3b
% The recursive program change(Word,NewWord,Inlist,Outlist) is a relation between
% Inlist and Outlist where all instances of Word in Inlist is changed to the word NewWord
% in Outlist. The other elements are the same in the both lists.

% ?- change(his, 'his or hers',[pedagogues, should, ask, the, student, about, his, view, of, courses, his, opinion, is, important],Outlist).
% Outlist = [pedagogues, should, ask, the, student, about, 'his or hers', view, of, courses, 'his or hers', opinion, is, important]
%
% change(_,NewWord,[],[]).
% change(Word,NewWord,[Word|Rest],Outlist):-
%   change(Word,NewWord,Rest,[NewWord|Newlist]),
%   Outlist = [NewWord|Newlist].

change(_,_,[],[]).
change(Word,NewWord,[Word|Rest],[NewWord|Outlist]):-
    !,
    change(Word,NewWord,Rest,Outlist).
change(Word,NewWord,[Head|Rest],[Head|Outlist]):-
    \+ Word == Head,
    !,
    change(Word, NewWord, Rest, Outlist).
 
 
%%% 4
% The given database describes some facts regarding the some European countries.
% country(Country, Capital, Inhabitants_in_millions, Area_in_square _kilometers)
country('Sweden', 'Stockholm', 9.3, 449964).
country('Denmark', 'Copenhagen', 5.5, 43094).
country('Norway', 'Oslo', 4.8, 385199).
country('Finland', 'Helsinki', 5.3, 338145).
country('Iceland', 'Reykjavik', 0.32, 103125).
country('Great Britain', 'London', 60.6, 244820).
country('Turkey', 'Ankara', 71.5, 783562).

% nordic_country(Country)
nordic_country('Sweden').
nordic_country('Norway').
nordic_country('Denmark').
nordic_country('Finland').
nordic_country('Iceland').

% national_day(Country,date(Day,Month))
national_day(' Sweden', date(6, 'June')).
national_day('Norge', date(17, 'May')).
national_day('Finland', date(6, 'December')).
national_day('Turkey', date(29, 'October')).
national_day('Denmark', date(5, 'June')).
national_day('Great Britain', date(11, 'June')).
national_day('Iceland', date(17, 'June')).

% form_of_government(Country,Form)
form_of_government('Sweden', monarchy).
form_of_government('Norway', monarchy).
form_of_government('Finland', republic).
form_of_government(' Denmark', monarchy).
form_of_government('Great Britain', monarchy).
form_of_government('Iceland', republic).
form_of_government('Turkey', republic).

% queen(Country,Name)
queen('Denmark', 'Margrethe II').
queen('Great Britain','Elisabeth II').

% king(Country,Name)
king('Sweden', 'Karl XVI Gustav').
king('Norway', 'Harald V').

% flag(Country,Colour_list)
flag('Sweden',[blue, yellow]).
flag('Norway',[red, blue, white]).
flag('Finland',[blue, white]).
flag('Denmark',[red, white]).
flag('Great Britain',[blue, white, red]).
 
%%% 4 a) 
% Which are the capitals in the database, where the countries have more than
% 5 millions.
more_than_five(Capital):-
    country(_, Capital, Population, _),
    Population > 5.0.

run4a(L):-
    findall(Capitol, more_than_five(Capitol),L).

%%% 4 b)
% Which countries have their national day in June?
run4b(L):-
    findall(Country, national_day(Country, date(_, 'June')),L).

%%% 4 c)
% Which of the Nordic countries have republic as form of government?

republic_nordic(Country):-    
    form_of_government(Country, republic),
    nordic_country(Country).
run4c(L):-
    findall(Country, republic_nordic(Country), L).
    
%%% 4 d)
% Generate a list with the monarchs (i.e. queens and kings) related to their countries. Every
% element in the list should be a stucture monarch(Name,Country), where Name is the name of the
% monarch.
monarch(Name, Country):-
    queen(Country, Name).
monarch(Name, Country):-
    king(Name, Country).

run4d(L):-
    findall(monarch(Name,Country),monarch(Name, Country),L).

%%% 4e
% Write a program colour_in_flag(Colour,List_of_countries) that generates a list with
% the countries that have a given colour in their flag.
% Ex:
%
% ?- colour_in_flag(red,List_of_countries).
% List_of_countries = ['Norway','Denmark','Great Britain']
%
colour_in_flag(Colour, L):-
    findall(Country, flag_has_colour(Country, Colour), L).

flag_has_colour(Country, Colour):-
    flag(Country, List),
    member_list(Colour, List).

member_list(E, [E|_]):-
    !.
member_list(E, [H|T]):-
    \+ E == H,
    !,
    member_list(E, T).
    
%%% 4f Write a program count_population_density that computes the number of inhabitants per
% square kilometre for every country in the database. Store the information in the database as the
% predicate population_density(Country,Number) where Number is the number of people that
% lives in a square kilometer in the current Country.

%Ex:
% ?- count_population_density.

%After the execution the database will include facts such as:

% population_density('Sweden',20.7).
% population_density('Great Britain',247.5).

count_population_density:-
    findall(Country, assert_population_density(Country), _).


assert_population_density(Country):-
    country(Country, _, Population_in_Million, Area),
    Population is Population_in_Million * 1000000,
    PopulationDensity is Population / Area,
    assert(population_density(Country, PopulationDensity)).

%%% 5a
% Write a program check_sex(pno(Born, No), Sex) that can answer whether a person is a
% man or a woman. Utilise the person number that we have in Sweden. The first 6 digits give the
% birth date Born and the following 4 gives a number, No. The information is stored in the structure
% pno(Born, No). The second integer from the end in No gives the sex, women have equal
% numbers and men have odd numbers. In the first example below the digit 0 gives that the person
% is a woman and in the second example the digit 7 gives that the number refers to a man.

% ?- check_sex(pno(851115,2302),Sex).
% Sex = woman

% ?- check_sex(pno(821223,5678),Sex).
% Sex = man

check_sex(pno(_, No), man):-
    is_man(No), !.
check_sex(pno(_, No), woman):-
    \+ is_man(No), !.
    
is_man(No):-
    NoTen is No mod 100,
    No1 is NoTen // 10,
    1 is No1 mod 2.

%% 5b)
% Write a program count_men_women(No_man,No_women,List_women) that utilises a predicate
% person_list(List), see below, where every elements is a structure info(Name,pno(Born,
% No)). The first argument in the structure is the name of an individual and the second denotes the
% person number. The program count_men_women should count the number of men and women.
% Note that the predicate defined in a) can be used to decide which is a man and which is a woman.
% The program should also store the names of the women in List_women , the third argument in the
% program.

% The predicate person_list(List) is already given in the program.

% Ex:

person_list([info('John', pno(821223,5678)), info('Elsa', pno(851115,2302)), info('Bo', pno(751005,1234)), info('Michael', pno(660225,4110)), info('Sanna',pno(880915,2881))]).

%?- count_men_women(No_man,No_women,List_women).
% List_women = ['Elsa', 'Sanna']
% No_men = 3
% No_women = 2

count_men_women(No_man,No_women,List_women):-
    person_list(L),
    count_men_women(No_man,No_women,List_women, L).
    
count_men_women(0, 0, [], []).
count_men_women(NoMan, NoWoman, [Name | ListWomen], [info(Name,pno(_,No))|T]):-
    \+ is_man(No),
    count_men_women(NoMan, NoWoman1, ListWomen, T),
    NoWoman is NoWoman1 + 1.
count_men_women(NoMan, NoWoman, ListWomen, [info(_, pno(_,No))|T]):-
    is_man(No),
    count_men_women(NoMan1, NoWoman, ListWomen, T),
    NoMan is NoMan1 + 1.

% 6a 
% Check the sear ch space (7 + 4 + 6 points)
%
% The predicate set(L1,L2,List) defines the relation between L1 and L2 where all elements in L1
% that cannot be found in L2 should be elements in List.
% a)
%
set([],_,[]).
set([E|R],L2,[E|L3]):-
    \+ m(E,L2),
   set(R,L2,L3).
set([E|R],L2,L3):-
   set(R,L2,L3).

 m(E,[E|R]).
 m(E,[F|R]):-
   m(E,R).

% Give all alternative answers that the program can give to the following question:

% ?- set([a,i,o],[n,i,c,e],List).
%
% XXX

% b) Rewrite the program in two different ways so that only the correct answers can be found in
% List when asking Prolog for alternative answers.

set1([],_,[]).
set1([E|R],L2,[E|L3]):-
    \+ m1(E,L2),
    !,
   set1(R,L2,L3).
set1([_|R],L2,L3):-
   set1(R,L2,L3).

 m1(E,[E|_]).
 m1(E,[_|R]):-
   m1(E,R).
  

set2([],_,[]).
set2([E|R],L2,[E|L3]):-
    \+ m2(E,L2),
   set2(R,L2,L3).
set2([E|R],L2,L3):-
   m2(E,L2),
   set2(R,L2,L3).

 m2(E,[E|_]).
 m2(E,[_|R]):-
   m2(E,R).

% c) Is the program tail recursive? Describe what it means to have a tail recursive program. What’s
% the point of having tail recursive programs? If a program is not tail recursive how can you rewrite
% it so it will get that form?

%% Answer
% The program is not tail rekursive, the program can be made tail rekursive by using cut and a accumulator for the list. XXX

    
