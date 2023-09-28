
# Generalized Least Squares (GLS)

Generalized least squares (GLS) is an extension of the ordinary least squares (OLS) method used for regression analysis that allows for the weighting of cases and whitening of correlated residuals.

The standard GLM equation assumes that errors are IID, $ \sigma^2I $, where $I$ is an $m x m$ identity matrix. This implies that the variances of all errors are equal and uncorrelated. But in many cases, the variances are not equal (i.e., show heteroscedasticity), including:

- Outliers: Some observations are assumed to come from a different distribution, perhaps with poor process control or data acquisition errors or artifacts
- Group differences in variance: Some groups (e.g., patient groups) have higher or lower error variances
- Missing data: If the observations reflect averages of lower-level observations, there may be less data for some observations than others.
- Time series autocorrelation: Observations are correlated across time

Generalized least squares is used in **robust regression**, **time series** models, and **mixed effects** models.

We begin with a known covariance matrix $\Sigma$. In this case, the optimal solution is to project the cases onto the inverse of this matrix. Define $W = \Sigma^{-1}$. The diagonals of $W$ reflect the weights on the cases.  The off-diagonal elements reflect what is needed to "decorrelate" the observations (sometimes called "whitening" or "sphering", in the sense that "white noise" is uncorrelated).  

The GLS solution minimizes the "decorrelated" SSE, which are projected onto a space defined by the inverse of the variance/covariance matrix of observations $\Sigma$:

$$ SSE = (y - X\beta)^T\Sigma^{-1}(y - X\beta) $$

Given a design matrix $X$, a response vector $Y$, and a weight matrix $W$, the normal equations are:

$$

(X^TWX)\hat{\beta}=X^TWy

$$

The WLS estimator $\hat{\beta}_{GLS}$ for the regression coefficients is given by:

$$
\hat{\beta}_{GLS} = (X^T W X)^{-1} X^T W Y
$$

If $W = \Sigma^{-1}$, the inner multiplication by W is a whitening/sphering transformation, which transforms a set random variables with a known covariance matrix into a set of new variables whose covariance is the identity matrix, meaning that they are uncorrelated and each have variance 1.

## Weighted Least Squares

A special case is **weighted least squares**, in which W is a diagonal matrix such that the diagonals of W contain weights on the observations and the off-diagonals are 0. In this case, the weights are

If the errors are still assumed to be uncorrelated, but have unequal variance, then the optimal solution is to weight the observations by their inverses. Weighting means that some observations have more influence on the regression slopes $\beta$ than others.

Generally, weighting applies if the error variances of some cases are known and assumed to be different than those of other cases. Craig Aitken (1935) showed that when a weighted sum of squared residuals is minimized, $\hat{\beta}$ is the Best Linear Unbiased Estimate if each weight is equal to the reciprocal of the variance of the measurement. The best in this context is the minimum variance estimate.  Thus, if we knew the variance of the observations, weighting by their inverse (the **precision**) would give us the BLUE.

This idea motivates the downweighting of outliers in **robust regression**, and the downweighting of low-precision groups of observations (e.g., low-precision subjects) in **mixed effects models**.

## Variance of $\hat{\beta}_{GLS}$ and BLUE

The generalization of the GLM to account for correlated variables and unequal variances is an extension of the GLM. Let $Q$ be the Cholesky decomposition of $W$, that is, a matrix such that $W = Q^TQ$. If we multiply each side Q, applying $Q$ to both $X$ and $y$, we obtain $Qy=QX\hat{\beta} + Q\epsilon$.

The SSE is ${(Q\epsilon)}^T(Q\epsilon)$

WLS therefore minimizes the weighted sums of squares, with weights of $Q^TQ=W$.

The residual variance $\sigma^2$ is:

$$
\sigma^2 = \hat{e}'W\hat{e} ./ (n - p)
$$

Where:
- $\hat{e}$ is a vector of residuals
- $W$ is the weight matrix, equal to the inverse covariance matrix $\Sigma^{-1}$
- $n$ is the number of observations
- $p$ is the number of parameters estimated, including the intercept
- $n-p$ is the error degrees of freedom

The variance-covariance matrix of $\hat{\beta}_{GLS}$ is:

$$
\text{Var}(\hat{\beta}_{WLS}) = \sigma^2(X^T W X)^{-1}
$$

There are multiple choices of Q. The important constraint is that $Q^TQ = W = \Sigma^{-1}$. Some choices are:
1. Mahalanobis or ZCA whitening: $Q=\Sigma^{-1/2}$
2. Cholesky whitening: $Q=L^T$, where $L$ is the Cholesky decomposition of $\Sigma^{-1}$
3. PCA whitening

A few more details are in [this paper](https://www.sciencedirect.com/science/article/abs/pii/S1053811905000364) on robust regression and pages on [WLS](https://en.wikipedia.org/wiki/Weighted_least_squares), GLS, whitening, and the Faraway book.

## Relationship with Mahalanobis Distance

The GLS solution is closely related to the Mahalanobis Distance.  Mahalanobis distance is a measure of the distance between a point the center of a distribution, taking into account the variances and covariances of the variables. It is especially useful in multivariate data analysis when variables are correlated. The distance is defined as:

$$
D^2 = diag((X - \bar{X}) \Sigma^{-1} (X - \bar{X})^T)
$$

Where:

- $D^2$ is the squared Mahalanobis distance
- $X$ is an $m x p$ matrix of observations, where each column is a point in p-dimensional space
- $\bar{X}$ is the mean vector of the data.
- $\Sigma^{-1}$ is the inverse of the covariance matrix of the data.

If X is transposed to be an $m x p$ matrix, as is our convention here, Matlab code for Mahalanobis distance is:
*d2 = diag((X - mean(X)) * inv(cov(X)) * (X - mean(X))')*

The Mahalanobis distance transforms the data into a space where the covariance matrix is the identity, and then computes the Euclidean distance in this transformed space. This allows it to account for correlations between variables and the relative variability of each variable. Thus, the distance is expressed in units of the standard deviation along the major axes of covariance. The distances are "whitened" or "sphered".

Mahalanobis distance is a multivariate distance metric widely used in cluster analysis and classification techniques. It is closely related to Hotelling's T-square distribution in multivariate statistical testing and Fisher's Linear Discriminant Analysis, a supervised classification method.

In the GLS case, if we consider a mean-zero residual error vector $e$ in $n$-dimensional space, where $n$ is the number of observations, the Mahalanobis distance becomes the weighted SSE, where each point is weighted by the inverse (co)variance of the errors:

$$
D^2 = e^T\Sigma^{-1}e
$$

$\Sigma$ here is the covariance of errors conditional on design matrix $X$ (i.e., on fixed effects), or $cov(\epsilon|X)$. If $\Sigma$ is diagonal (no correlations among errors), $\Sigma^{-1}$ is a matrix of the inverse variances:

$$
\begin{bmatrix}
1/\sigma^2_1 & 0 & 0 & \ldots & 0 \\
0 & 1/\sigma^2_2 & 0 & \ldots & 0 \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
0 & 0 & 0 & \ldots & 1/\sigma^2_n \\
\end{bmatrix}
$$

This is the *weighted least squares* weight matrix.

## Iterative estimation: Unknown $\Sigma$

In practice, the true variance/covariance matrix $\Sigma$ is typically unknown. Thus, both the regression coefficients (betas) and the covariance structure of the errors (and thus the weights) must be estimated. As these depend on one another, iterative methods come into play. Some algorithms and methods used for this purpose are:

Cochrane-Orcutt Algorithm: An iterative procedure to deal with first-order autocorrelation (AR1) in time-series regression. It focuses on estimating the autocorrelation parameter and the regression coefficients iteratively.

Iterative Feasible Generalized Least Squares (IFGLS): This is a more generalized approach than the previous two and can be applied when the covariance structure is more complicated. It alternates between estimating the covariance structure from residuals and then the regression parameters using this structure until convergence.

Expectation-Maximization (EM) Algorithm: Especially useful when the error covariance matrix has certain parametric forms. The EM algorithm iterates between estimating the expected value of the likelihood function (E-step) and maximizing this expected value to update parameter estimates (M-step). See [this paper](https://www.tandfonline.com/doi/abs/10.1080/01621459.1988.10478693).

Newton-Raphson and Quasi-Newton Methods: These are optimization techniques that can be applied to the likelihood function in GLS problems, especially when estimating parameters of the covariance structure. They use information about the gradient (and possibly the second derivative) of the likelihood to find the parameter values that maximize (or minimize) it.

Generalized Estimating Equations (GEE): While not GLS in the strictest sense, GEE is another approach to handle correlated data, especially for repeated measures or clustered data. It provides a way to estimate regression parameters without fully specifying the entire covariance structure, using a "working" correlation matrix. Iterative methods are used to update parameter estimates based on this working correlation.

## GLS in Mixed Effects Models

In mixed effects models, the error terms can have both fixed and random components. The random effects introduce correlation among the observations, and the variance of the residuals might change across levels of a grouping factor. GLS becomes particularly useful in this context.

When fitting mixed-effects models, the weights $W$ are used to adjust for this heteroscedasticity and correlation in the residuals. The weighted model gives more weight to observations with smaller variances (higher precision) and less weight to those with larger variances (lower precision).



## Extra considerations
### Gauss-Markov Theorem

The Gauss-Markov theorem is a fundamental result in the theory of linear regression. It states that, under certain conditions, the ordinary least squares (OLS) estimator has the smallest variance among all linear unbiased estimators. In other words, OLS is the Best Linear Unbiased Estimator (BLUE).

The conditions or assumptions of the Gauss-Markov theorem are:

1. Linearity: The relationship between the predictors and the response variable is linear.
2. Independence: Observations are independent of each other.
3. Homoscedasticity: The variance of the errors is constant across all levels of the independent variables.
4. No endogeneity: The error terms are uncorrelated with the predictors.
5. No measurement error: The independent variables are measured without error.

It's important to note that the Gauss-Markov theorem does not require the errors to be normally distributed. However, for hypothesis testing and the construction of confidence intervals, the additional assumption of normally distributed errors is often made.

One of the Gauss-Markov assumptions is the homoscedasticity of errors. When this assumption is violated, OLS is no longer the Best Linear Unbiased Estimator (BLUE). However, WLS, when correctly specified with the inverse of the variances as weights, becomes BLUE. The "best" in BLUE refers to having the smallest variance among the class of linear unbiased estimators.
