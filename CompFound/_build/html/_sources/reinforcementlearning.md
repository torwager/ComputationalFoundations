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

Q-learning tutorial using Open Ai's code:
* Here, we walk through a Q-learning tutorial developed by Joy Zhang [[ link ]](https://www.gocoder.one/blog/rl-tutorial-with-openai-gym/). It covers a random agent versus a Q-learning agent in a tax driving environment, and beautifully walks through each component of the Q-learning model. 
* Note, the tutorial is from 2021; there have been some updates in OpenAI's gym since 2021. It's now called [Gymnasium](https://github.com/Farama-Foundation/Gymnasium) with updates! This means we need to make slight updates to Zhang's tutorial.. which I've done in my edits!
* So checkout the original blog, but also follow this colab, [Heejung's edits to Zhang's tutorial](https://github.com/jungheejung/cue_RL/blob/main/openai_gym_taxi_tutorial.ipynb), which allows you to run the code without debugging. 

Links:

* Q-learning tutorial by Joy Zhang: https://www.gocoder.one/blog/rl-tutorial-with-openai-gym/
* [Heejung's edits to Zhang's tutorial](https://github.com/jungheejung/cue_RL/blob/main/openai_gym_taxi_tutorial.ipynb)
* OpenAI's website (RL intro): https://spinningup.openai.com/en/latest/spinningup/rl_intro.html
* Learn more about OpenAI's Taxi environment: https://www.gymlibrary.dev/environments/toy_text/taxi/

Additional RL resources are [hyperlinked in this document](#More-resources) or [linked here in Heejung's github](https://github.com/jungheejung/cue_RL#resources)


### Hands-on 3: Modeling cue effects on pain
(and effort and vicarious pain) in SpaceTop

Guest instructor: Aryan Yazdanpanah and Heejung

[Download the SpaceTop CueRL sample dataset](datasets/table_pain_4mdls.mat)

[Download the Matlab live script](matlab_live/RL_pain_expectation.mlx)

<iframe src="matlab_html/RL_pain_expectation.html" width="120%" height="800px"></iframe>

## More resources

### Videos lectures
* [OpenAI Spinning Up in Deep RL Workshop](https://www.youtube.com/watch?v=fdY7dt3ijgY)
* [RL Course by David Silver](https://www.youtube.com/watch?v=2pWv7GOvuf0)

### Reinforcement learning libraries
* Open AI Deep RL: https://spinningup.openai.com/
* DI engine: https://di-engine-docs.readthedocs.io/en/latest/
* Hugging face: https://huggingface.co/models?pipeline_tag=reinforcement-learning

### Compiled resources on github repos
* https://github.com/ADGEfficiency/rl-resources
* https://github.com/aikorea/awesome-rl
* https://github.com/dennybritz/reinforcement-learning

### Python
[OpenAI Baselines](https://github.com/openai/baselines)
* OpenAI Gym for reinforcement learning()
* [Neuromatch Computational Neuroscience - RL](https://compneuro.neuromatch.io/tutorials/W3D4_ReinforcementLearning/chapter_title.html)

### matlab
[Matlab RL toolbox](https://www.mathworks.com/products/reinforcement-learning.html)
https://www.mathworks.com/help/reinforcement-learning/

### Sutton and Barto Book exercises
* Python code: https://github.com/ShangtongZhang/reinforcement-learning-an-introduction
* MATLAB code: https://roboticsbiz.com/wp-content/uploads/2021/11/Reinforcement-Learning-Cheatsheet.pdf