:- prompt(_, '').

seq(0, _, _, []) :- !.
seq(Length, Min, Max, [Head | Tail]) :-
    between(Min, Max, Head),
    NewLength is Length-1,
    NewHead is Head+1,
    seq(NewLength, NewHead, Max, Tail).


elements_write([]) :- !.
elements_write([Head | Tail]) :- write(Head), write(' '), elements_write(Tail).


spaces(" \n\t").

:- 
    spaces(S),
    read_string(user_input, _, Input),
    split_string(Input, S, S, Words),
    findall(N, (member(W, Words), number_string(N, W)), Numbers),
    Numbers = [L, M],
    forall(seq(L, 1, M, Result), (elements_write(Result), nl)),
    halt.
