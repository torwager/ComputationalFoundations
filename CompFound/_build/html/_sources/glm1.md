# General Linear Model (GLM)

The General Linear Model (GLM) is a statistical linear model that can be written in the form of a linear equation. It encompasses a range of models like simple linear regression, multiple regression, and analysis of variance.

## Model Structure

The general formulation of the GLM is:

$$ y = X\beta + \epsilon $$

Where:
- $ y $ is the dependent variable (a vector of observed values).
- $ X $ is the design matrix (it contains the values of the predictors, including a column of ones for the intercept).
- $ \beta $ is a vector of the parameters or coefficients.
- $ \epsilon $ is the error term (a vector of residuals).

## Error Structure

The errors $ \epsilon $ are generally assumed to be normally distributed with a mean of zero and a constant variance, $\sigma^2$:

$$ \epsilon \sim N(0, \sigma^2I) $$

Where $ I $ is the identity matrix.

## Model Estimation

The goal of fitting the model is to estimate $ \hat{\beta} $ so that the sum of squared errors (SSE) is minimized. This is:

$$ S = (y - X\beta)^T(y - X\beta) $$

## Normal Equations

For estimating the coefficients $ \beta $ in the least squares sense, we derive the normal equations. The goal is to minimize the sum of squared residuals:

$$ S = (y - X\beta)^T(y - X\beta) $$

Taking the derivative with respect to $ \beta $ and setting it to zero gives the normal equations:

$$ X^TX\beta = X^Ty $$

## Estimation of Coefficients

By solving the normal equations, given that $ X^TX $ is invertible, we get estimates of the coefficients $ \beta $:

$$ \hat{\beta} = (X^TX)^{-1}X^Ty $$

Where $ \hat{\beta} $ represents the estimated coefficients that minimize the sum of squared residuals.

## Residuals

Residuals are differences between the observed values and the values predicted by the model. If a model fits well, the residuals should be randomly scattered around zero.

$$ e_i = y_i - \hat{y}_i $$

Where:
- $e_i$ is the residual for observation $i$.
- $y_i$ is the observed value for observation $i$.
- $\hat{y}_i$ is the predicted value for observation $i$.

The residual variance is:

$$
var(e) = \frac{1}{n-1} \sum_{i=1}^{n} {(e_i)^2} = \frac{S}{n-1}
$$

The residual standard deviation is $ \sqrt{var(e)} $. It is a measure of the average deviation of observations from the model's predictions.   

## Degrees of freedom

The degrees of freedom (df) is the number of dimensions along which a quantity can vary. In the GLM, df are associated with both the model and the error. The model df is the dimensionality of the space spanned by the combination of parameters $\beta$. The error df, or dfe, is the dimensionality of the space spanned by $\epsilon$.

In both cases, the dimensionality is equal to the number of independent parameters or errors. In the case of model df, it is generally equal to the number of parameters, assuming none of the predictors in X are redundant.

In the case of error df, assuming the errors are independent, it is the number of observations ($n$) minus the number of model parameters estimated, including the intercept ($p$). For example, if there are 3 independent observations and one model parameter estimated (the intercept, which estimates the sample mean in this case), there are only 2 independent dimensions along which the errors can vary. (Once you know the mean and two observations, you can calculate the third). In algebraic terms they span a two-dimensional plane. Thus, the dfe are n - 1 in this simple case.  This is the ReML estimator for the sample variance.

## Standard Error of $\hat{\beta}$ in the General Linear Model

In the context of the General Linear Model, the standard errors of the estimated coefficients, $\hat{\beta}$s, quantifies the uncertainty associated with the estimates. They provide crucial information for hypothesis testing and for constructing confidence intervals around $\hat{\beta}$s.  

The standard error is a measure of the expected average deviation of the model's parameter estimates $\hat{\beta}$ given the sampling error $ var(e) $. In general, it is related to $ var(e) / sqrt(dfe) $, where $dfe$ is the error degrees of freedom. This is due to the Central Limit Theorem, which posits that the error of an estimate is inversely proportional to $ \sqrt{n} $.

The covariance of $\hat{\beta}$ is given by:

$$ \text{Var}(\hat{\beta}) = \sigma^2 (X^T X)^{-1} $$

Where:
- $\sigma^2$ is the variance of the residuals.
- $X$ is the design matrix.

From this, the standard error (SE) of each $\hat{\beta}_i, i=1...p$ is the square root of its variance:

$$ SE(\hat{\beta_i}) = \sqrt{\text{Var}(\hat{\beta_{ii}})} $$

where $ii$ denotes the $i$th diagonal element of the $p x p$ matrix $$ \text{Var}(\hat{\beta}).

The standard error provides a measure of the variability or dispersion of the estimator. A smaller standard error indicates a more stable estimator. When conducting hypothesis tests, a larger standard error (relative to the magnitude of $\hat{\beta}$) might make it harder to reject the null hypothesis that the coefficient is zero, since the coefficient estimate is less precise.

More precisely, the $ SE(\hat{\beta_i}) $ is the denominator of the t-statistic that forms the basis for parametric inferences (hypothesis tests).

The standard error is influenced by the sample size. With larger sample sizes, the standard error tends to decrease, which leads to more precise estimates.

## Model Fits

Model fit indicates how well a statistical model describes the observed data. When creating predictive models, we want our model to represent the underlying data structure accurately. There are various measures and statistics to gauge the fit of a model.

## Coefficient of Determination ($R^2$)

The coefficient of determination, often denoted as $R^2$, measures the proportion of variance in the dependent variable that is predictable from the independent variable(s).

$$ R^2 = 1 - \frac{SS_{\text{res}}}{SS_{\text{tot}}} $$

Where:
- $SS_{\text{res}}$ is the residual sum of squares.
- $SS_{\text{tot}}$ is the total sum of squares.

A value of $R^2$ close to 1 suggests that a large proportion of the variability in the outcome has been explained by the regression model. A low $R^2$ indicates otherwise.

## Akaike Information Criterion (AIC) and Bayesian Information Criterion (BIC)

Both AIC and BIC are criteria used for model selection. They consider the goodness of fit of the model and the complexity of the model.

Lower values of AIC or BIC suggest a better-fitting model. When comparing multiple models, the one with the lowest AIC or BIC can often be considered the best fit, taking into account both the goodness of fit and model complexity.
