# Iterative estimation of GLS Models


# Cochrane-Orcutt Algorithm

The Cochrane-Orcutt algorithm is an iterative method used to estimate the parameters of a linear regression model in the presence of autocorrelated errors, specifically first-order autoregression. It's a type of Generalized Least Squares (GLS) procedure.

#### Problem Background

When using Ordinary Least Squares (OLS) to estimate a linear regression model, one of the standard assumptions is that the errors (or residuals) are uncorrelated. If the errors are autocorrelated (especially in time series data), then the OLS estimates are still unbiased but are no longer efficient, meaning they do not have the smallest possible variance.

#### Algorithm Steps:

1. **Initial OLS Regression**: Run an OLS regression and obtain the residuals, \( e_t \).

2. **Estimate Autocorrelation**: Estimate the autocorrelation of the residuals, typically the first-order autocorrelation coefficient (\( \rho \)), using the formula:

   $$
   \rho = \frac{\sum_{t=2}^{T} e_t e_{t-1}}{\sum_{t=1}^{T} e_t^2}
   $$

   where \( T \) is the number of observations.

3. **Transform the Data**: Using the estimated \( \rho \), transform both the dependent and independent variables as:

   $$
   y_t' = y_t - \rho y_{t-1}
   $$

   $$
   x_t' = x_t - \rho x_{t-1}
   $$

   Do this for \( t = 2, \ldots, T \).

4. **Regress Transformed Variables**: Run another OLS regression using the transformed variables \( y_t' \) and \( x_t' \). Obtain the estimated coefficients.

5. **Iterate**: Use the residuals from the new regression to again estimate \( \rho \) and repeat the process until \( \rho \) converges (doesn't change much between iterations) or until a pre-defined number of iterations is reached.

6. **Final Estimates**: Once convergence is achieved, the estimated regression coefficients from the latest regression are the Cochrane-Orcutt estimates.

#### Advantages and Limitations:

- **Advantages**: The Cochrane-Orcutt procedure aims to provide more efficient parameter estimates when errors are autocorrelated.

- **Limitations**:
  - The method assumes a first-order autoregressive error structure. If the true structure is different, the estimates may still be inefficient.
  - The method discards the first observation after transformation, which may be problematic for small samples.

---

When rendered, this markdown provides a comprehensive overview of the Cochrane-Orcutt algorithm for handling autocorrelated errors in linear regression.
