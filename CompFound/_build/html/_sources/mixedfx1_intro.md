# Mixed effects: Introduction

What we have done so far with the Ashar dataset is a version of a mixed effects model.
It is a **two-stage summary statistics** approach.

We estimated a difference score, Post - Pre-treatment pain, for each individual. Then, we used a GLM to run an analysis on the difference scores.

The difference scores are contrast values, with a [1 -1] contrast across the **within-person** variable Time (pre vs. post)

The group membership (PRT, Placebo, Control) is a **between-person** variable, because each person has only one value.

Therefore, we used contrasts to estimate summary statistics for each person that capture the within-person effects, and analyzed the between-person effects using a single-level GLM.

Another way to do this is using a mixed effects model.

We'll take a simulation-based approach to understanding mixed effects and how they perform.
We'll address questions including:
- Is the 2-stage summary statistics approach valid?  
- Is is as powerful as a full mixed effects model?
- What is the power and false positive rate of different approaches and implementations?
- What happens when we violate some of the assumptions?

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
