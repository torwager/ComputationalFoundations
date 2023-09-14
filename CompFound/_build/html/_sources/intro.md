# Computational foundations for Neuroscience

## Psych 178 ##
Fall 2023, Tor Wager

```{tableofcontents}
```
## What it is, what it's not

What this course is intended to do:
- Provide an expandable series of topics and tutorials
- Help you gain some fundamental building blocks that will enhance your self-education
- Take a "back to basics" kind of approach without (hopefully) being too redundant
- Allow flexibility so you can adapt this to your research
- Be a collaboration with you!

What this course is not:
- A finished product
- A complete course in statistics or computation
- A "how to do this fancy thing with this toolbox" kind of course.

## The importance of estimating uncertainty
aka: "The importance of knowing that we don't know"

Statistical inference is a part of virtually all data analyses efforts in neuroscience and psychology.  When they are not, they usually should be.  

Inference is about establishing how confident we should be that the pattern of effects we see in the data are "real", i.e., replicable and likely to be observed again in the future.

Whether we're observing a multivariate pattern in the data, plotting latent trajectories, testing a new alignment algorithm, fitting a learning model, or whatever, we should all be asking ourselves:
- What is the uncertainty on whatever property I'm interested in?
- How can I construct a statistical test to characterize the uncertainty and calibrate my confidence level?

This is why we're starting with some statistical tests that are the most useful and widely used.

## Schedule and links

This book:
https://torwager.github.io/ComputationalFoundations

[Dropbox link to post assignments](https://www.dropbox.com/scl/fo/3te8rk6x2kx4zazec5v5j/h?rlkey=9zbmslsw0h4m1h34svjmr90s0&dl=0)

**Course Schedule and Timetable: Fall 2023**
September 11, 2023 -- Fall term classes begin
### Week 1:   Sept 14
Overview and student feedback, discussion.
Explore datasets for final projects
General linear model (GLM)
Covariates
Contrasts
Model diagnostics and VIFs
Basis functions and nonparametric regression (splines)
Robust regression
Autocorrelation and time series models
No, I do not expect to get through all this!!!
### Week 2: Sept 20
Multi-level linear models and mixed effects
IGLS/rIGLS
Simulating power and false positive rates (bias/variance, precision-recall)
Inference with randomization tests (bootstrapping, permutation)
Mediation
### Week 3: Sept 28
Penalized regression (ridge, LASSO)
Cross-validation
Multivariate predictive classification and regression models (SVM, LASSO-PCR)
### Week 4: Oct 5
Bayesian fundamentals
Empirical Bayes
Bayes Factors
### Week 5: Oct 12
Oct 12: Predictive processing and active inference (Ryan Smith) – all day workshop
### Week 6: Oct 19
Reinforcement learning and sequential models (Soltani)
Kalman Filter
### Week 7: Oct 26
Natural language processing (Manning)
### Week 8: Nov 2
Recurrent neural networks (Murray)
### Week 9: Nov 9
Present final projects
### Week 10: Nov 16
Present final projects
November 14, 2023 -- Fall term classes end

[tor's working doc](https://docs.google.com/document/d/16L0Tpt934ySmf4ZO2PbuJuljDOpbKylk9uapWjMoszM/edit#heading=h.u9fpxhsk33it)

[tor's dropbox](https://www.dropbox.com/scl/fo/cnaoqc60ht08ervbevlhf/h?rlkey=4cdlsoq22zv3ldhf3oxy63gtg&dl=0)

## Final projects

Choose one:
1. Apply a technique to a dataset you are currently working on and hope to/have published on. Present method and findings.  Create a notebook that will allow other students to access data (or a subset of it) and run.
2. Create a tutorial on a selected topic not already covered.

Present your final project the last 2 weeks of class (20-30 min per presentation)

Built with [Jupyter Book](https://jupyterbook.org)
