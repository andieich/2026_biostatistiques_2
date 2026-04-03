# Coral Spawning Synchrony: A GLM Case Study

## Contents

- **article/**: Original published paper (Moritz et al. 2025)
- **data/**: Processed coral spawning data
  - `SEANOE_SiteSpawning_Moritz.csv`: Site-level observations
  - `SEANOE_ColonySpawning_Moritz.csv`: Colony-level observations
- **script/**: 
  - `analysis.qmd`: Quarto analysis document (tidyverse-based, English)
  - `analysis.html`: Rendered HTML output (ready to view)
  - `GEB_CoralSpawning_Moritz.R`: Original R script by authors

## Using This Material

### For Teaching (90-minute practical)

1. **Open `analysis.html`** in a web browser to show students
2. **Live coding**: Follow the `.qmd` file, executing chunks interactively in R
3. **Student notebook**: Have students copy code from `.qmd` and run locally

### What's Covered

- ✅ Exploratory data analysis of coral spawning
- ✅ Distribution testing: Gaussian vs Gamma GLMs
- ✅ Site-level aggregation (respecting independence)
- ✅ Binary outcome: logistic regression (binomial GLM)
- ✅ Continuous outcome: Gaussian GLM on spawning times
- ✅ Mixed effects models: introducing random intercepts
- ✅ Understanding consequences of aggregation

### Key Learning Points

1. **When to use GLM**: Why linear regression fails for binary/time-of-day data
2. **Distribution choice**: Gamma for skewed, positive, continuous variables
3. **Model diagnostics**: Using `check_model()` for visual assessment
4. **Site heterogeneity**: Random effects capture site-specific deviations
5. **Real-world context**: Corals from Tahiti/Moorea, published 2025

### Practical Flow

**Part 1 (30 min): Exploration**
- Load data, inspect spawning patterns by island/habitat
- Visualize spawning times
- ANOVA to test habitat differences

**Part 2 (30 min): Distribution Comparison**
- Why Gaussian fails for skewed data
- Fit Gaussian vs Gamma GLMs on aggregated (site-mean) data
- Compare diagnostics and AIC
- Show what random effects would capture

**Part 3 (30 min): Complete GLM Analysis**
- Binary GLM (spawning yes/no)
- Continuous GLM (spawning time)
- Interpretation and predictions

## Reference

Moritz C, et al. (2025). Shining a light on daytime coral spawning synchrony across oceans. *Global Ecology and Biogeography*, **34**(3):e70072. https://doi.org/10.1111/geb.70072

**Data DOI**: 10.17882/105886
