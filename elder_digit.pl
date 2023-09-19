:- prompt(_, '').


solve(Num, Base, Result) :- Result is Num mod Base, Num div Base =:= 0, !.
solve(Num, Base, Result) :- NewNum is Num div Base, solve(NewNum, Base, Result).

spaces(" \n\t").

:- 
    spaces(S),
    read_string(user_input, _, Input),
    split_string(Input, S, S, Words),
    findall(N, (member(W, Words), number_string(N, W)), Numbers),
    Numbers = [N, B],
    solve(N, B, Res),
    writeln(Res),
    halt.
