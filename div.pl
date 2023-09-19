:- prompt(_, '').

maxinlist([X], X).
maxinlist([X, Y | Tail], Max) :- maxinlist([Y | Tail], TailMax), Max is max(X, TailMax).

spaces(" /t/n").

read_words(Words) :-
    read_string(current_input, _, Input),
    spaces(S),
    split_string(Input, S, S, Words).

:-
    read_words(Words),
    findall(N, (member(Word, Words), number_string(N, Word)), Numbers),
    findall(N2, (member(Num, Numbers), (Num mod 7) =:= 0, N2 is Num), Numbers2),
    findall(N3, (member(Num2, Numbers2), (Num2 mod 4) =\= 0, N3 is Num2), FinalNumbers),
    
    length(FinalNumbers, L),
    
    (
        L =\= 0 -> (maxinlist(FinalNumbers, Result), write(Result)); write("NO")
    ),
    
    nl, halt.
