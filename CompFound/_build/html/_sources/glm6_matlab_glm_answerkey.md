# A hand-coded GLM in MATLAB

## GLM
This is an "answer key" for a hand-coded GLM in MATLAB
Here are the core equations:

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

## GLS

Here are the core equations extended for GLS:

```matlab
xtxi = inv(X'*W*X);
bhat = xtxi * X' * W * y;
e = y - X * bhat;

[n, p] = size(X);

sigma_sq = e'* W * e ./ (n - p);  % residual variance
var_bhat = sigma_sq * xtxi;
t = bhat ./ (diag(var_bhat) .^ .5);

dfe = n - p;
pval = 2 * (1 - tcdf(abs(t), dfe));

se = sqrt(diag(var_bhat)); % standard error

% Contrasts
if ~isempty(C)

    chat = C' * bhat;
    var_chat = sigma_sq * C' * xtxi * C;
    se_chat = diag(var_chat) .^ 0.5;
    t_chat = chat ./ se_chat;

    pval_chat = 2 * (1 - tcdf(abs(t_chat), dfe));

end
```

## Make it a function!

It's really nice, and important, to turn your scripts into functions.
Here's one that:
- Prints and returns some nice tables of statistics
- handles Contrasts as an optional argument, so you can omit them
- Lets you specify weights as a vector (for WLS) or as a full matrix (for more complex GLS)

Functions prevent erroneous and confusing interactions with extraneous or missing workspace variables!

[Download the Matlab live function](matlab_live/my_GLS.mlx)

<iframe src="matlab_html/my_GLS.html" width="120%" height="800px"></iframe>

The next steps towards making this function more robust would be to:
- Add optional inputs with default values, conferring flexibility
- Add descriptive help in a standard, machine-readable format (for, e.g., readthedocs-type frameworks). See *documentation_template.m* in CANlabCore (canlab.github.io)
- Check the format and data types of inputs up front (e.g., with *validateattributes* in Matlab)
