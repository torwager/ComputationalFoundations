## Satterthwaite correction for degrees of freedom

The Satterthwaite approximation is used to approximate the effective degrees of freedom in situations where the assumption of homoscedasticity (equal variances) is not met. This approach provides a corrected degree of freedom, which can be particularly important in the context of t-tests with unequal variances and mixed models.

Given two variances $\sigma^2_1$ and $\sigma^2_2$ with respective sample sizes $n_1$ and $n_2$, the Satterthwaite approximation for the degrees of freedom is:

$$
\text{df}_{\text{Satterthwaite}} = \frac{\left(\frac{\sigma^2_1}{n_1} + \frac{\sigma^2_2}{n_2}\right)^2}{\frac{\left(\frac{\sigma^2_1}{n_1}\right)^2}{n_1 - 1} + \frac{\left(\frac{\sigma^2_2}{n_2}\right)^2}{n_2 - 1}}
$$

The numerator represents the squared sum of the individual variances divided by their sample sizes, while the denominator adjusts this sum based on the sample sizes minus one.
