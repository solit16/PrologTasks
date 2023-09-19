:- prompt(_, '').

spaces(" \n\t").

% repeat_string(S, -1, "") :- !.
repeat_string(_, 0, "") :- !.
repeat_string(S, N, Result) :- N1 is N-1, repeat_string(S, N1, Local), string_concat(S, Local, Result).

write_string_n_times(_, 0) :- !.
write_string_n_times(S, N) :- 
    N1 is N-1,
    writeln(S),
    write_string_n_times(S, N1).

:-
    spaces(S),
    read_string(user_input, _, Input),
    split_string(Input, S, S, Words),
    findall(N, (member(W, Words), number_string(N, W)), Numbers),
    [N, K] = Numbers,
    repeat_string("*", N, Local),
    string_concat(Local, " ", Local2),
    repeat_string(Local2, K, Border),
    
    (N > 1 ->
        N2 is N-2,
        repeat_string(" ", N2, Spaces),
        string_concat("*", Spaces, Local3),
        string_concat(Local3, "* ", Local4),
        repeat_string(Local4, K, Inner),
        
        writeln(Border),
        write_string_n_times(Inner, N2),
        writeln(Border);
        repeat_string("* ", K, Result),
        writeln(Result)
    ),
    halt.
