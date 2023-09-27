# Parameterizing models in a GLM


## Two-sample t-test

In a two-sample $t$-test, we're comparing means from two groups. The design matrix $X$ has one column of ones (for the intercept) and a second column indicating group membership. The group membership column will use numeric codes for the two groups.  

We will use **effect codes**, which have values of 1 and -1 for each of the groups.

Using $n_1$ to represent the number of samples in Group 1 and $n_2$ to represent the number of samples in Group 2, the design matrix $X$ can be depicted as:

$$
X = \begin{bmatrix}
1 & -1 \\
1 & -1 \\
\vdots & \vdots \\
1 & -1 \\
1 & 1 \\
1 & 1 \\
\vdots & \vdots \\
1 & 1 \\
\end{bmatrix}
$$

The design matrix $ X $ has $ n_1 + n_2 $ rows, corresponding to all the samples from both groups, and 2 columns (intercept and group indicator).
- The first column (all ones) represents the intercept. $\hat{\beta}_0$, the slope for the first column, reflects the average $y$ value when the other predictor is zero -- that is, the midpoint of the two groups, or the average of Group 1 and 2.  
- The second column is an effects-coded variable: it is -1 for all samples from Group 1 (the reference group) and 1 for all samples from Group 2. $\hat{\beta}_1$ reflects Group 2 - Group 1.  

As long as we are not interested in the significance of the intercept, there are many codes that will work. We can use any two different numbers. If we change the codes, the **scale** of $\hat{\beta}_1$ will change, but not the t-value or P-value, because the scale is "canceled out" in the t-test. In addition, the interpretation of the intercept will change, and its significance (t- and P-value) will as well.

For example, we could use **dummy codes** of 0 and 1 for Groups 1 and 2, respectively. This would make the intercept reflect the mean of Group 1, and it's P-value reflect whether Group 1's scores were significantly different from 0.  

In brain imaging, we often care about whether the average subject's value (e.g., brain activity) is significantly different from 0, controlling for other predictors, so we care about the intercept. This makes effect codes very useful.

If $n_1$ and $n_2$ are not equal, the intercept will reflect the mean of the two groups, but it will not reflect the average subject (i.e., observation), and its variance will increase. The intercept's variance is the lowest at the mean observation value.  In addition, the variance of $\hat{\beta}_1$ will increase.

## One-way ANOVA with more than 2 groups

In the example above, one regressor was sufficient to code the difference between 2 groups. More generally, we need $k-1$ regressors to code for all possible differences among $k$ groups.  This is because we lose a degree of freedom when we consider the space of differences -- i.e., there is 1 difference across 2 groups, 2 unique differences across 3 groups, etc. Algebraically, differences among $k$ means span a $k-1$-dimensional subspace.

Contrasts do not need to be orthogonal in order for the set of regressors together to capture all possible differences across group means (or, more generally, levels of a categorical variable). But if I want to interpret the significance of any one of the regressors individually, the codes we use should be **orthogonal**.  

**Dummy coding** codes for each group separately, with one group designated as the reference group. e.g., for a categorical variable with 4 levels:
*c = eye(4)*
*c = c(:, 1:3)*
The 4th group is the reference group, and its mean is reflected in the intercept.
This is **not** an orthogonal set of codes. It is suboptimal if you want to interpret the significance of the individual parameter estimates because we have introduced multicolinearity in the regressors.

$$
X = \begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 1 \\
0 & 0 & 0 \\
\end{bmatrix}
$$

**Deviation contrast coding** codes for each group separately, with one group designated as the reference group. The means are subtracted from each set of contrast weights  
*eye(4) - mean(eye(4))*
*c = c(:, 1:3)*
The 4th group is the reference group.
This is **not** an orthogonal set of codes, but the set together is orthogonal to the intercept, so the intercept will still be interpreted as the average outcome value.

$$
X = \begin{bmatrix}
0.7500 &  -0.2500  & -0.2500  \\
-0.2500 &   0.7500  & -0.2500  \\
-0.2500  & -0.2500  &  0.7500  \\
-0.2500 &  -0.2500 &  -0.2500 \\
\end{bmatrix}
$$

**Difference coding** (or Reverse Helmert coding)
In this coding system, each level is compared to the mean of the previous levels.

$$
X = \begin{bmatrix}
1 & 0.5 & 0.33 \\
-1 & 0.5 & 0.33 \\
0 & -1 & 0.33 \\
0 & 0 & -1 \\
\end{bmatrix}
$$

This **is** an orthogonal set of codes, so you can interpret the significance of individual $\hat{\beta}$s without problems of introduced multicolinearity. And the set together is orthogonal to the intercept, so the intercept will still be interpreted as the average outcome value.

The CANlab function *create_orthogonal_contrast_set* creates these kinds of codes for any number of levels.
e.g.,
*contrasts = create_orthogonal_contrast_set(4)'*
Creates 3 columns, each containing a set of codes for a regressor.

**Helmert coding** is the opposite of difference coding:  instead of comparing each level of categorical variable to the mean of the previous levels, it is compared to the mean of the subsequent levels.

Which should you choose?  An orthognal set is always a good bet. But it depends on what effects you want to be able to interpret.

[here](https://stats.oarc.ucla.edu/spss/faq/coding-systems-for-categorical-variables-in-regression-analysis/) is a useful page on this.

## Linear and polynomial trends for ordinal variables

**Orthogonal polynomial coding** is quite useful when you have ordinal variables in which the levels are equally spaced, and you want to test for linear, quadratic, etc. effects across the levels.     

$$
X = \begin{bmatrix}
-0.6708  &  0.5000  & -0.6708  \\
-0.2236  & -0.5000  & -0.2236  \\
 0.2236  & -0.5000  &  0.2236  \\
 0.6708  &  0.5000  &  0.6708  \\
 \end{bmatrix}
 $$

*c = [-3 -1 1 3; 1 -1 -1 1]'; c(:, 3) = c(:, 1)./norm(c(:, 1)) .^ 3*
*c = [c(:, 1) ./ norm(c(:, 1)) c(:, 2) ./ norm(c(:, 2)) c(:, 3) ./ norm(c(:, 3))]*

## ANCOVA

An Analysis of Covariance (ANCOVA) integrates ANOVA and regression. ANCOVA evaluates the influence of an independent variable on a dependent variable while statistically controlling for the effects of one or more continuous covariates.

For this example, let's use:

1. A categorical variable with two levels (for simplicity): $Group$ (e.g., Treatment vs. Control). This variable will be effect-coded.
2. A continuous variable: $Covariate$ (e.g., Age).

Here's how the design matrix $X$ might look for an ANCOVA model:

1. The first column consists of all ones, representing the intercept.
2. The second column is an effect code for the categorical variable $Group$. Let's say -1 for Control and +1 for Treatment.
3. The third column represents the continuous covariate.

Now, using matrix notation:

$$
X = \begin{bmatrix}
1 & -1 & Covariate_1 \\
1 & -1 & Covariate_2 \\
\vdots & \vdots & \vdots \\
1 & 1 & Covariate_{n-1} \\
1 & 1 & Covariate_n \\
\end{bmatrix}
$$

Where:

- The first column (all ones) represents the intercept.
- The second column represents the effect-coded categorical variable $Group$ (Control vs. Treatment).
- The third column represents the continuous covariate for each individual (or observation).

The coefficients estimated in an ANCOVA model will give:

1. The overall mean (from the intercept).
2. The adjusted effect of the treatment (after accounting for the covariate).
3. The influence of the covariate on the dependent variable.

## ANCOVA with interactions

Often, you may want to estimate the interaction between a continuous covariate and a categorical covariate.
In this case, you would effect code the group, enter continuous codes for the covariate(s), and then calculate the element-wise products of these 2 regressors and enter them as a 3rd regressor.
