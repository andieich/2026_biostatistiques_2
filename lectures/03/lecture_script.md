# Script de la Lecture 3 : Modèles linéaires

## Texte Complet en Français

### Diapositive 1 : Titre
Bienvenue à la troisième lecture. Aujourd’hui, nous passons des graphiques aux modèles statistiques. Nous allons relier moyenne, variabilité et distribution normale à la logique des modèles linéaires, puis montrer que la régression et l’ANOVA sont deux cas d’un même cadre.

### Diapositive 2 : Les bases — Données brutes
Commençons par un petit échantillon de poids de manchots. Avant tout modèle, on regarde les données brutes et on se demande comment les décrire simplement.

### Diapositive 3 : Les bases — La moyenne
Une première synthèse est la moyenne : on additionne toutes les valeurs et on divise par le nombre d’observations. La moyenne donne la valeur centrale de la distribution.

### Diapositive 4 : Les bases — Déviation individuelle
Mais une moyenne seule ne suffit pas. On mesure l’écart de chaque observation à la moyenne : c’est la déviation individuelle.

### Diapositive 5 : Les bases — Écart‑type
En agrégeant ces déviations, on obtient l’écart‑type, une mesure globale de dispersion. Plus l’écart‑type est grand, plus les valeurs sont éloignées.

### Diapositive 6 : Les bases — Pourquoi la variabilité ?
La variabilité n’est pas du bruit pur : la majorité des valeurs se regroupent près de la moyenne, et peu s’éloignent beaucoup.

### Diapositive 7 : La distribution normale
Beaucoup de phénomènes biologiques ressemblent à une distribution normale : une cloche, centrée sur une moyenne et étalée selon un écart‑type.

### Diapositive 8 : La distribution normale — Accumulation d’effets
Pourquoi la normale ? Parce que de nombreux petits effets aléatoires s’additionnent : croissance, environnement, génétique, etc.

### Diapositive 9 : La distribution normale — Paramètres
Une distribution normale se résume par deux paramètres : la moyenne $\mu$ et l’écart‑type $\sigma$.

### Diapositive 10 : La distribution normale — Ajustement
Si nos données suivent approximativement une normale, on peut ajuster une courbe normale à l’histogramme et interpréter ses paramètres.

### Diapositive 11 : Modèle statistique
On formalise cela par un modèle : chaque observation vient d’une normale de moyenne $\mu$ et d’écart‑type $\sigma$. En langage de modèle linéaire, c’est un modèle avec intercept seul.

### Diapositive 12 : Test d’hypothèse — Idée générale
Un test commence par un modèle et une hypothèse nulle : “pas d’effet” ou “valeur spécifique”. On compare ensuite aux données.

### Diapositive 13 : Hypothèses $H_0$ et $H_1$
$H_0$ est l’hypothèse de référence. $H_1$ est l’alternative. On cherchera des preuves contre $H_0$.

### Diapositive 14 : Valeur p — Définition
La valeur p est la probabilité d’observer un résultat au moins aussi extrême que celui obtenu, si $H_0$ est vraie.

### Diapositive 15 : Valeur p — Règle de décision
Petite valeur p : données improbables sous $H_0$, on rejette $H_0$. Grande valeur p : données compatibles, on ne rejette pas.

### Diapositive 16 : Exemple — Moyenne de poids = 0 ?
Tester “moyenne = 0” n’est pas biologiquement pertinent, mais c’est un exemple simple pour comprendre la logique des tests.

### Diapositive 17 : Questions biologiques pertinentes
En biologie, on s’intéresse plutôt aux relations entre variables ou aux différences entre groupes.

### Diapositive 18 : Poids et longueur
Nous avons déjà vu une relation entre la longueur du bec et la masse corporelle. Visualisons cette relation.

### Diapositive 19 : Modèle de régression
On ajuste une droite : la moyenne $\mu_i$ dépend d’une pente $b$ et d’un intercept $a$ selon la longueur du bec.

### Diapositive 20 : Régression chez les Gentoo
On illustre le modèle sur une espèce. Le modèle prédit un poids moyen en fonction de la longueur du bec.

### Diapositive 21 : Nom du modèle
Un modèle linéaire avec une variable explicative numérique est une **régression**.

### Diapositive 22 : Différences entre espèces
Autre question : les espèces ont‑elles des poids moyens différents ? On compare des groupes.

### Diapositive 23 : Modèle ANOVA
Le modèle attribue une moyenne différente à chaque espèce. C’est une régression sans pente.

### Diapositive 24 : Coefficients et interprétation
Les coefficients représentent des différences par rapport à une espèce de référence.

### Diapositive 25 : ANOVA et valeur p
L’ANOVA teste si les moyennes des groupes diffèrent significativement.

### Diapositive 26 : Vers les tests post‑hoc
Si l’effet est significatif, on veut savoir quels groupes diffèrent. On fera les tests post‑hoc la semaine prochaine.

### Diapositive 27 : Modèles statistiques et tests
Régression, test t et ANOVA sont des cas particuliers d’un même cadre : le modèle linéaire.

---

## Points en Français

### Diapositive 1 : Titre
- Titre : Modèles linéaires
- Objectif : passer des graphiques aux modèles

### Diapositive 2 : Les bases — Données brutes
- Observation des données brutes
- Question : comment décrire simplement ?

### Diapositive 3 : Les bases — La moyenne
- Définition de la moyenne
- Rôle : valeur centrale

### Diapositive 4 : Les bases — Déviation individuelle
- Écart de chaque observation à la moyenne
- Mesure individuelle de variabilité

### Diapositive 5 : Les bases — Écart‑type
- Mesure globale de dispersion
- Plus grand = plus de variabilité

### Diapositive 6 : Les bases — Pourquoi la variabilité ?
- La plupart des valeurs proches de la moyenne
- Peu de valeurs très éloignées

### Diapositive 7 : La distribution normale
- Forme en cloche
- Décrite par moyenne et écart‑type

### Diapositive 8 : La distribution normale — Accumulation d’effets
- Somme de petits effets aléatoires
- Exemples biologiques

### Diapositive 9 : La distribution normale — Paramètres
- $\mu$ : moyenne
- $\sigma$ : écart‑type

### Diapositive 10 : La distribution normale — Ajustement
- Ajuster une normale à l’histogramme
- Interpréter les paramètres

### Diapositive 11 : Modèle statistique
- Données issues d’une normale
- Modèle linéaire à intercept seul

### Diapositive 12 : Test d’hypothèse — Idée générale
- Hypothèse nulle
- Comparaison aux données

### Diapositive 13 : Hypothèses $H_0$ et $H_1$
- $H_0$ : hypothèse de référence
- $H_1$ : hypothèse alternative

### Diapositive 14 : Valeur p — Définition
- Probabilité d’un résultat aussi extrême
- Condition : $H_0$ vraie

### Diapositive 15 : Valeur p — Règle de décision
- Petite p : rejet de $H_0$
- Grande p : pas de rejet

### Diapositive 16 : Exemple — Moyenne = 0
- Exemple pédagogique
- Peu pertinent biologiquement

### Diapositive 17 : Questions biologiques pertinentes
- Relations entre variables
- Différences entre groupes

### Diapositive 18 : Poids et longueur
- Nuage de points
- Tendance visible

### Diapositive 19 : Modèle de régression
- Pente et intercept
- Relation moyenne–prédicteur

### Diapositive 20 : Régression chez les Gentoo
- Exemple d’espèce
- Prédiction du poids moyen

### Diapositive 21 : Nom du modèle
- Régression = modèle linéaire avec variable numérique

### Diapositive 22 : Différences entre espèces
- Comparaison des moyennes
- Question biologique centrale

### Diapositive 23 : Modèle ANOVA
- Une moyenne par groupe
- Régression sans pente

### Diapositive 24 : Coefficients et interprétation
- Différences par rapport à la référence

### Diapositive 25 : ANOVA et valeur p
- Test global des différences

### Diapositive 26 : Vers les tests post‑hoc
- Identifier les groupes différents
- Annoncer la suite

### Diapositive 27 : Modèles statistiques et tests
- Cadre unifié : régression, test t, ANOVA

---

## Bullet Points in English

### Slide 1: Title
- Title: Linear models
- Goal: move from plots to models

### Slide 2: Basics — Raw data
- Observe raw data
- Question: how to describe simply?

### Slide 3: Basics — Mean
- Mean definition
- Role: central value

### Slide 4: Basics — Individual deviation
- Deviation from the mean
- Individual variability

### Slide 5: Basics — Standard deviation
- Global dispersion measure
- Larger = more variability

### Slide 6: Basics — Why variability?
- Most values near the mean
- Few values far away

### Slide 7: Normal distribution
- Bell shape
- Described by mean and SD

### Slide 8: Normal distribution — Accumulation of effects
- Sum of small random effects
- Biological examples

### Slide 9: Normal distribution — Parameters
- $\mu$: mean
- $\sigma$: standard deviation

### Slide 10: Normal distribution — Fit
- Fit a normal to the histogram
- Interpret parameters

### Slide 11: Statistical model
- Data drawn from a normal
- Linear model with intercept only

### Slide 12: Hypothesis test — Big idea
- Null hypothesis
- Compare with data

### Slide 13: Hypotheses $H_0$ and $H_1$
- $H_0$: reference hypothesis
- $H_1$: alternative

### Slide 14: p‑value — Definition
- Probability of a result as extreme
- Assuming $H_0$ is true

### Slide 15: p‑value — Decision rule
- Small p: reject $H_0$
- Large p: do not reject

### Slide 16: Example — Mean = 0
- Pedagogical example
- Not biologically meaningful

### Slide 17: Meaningful biological questions
- Relationships between variables
- Differences between groups

### Slide 18: Weight and length
- Scatter plot
- Visible trend

### Slide 19: Regression model
- Slope and intercept
- Mean–predictor relationship

### Slide 20: Gentoo regression
- Species example
- Predict mean weight

### Slide 21: Model name
- Regression = linear model with numeric predictor

### Slide 22: Differences among species
- Compare means
- Central biological question

### Slide 23: ANOVA model
- One mean per group
- Regression without slope

### Slide 24: Coefficients and interpretation
- Differences vs reference group

### Slide 25: ANOVA and p‑value
- Global test of differences

### Slide 26: Toward post‑hoc tests
- Identify which groups differ
- Preview next week

### Slide 27: Statistical models and tests
- Unified framework: regression, t‑test, ANOVA
