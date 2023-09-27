# Mixed effects: Introduction

Note: This is not intended to be a full treatment of mixed effects, and this tutorial assumes you have some exposure. It does review a few key concepts, however.

Mixed effects models extend the idea of GLS to more complex error structures. In particular, errors can be correlated because they belong to the same **group**. Groups can include multiple measures taken from the same:
- Participant: e.g. trials in a psychology study, or time points in a physiological study (e.g., fMRI)
- Geographic area: e.g., zip code, in epidemiological or political studies
- Item: e.g., individual pictures, words, or other stimuli in a psychology experiment
- Family: e.g., twins or extended family members
- Cohort: e.g., the same group in a group therapy study
- Time frame: e.g., day, if multiple participants are tested on a given day
- Experimenter: e.g., therapist, nurse, or other experimental personnel

In some cases we are interested in the variation across specific levels of these and other experimental variables. In other cases, we would like to **generalize** across levels of these variables. For example, in a marketing study, we may be interested in the difference between two specific items, Advertisement A vs. B. We may test participants in groups, and we would like to generalize across the groups to the population of people exposed to the ad at large. In this case, quantifying the uncertainty (i.e., error variance) so that we can have an appropriate level of confidence in generalizing to new groups requires accounting for the possibility that there may be a random effect of the particular group in which a person is tested.

As with any GLM, we would like to estimate and make inferences about the population values of some **fixed effects**. Fixed effects are those for which differences across the levels of the specific variables tested are meaningful to us.  e.g.:
- Drug: Prozac vs. placebo
- Sex: Male vs. female
- Item: Advertisement A vs. B

We model these in the design matrix, $X$.

Effects whose levels we would like to generalize over when making inferences on the fixed effects must be modeled in the error structure, $\Sigma$. These are **random effects**. We estimate parameters for **variance components**--generally, one for residual variance $\sigma^2$ and a series of parameters reflecting the variances and covariances across observations from the same group. In the example above, Item would be modeled as fixed (estimated with $\hat\beta$), and Group would be random (estimated with $\hat\U$ below).

$\Sigma$ is structured so that errors on observations from the same groups may be correlated. In the OLS case, $\Sigma=\sigma^2I$. In the general mixed effects case, the diagonal elements may be unequal across blocks of observations, reflecting different error variances across different groups or subsamples. The off-diagonal elements will reflect error covariance among observations collected from the same groups.  We model this structure by estimating parameters reflecting these covariances.

## Within- and between-person effects
In psychology and neuroscience experiments (and many other types of studies), it is very common to collect multiple observations from the same individuals.  It is also common to manipulate and/or test effects that vary *within-person*, e.g., an experimental manipulation of a factor where each person experiences all the levels of a factor. These are **within-person** effects. Examples include:

- Multiple levels of experimental pain intensity administered within-person
- Difficult and easy math questions assessed within-person
- Repeated measures across time: Participants are assessed pre- and post-intervention (as with the Ashar dataset)
- Treatment (in a **crossover** design, in which each person experiences each treatment)
- Age (in a **longitudinal** study)

These effects would usually be treated as fixed effects. If each person experiences each level of the effect, they are said to be **crossed** with person. In rare cases, e.g., people sampled over multiple years but at different ages, or with missing data, they may not be fully crossed.

Other things being equal, within-person effects have much lower error variances and are much less susceptible to confounds, because they eliminate many sources of variability among people that can influence the observations. With such effects, "Each person serves as their own control". Fully crossed designs are also the most powerful.

Another class of variable is assessed only at the person-level, with one value per person. These are **between-person** variables.
Examples include:
- Patient status (patient or control)
- Treatment (in a **parallel groups** design, in which each person experiences only one treatment)
- Age (in a **cross-sectional** study)
- Sex

These effects would usually be treated as fixed effects. People are **nested** within these effects, since each person experiences or belongs to only one level of the variable.   

Together, these two kinds of effects can be thought of as organized in a **hierarchy**, with the **1st level** reflecting within-person effects, and the **2nd level** reflecting between-person effects. The intercept at the 2nd level reflects the expected (average) within-person observation when all 2nd-level (between-person) predictors are at 0.

## Crossed and nested random effects

If lower-level effects are nested within or crossed with a random effect (e.g., participant), we need to specify that random effect.

![Wilkinson](wilkinsonnotation.png)



For more on crossed and nested random effects, see the
![Clapham mixed effects video on Youtube](https://youtu.be/QCqF-2E86r0)


## Two-stage summary statistics and mixed effects

Let's see how this maps onto the Ashar clinical trial dataset.

What we have done so far with the Ashar dataset is a version of a mixed effects model.
It is a **two-stage summary statistics** approach.

Time (Post vs. Pre-treatment) is a within-person (1st-level) variable.
Group (PRT vs. Placebo vs. Control) is a between-person (2nd-level) variable.
Pain (BPI) is the outcome or DV.

Previously, we used two approaches:
1. We estimated a difference score, Post - Pre-treatment Pain, for each individual. This is a within-person contrast. Then, we used a GLM to assess the effect of Group (2 regressors) on the difference scores. The F-test for Group corresponds to a one-way ANOVA on improvement scores by Group, and we coded the 2 regressors for Group to estimate specific contrasts of interest (PRT - Placebo, mean(PRT + Placebo) - Control).
2. We analyzed Group differences in Post-treatment scores (the pain measure expected to show a group difference) controlling for Pre-treatment Pain. This entailed including regressors for Group (as above) and a continuous covariate for Pre-treatment Pain.

The data were organized in a "wide format" table, with only one row per participant. Therefore, when we ran the analyses above, $y$ was always an $[m x 1]$ vector with 1 value for each of $m$ participants. Assuming participants' errors are uncorrelated, the OLS approach is valid.  

The difference scores are contrast values, with a [1 -1] contrast across the **within-person** variable Time (pre vs. post)

The group membership (PRT, Placebo, Control) is a **between-person** variable, because each person has only one value.

Therefore, we used contrasts to estimate summary statistics for each person that capture the within-person effects, and analyzed the between-person effects on those difference scores using a single-level GLM. This corresponds to testing the [Group x Post vs. Pre-treatment] interaction.  

Another way to do this is using a mixed effects model.  Instead of organizing data in a "wide format" table with one row per participant, we can use the "long format" table, in which $y$ (i.e., Pain) is an $[mk x 1]$ vector with $k$ values measured for each of $m$ participants. We model the correlation between within-person repeated measures (Pre and Post-treatment pain) by including a random effect of participant in the error model.

We explore that next.

## Don't ignore random effects
An important rule of thumb is that if we want to generalize to new, unobserved levels of a variable (e.g., participant), we must (1) estimate the variance across levels of the variable appropriately,  (2) include that variance in the error term inferential test statistics (i.e., t- and F-tests), and (3) adjust the degrees of freedom appropriately.  

If you ignore a random effect (e.g. of participant), then you will not do any of the three things above.  If you model participant as a fixed effect (i.e., create a set of regressors that capture all differences across participants), you will still not be doing any of those critical things.

If you do not model an effect as random, you will not be able to generalize to unobserved levels. For example, imagine you conduct a study of differences in brain activity for negative vs. positive words. You collect fMRI activity while participants read 10 positive words and 10 negative words (a within-person factor).  If you do not model word identity as a random effect, you will not be able to generalize to new words!  That is, your conclusions might hold for the specific words you chose, but not different words.  

Is this a problem?  Generally, yes. You're likely going to make conclusions about "positive words" as a class, but your statistical inferences can't support that generalization. Thus, the idea of "keeping it maximal" and modeling random effects that exist in your study structure is usually a good idea.

## Know when not to model an effect as random

A very common situation in psychology and neuroscience is to measure only a few levels of a variable. You might measure "hard" and "easy" math problems, or 3 levels of pain, or 8 body sites. Do you want to generalize to other levels? You might, but you can't. For example:
- You can't say that a training intervention affects performance on math problems that are harder or easier that those you tested.
- You can't say that a drug treatment affects pain responses to stimulus intensities or a body site you didn't test.

In some cases, it doesn't really make sense to think of these variables as drawn at random from a population.  There's not an infinite population of pain intensity levels or difficulty levels -- there's a continuum. And unlike participants, which we assume we can sample at random, intensity levels are not interchangeable for one another. The generalizability issue comes down to the question of whether the effects hold beyond the range of conditions under which you tested them. Thus, a solution is to sample a reasonable range and be careful not to extend inferences to levels far outside of that range.  In this situation, you'd model intensity and difficulty levels as fixed effects, or (if more levels are included) treat them as continuous fixed effects.

Likewise, there is not an infinite population of body sites, and body sites are not interchangeable. It's most appropriate to model body site as a fixed effect, and sample a range of disparate body sites. If an effect holds for some locations tested on arms, legs, head, and torso, it likely holds for other nearby ones as well. Of course, this can go wrong, and we should always consider that we don't know the boundary conditions on generalization of effects.


[Judd et al. 2012](papers/Judd_Westfall_Kenny_2012_JPSP.pdf) showed that when you have crossed random effects of item and subject, the power is limited by the smaller of the two. If you have 1 million participants but only a small number of items, you will never be able to generalize to new items with high power!  In this case you must either choose a different way to generalize, or re-design your study to include more items! By a "different way to generalize", we mean:
- Replicate the study using a different set of items
- Make and validate predictions for new (untrained) items

![juddcrossedrfxpower](juddcrossedrfxpower.png)

More generally, I'm not sure it's a great idea to ask your P-values to do all the generalization work for you. There will always be boundary conditions that it is difficult to test, and certainly difficult to sample broadly enough to include them as random effects in a mixed effects model. Experimenter, set and setting (testing location), time of year, population, paradigm design features, etc., etc. are all potential boundary conditions that could lead to a failure to generalize.  We need to see which effects are robust across variations in these.

Replication across different variants can be more convincing than a low P-value in a table.
