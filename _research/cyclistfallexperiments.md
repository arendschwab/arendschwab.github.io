---
layout: page
title: Cyclist Fall Experiments
description: Determining the maximum allowable handlebar disturbance (MAHD) for which a cyclist can keep balance
img: /assets/img/cyclistfallexperiments.jpg
related_publications: reijne2025model
---

<center>
 <figure>
  <img src="/assets/img/cyclistfallexperiments.jpg" alt="cyclist fall experiments" width="400" />
  <figcaption>
   <a href="/assets/img/cyclistfallexperiments.jpg">Cyclist Fall Experiments</a>
  </figcaption>
 </figure>
</center>

This study presents the results from experiments in which  cyclist were perturbed, resulting in both recoveries and falls (for the first time in history!) in order to determine the maximum allowable handlebar disturbance (MAHD) for which a cyclist can keep balance.


Marco M. Reijne, Frank H. van der Meulen, Frans C.T. van der Helm, and Arend L. Schwab, 2025. A model based on cyclist fall experiments which predicts the maximum allowable handlebar disturbance from which a cyclist can recover balance. *Accident Analysis and Prevention*, 221(108159). <https://doi.org/10.1016/j.aap.2025.108159>   

  
The paper and supporting material:   
1. Preprint: [reijne2025model.pdf](/assets/pdf/reijne2025model.pdf)
2. Supplementary online material, containing:
    - the experimental data and R-scripts for the statistical analysis
    - further details on the experimental setup and protocol
    - practical implications of the model
    - recommendations for future work    
    [reijne2025modelSOM.pdf](/assets/pdf/reijne2025modelSOM.pdf)

### Background   

Falls are a significant cause of injury among cyclists, highlighting the need for effective fall prevention interventions. However, ex-ante evaluation of such interventions remains challenging for engineers designing safer infrastructure and bicycles, as well as for safety professionals developing training programs. 

This study proposes the Maximum Allowable Handlebar Disturbance (MAHD) — the largest external handlebar disturbance a cyclist can recover from — as a performance indicator for evaluating fall prevention interventions. 

We conducted controlled experiments with 24 participants of varying ages and skill levels, exposing them to impulse-like handlebar disturbances that resulted in both recoveries and falls. A total of 928 observations were collected from the 24 participants
across three forward speeds (6, 12 and 18 km/h). This dataset, which includes recorded cyclist falls (on average 50% of all observations), supports future validation of bicycle dynamics and control models in predicting the MAHD. 

In addition, using Bayesian Model Averaging, we identified key cyclist factors influencing the MAHD, with forward speed and cyclist balancing skill being critical predictors. Incorporating these predictors into cyclist control models can substantially improve their practical application. These insights were then used to develop a Bayesian multilevel logistic regression model to predict the MAHD for different types of cyclists. 

Our findings improve the potential for bicycle dynamics and control models to proactively evaluate cyclist fall prevention methods, contributing to safer cycling environments.

### Video

<center>
 <figure>
  <img src="/assets/img/cyclistfallvideoscreenshot.png" width="300" />
  <figcaption>
   <a href="https://youtu.be/cdUzEJrOvQs">Video Cyclist Fall Experiments</a>
  </figcaption>
 </figure>
</center>

Here is a short video with an overview of the cyclist fall experiments: <https://youtu.be/cdUzEJrOvQs>

### Experimental data

The experimental data, R-scripts for the statistical analysis, details on the experimental setup and the protocol, practical applications of the modle and recommendations for future work are hosted on github: [https://github.com/fmeulen/CyclingFall](https://github.com/fmeulen/CyclingFall) 

---