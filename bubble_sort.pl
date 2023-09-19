:- prompt(_, '').

bubble([], [], 0).
bubble([X], [X], 0).
bubble([X, Y | Tail], [Y | Local], 1) :- Y < X, bubble([X | Tail], Local, _).
bubble([X, Y | Tail], [X | Local], Z) :- X =< Y, bubble([Y | Tail], Local, Z).

elements_write([]) :- !.
elements_write([Head | Tail]) :- write(Head), write(' '), elements_write(Tail).

sort(L) :- bubble(L, _, T), T =:= 0, !.
sort(L) :- bubble(L, Local, T), T =:= 1, elements_write(Local), nl, sort(Local).

spaces(" \n\t").

:- 
    spaces(S),
    read_string(user_input, _, Input),
    split_string(Input, S, S, Words),
    findall(N, (member(W, Words), number_string(N, W)), Numbers),
    sort(Numbers),
    halt.
