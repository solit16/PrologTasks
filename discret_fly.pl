:- prompt(_, '').


spaces(" \n\t").

final(I, N, I) :- I < N - 1, !.
final(I, N, Res) :- Res is 2*N - 2 - I, !.
final(_, 1, 0).

:- 
    spaces(S),
    read_string(user_input, _, Input),
    split_string(Input, S, S, Words),
    findall(N, (member(W, Words), number_string(N, W)), Numbers),
    Numbers = [N, T],
    (N =\= 1 -> Index is T mod (2*N - 2); Index = 0),
    final(Index, N, Final),
    writeln(Final), halt.
