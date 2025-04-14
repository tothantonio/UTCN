H = zpk([-1, -2], [-0.25 + j, -0.25 - j], 2);
rlocus(H);
%%
H = zpk([], [-1], 2);
rlocus(H);
%%
H = zpk([-2], [-1], 2)
rlocus(H)
%%
H = zpk([-2], [-1, 0], 2)
rlocus(H)
%%
H = zpk([], [-1, -2], 2)
rlocus(H)
%%
H = zpk([-2], [0, 0], 2)
rlocus(H)
%%
H = zpk([-2 + j, -2 - j], [-1, 0], 2)
rlocus(H)