# Reinforcement Learning

## Introduction to RL

Reinforcement learning (RL) is a type of machine learning technique where an agent learns to perform a task by interacting with a dynamic environment. Combinations of states and actions are associated with reward (or punishment). This learning approach enables the agent to make a series of decisions that maximize expected reward.

One branch of RL focuses on computer algorithms learning to solve problems without human intervention and without being explicitly programmed to achieve the task. RL has been used since the 1980s to train agents to perform many kinds of tasks. Self-driving cars are a prominent example. At its heart is error-driven learning, which is used to update internal value representations associated with states and actions.

With advances in computer power and computational efficiency in updating multi-layer networks. Reinforcement learning is also applied in deep neural networks to train modern AI models. A major advance in large language models (LLMs) occurred when adding RL to deep neural networks trained on word and sentence prediction. This resulted in ChatGPT in 2023. Programs trained with reinforcement learning can beat the best human players in  games like Go and poker, as well as video games.

Another branch focuses on modeling how human or nonhuman animals learn and make decisions. The latter branch is of primary interest in psychology and neuroscience. Examples include:
- Modeling the process of reward and punishment learning in classical and operant conditioning (associated with studies of learning and Decision Science)
- Estimating parameters associated with hidden processes that are not directly observable (e.g., learning and forgetting rates)
- Relating model parameters to clinical characteristics and studying the effects of treatment (associated with the field of Computational Psychiatry and Computational Cognitive Neuroscience)
- Relating model parameters and/or estimates of hidden states to measures of brain activity (associated with the fields of Cognitive, Affective and Decision Neuroscience)

For a summary of RL algorithms and the fundamental underlying equations, see also:

https://github.com/FrancescoSaverioZuppichini/Reinforcement-Learning-Cheat-Sheet/blob/master/rl_cheatsheet.pdf

https://roboticsbiz.com/wp-content/uploads/2021/11/Reinforcement-Learning-Cheatsheet.pdf


## Guest lecture: Alireza Soltani

Stay tuned for slides

## Hands-on tutorials

### Hands-on 1: Introduction

Guest instructor: Aryan Yazdanpanah

[Download the Matlab live script](matlab_live/CompFound_RL_intro.mlx)

<iframe src="matlab_html/CompFound_RL_intro.html" width="120%" height="800px"></iframe>

### Hands-on 2: Q-learning

Guest lecture: Heejung Jung

Q learning tutorial using Open Ai's code:

[Heejung Github](https://github.com/jungheejung/cue_RL/tree/main)

Additional links (but use the github above!)

Q learning tutorial:
https://www.gocoder.one/blog/rl-tutorial-with-openai-gym/

OpenAI's website (RL intro):

https://spinningup.openai.com/en/latest/spinningup/rl_intro.html


### Hands-on 3: Modeling cue effects on pain
(and effort and vicarious pain) in SpaceTop

Guest instructor: Aryan Yazdanpanah and Heejung

[Download the SpaceTop CueRL sample dataset](datasets/table_pain_4mdls.mat)

[Download the Matlab live script](matlab_live/RL_pain_expectation.mlx)

<iframe src="matlab_html/RL_pain_expectation.html" width="120%" height="800px"></iframe>

## More resources

### Python

[OpenAI Baselines](https://github.com/openai/baselines)

### matlab
[Matlab RL toolbox](https://www.mathworks.com/products/reinforcement-learning.html)
https://www.mathworks.com/help/reinforcement-learning/
