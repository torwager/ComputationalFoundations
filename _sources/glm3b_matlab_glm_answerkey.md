# A hand-coded GLM in MATLAB

This is an "answer key" for a hand-coded GLM in MATLAB

```matlab
% Core GLM equations
% -------------------------------------------
% remove nans from X and y
[wasnan, X, y] = nanremove(X, y);

xtxi = inv(X'*X);
bhat = xtxi * X' * y;
e = y - X * bhat;

[n, p] = size(X);

var_bhat = e'*e ./ (n - p) * xtxi;
t = bhat ./ (diag(var_bhat) .^ .5);

dfe = n - p;
pval = 2 * (1 - tcdf(abs(t), dfe));

se = sqrt(diag(var_bhat)); % standard error

% -------------------------------------------

% Contrasts
chat = C' * bhat;
var_chat = sigma_sq * C' * xtxi * C;
se_chat = diag(var_chat) .^ 0.5;
t_chat = chat ./ se_chat;

pval_chat = 2 * (1 - tcdf(abs(t_chat), dfe));

% -------------------------------------------

```
