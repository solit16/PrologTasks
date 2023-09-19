:- prompt(_, '').

spaces(" \s\n\t").

read_input(X1, Y1, X2, Y2) :-
    read_string(current_input, _, Input),
    spaces(S),
    split_string(Input, S, S, Words),
    Words = [Str],
    string_codes(Str, Codes),
    Codes = [A1, Y1, A2, Y2],
    X1 is A1 - 0'a + 1,
    X2 is A2 - 0'a + 1.

result(0, "YES").
result(1, "NO").

:-
    read_input(X1, Y1, X2, Y2),
    A is (X1 + Y1 + X2 + Y2) mod 2,
    result(A, Answer),
    write(Answer), nl, halt.
