# Script de cours — Semaine 3 (Modèles linéaires)

## Diapositive 1 — Titre
Aujourd’hui, on passe des graphiques aux modèles. Nous allons relier moyenne, variance et distribution normale à l’idée de modèle statistique, puis introduire régression et ANOVA comme deux cas d’un même cadre.

## Diapositive 2 — Les bases : données brutes
Voici un petit échantillon de poids de manchots. Avant tout modèle, on regarde les données brutes et on se demande : comment les décrire simplement ?

## Diapositive 3 — Les bases : la moyenne
Une première synthèse est la moyenne : on additionne toutes les valeurs et on divise par le nombre d’observations. Elle donne la “valeur centrale”.

## Diapositive 4 — Les bases : déviation individuelle
Mais une moyenne seule ne suffit pas. On mesure l’écart de chaque observation à la moyenne : c’est la déviation individuelle.

## Diapositive 5 — Les bases : écart‑type
En agrégeant ces déviations, on obtient l’écart‑type, une mesure globale de la variabilité. Plus il est grand, plus les valeurs sont dispersées.

## Diapositive 6 — Pourquoi la variabilité ?
La variabilité n’est pas du bruit pur : la majorité des valeurs se regroupent près de la moyenne, et peu s’éloignent beaucoup.

## Diapositive 7 — Distribution normale
Beaucoup de phénomènes biologiques ressemblent à une distribution normale : une cloche, centrée sur une moyenne et étalée selon un écart‑type.

## Diapositive 8 — Accumulation d’effets
Pourquoi la normale ? Parce que de nombreux petits effets aléatoires s’additionnent : croissance, environnement, génétique…

## Diapositive 9 — Paramètres de la normale
Une distribution normale se résume par deux paramètres : la moyenne $\mu$ et l’écart‑type $\sigma$.

## Diapositive 10 — Normaliser les données
Si nos données suivent approximativement une normale, on peut ajuster une courbe normale à l’histogramme et interpréter ses paramètres.

## Diapositive 11 — Modèle statistique (intercept seul)
On formalise cela par un modèle : chaque observation vient d’une normale de moyenne $\mu$ et d’écart‑type $\sigma$. C’est un modèle linéaire avec seulement une constante.

## Diapositive 12 — Tests d’hypothèse : idée générale
Un test commence par un modèle et une hypothèse nulle : “pas d’effet” ou “valeur spécifique”. On compare ensuite aux données.

## Diapositive 13 — Hypothèses $H_0$ et $H_1$
$H_0$ est l’hypothèse de référence. $H_1$ est l’alternative. On cherchera des preuves contre $H_0$.

## Diapositive 14 — Valeur p : définition
La valeur p est la probabilité d’obtenir un résultat aussi extrême que celui observé, si $H_0$ est vraie.

## Diapositive 15 — Valeur p : règle de décision
Petite p : données improbables sous $H_0$ → on rejette $H_0$. Grande p : données compatibles → on ne rejette pas.

## Diapositive 16 — Exemple : moyenne de poids = 0 ?
Tester “moyenne = 0” n’est pas biologiquement pertinent, mais c’est un exemple simple pour comprendre la logique des tests.

## Diapositive 17 — Questions biologiques pertinentes
En biologie, on s’intéresse plutôt aux relations (longueur ↔ poids) ou aux différences entre groupes (espèces).

## Diapositive 18 — Relation poids‑longueur
Visualisons la relation entre la longueur du bec et la masse corporelle. Cela suggère une tendance.

## Diapositive 19 — Modèle de régression
On ajuste une droite : le modèle relie la moyenne $\mu_i$ à la longueur du bec via une pente $b$ et une intercept $a$.

## Diapositive 20 — Régression chez les Gentoo
On illustre le modèle sur une espèce. Le modèle prédit un poids moyen en fonction de la longueur du bec.

## Diapositive 21 — Nom du modèle
Un modèle linéaire avec une variable explicative numérique est une **régression**.

## Diapositive 22 — Différences entre espèces
Autre question : les espèces ont‑elles des poids moyens différents ? On compare des groupes.

## Diapositive 23 — Modèle ANOVA (intercepts multiples)
Le modèle attribue une moyenne différente à chaque espèce. C’est une régression sans pente.

## Diapositive 24 — Coefficients et interprétation
Les coefficients représentent des différences par rapport à une espèce de référence.

## Diapositive 25 — ANOVA et valeur p
L’ANOVA teste si les moyennes des groupes diffèrent significativement.

## Diapositive 26 — Vers les tests post‑hoc
Si l’effet est significatif, on veut savoir quels groupes diffèrent. On fera les tests post‑hoc la semaine prochaine.

## Diapositive 27 — Unifier les tests
Régression, test t et ANOVA sont des cas particuliers d’un même cadre : le modèle linéaire.

---

# Résumé (FR)
- **Moyenne et écart‑type** : la moyenne décrit le centre, l’écart‑type la dispersion.
- **Distribution normale** : beaucoup de phénomènes suivent une normale décrite par $\mu$ et $\sigma$.
- **Modèle statistique** : les données sont vues comme issues d’une distribution avec paramètres.
- **Hypothèses et p‑value** : on évalue la compatibilité des données avec $H_0$.
- **Régression** : une variable numérique explique une variable réponse via une pente.
- **ANOVA** : comparer des moyennes de groupes revient à une régression sans pente.
- **Cadre unifié** : test t, ANOVA et régression sont des modèles linéaires.

# Summary (EN)
- **Mean and SD**: the mean gives the center, the SD the spread.
- **Normal distribution**: many phenomena follow a normal with $\mu$ and $\sigma$.
- **Statistical model**: data are treated as draws from a distribution with parameters.
- **Hypotheses and p‑value**: assess compatibility of data with $H_0$.
- **Regression**: a numeric predictor explains a response via a slope.
- **ANOVA**: comparing group means is a regression without slope.
- **Unified framework**: t‑test, ANOVA, and regression are linear models.
