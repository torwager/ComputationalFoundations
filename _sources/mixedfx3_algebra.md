# Mixed effects algebra

## Starter simulations

We'll take a simulation-based approach to understanding mixed effects and how they perform.
We'll address questions including:
- Is the 2-stage summary statistics approach valid?  
- Is is as powerful as a full mixed effects model?
- What is the power and false positive rate of different approaches and implementations?
- What happens when we violate some of the assumptions?

The live script also reviews the main elements of the matrix algebra underlying mixed effects, using the notation in [Lindquist et al. 2012](papers/Lindquist_2012_variance components_in_multi-level_GLM.pdf). The model describes the basic framework and Iterative Generalized Least Squares, one way of estimating variance components.  Other models have a similar structure but differ in some details (e.g., [Bates et al. 2015](papers/lme4_Bates_2015.pdf) for LMER in R). 

[Download the Matlab live script](matlab_live/mixedfx_sims_1.mlx)

<iframe src="matlab_html/mixedfx_sims_1.html" width="120%" height="800px"></iframe>


## Activities

1. Identify and compare residual variance terms, slope estimates, t-values across models
2. Modify the code to generate one or more continuous predictors instead of categorical/experimental ones.
3. Turn the data-generation script into a function, so that you can efficiently simulate power and false positive rates using repeated simulations -- two key properties of any statistical model.


**Answer key**
For a pre-cooked answer (Matlab), see:
[Download a Matlab data sim function](matlab_live/sim_generate_mixedfx_data1.mlx)

But...don't peek! Do it yourself!!!
