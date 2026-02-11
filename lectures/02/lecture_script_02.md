# Script de la Lecture 2 : Visualisations

## Texte Complet en Français

### Diapositive 1 : Titre
Bienvenue à la deuxième lecture de ce cours. Aujourd'hui, nous allons parler des visualisations de données.

### Diapositive 2 : Résumé du cours précédent
Avant de commencer, faisons un bref résumé du cours précédent. Nous avons fait une introduction à R, en explorant ce que sont les objets et les fonctions. Nous avons appris à faire des résumés de base des données et nous avons découvert les différents types de données disponibles en R.

### Diapositive 3 : Données « tidy » - Variables et Valeurs
Commençons par définir ce qu'est une variable. Une variable est une quantité, une qualité ou une propriété que vous pouvez mesurer. Par exemple, la longueur de la nageoire d'un manchot est une variable. Une valeur, par contre, est l'état d'une variable lorsque vous la mesurez. La valeur d'une variable peut changer d'une mesure à l'autre. Par exemple, si nous mesurons la longueur des nageoires du manchot numéro 1, nous pourrions obtenir 181 millimètres.

### Diapositive 4 : Données « tidy » - Observations et Données tabulaires
Maintenant, qu'est-ce qu'une observation ? Une observation est un ensemble de mesures effectuées dans des conditions similaires. Une observation contient plusieurs valeurs, chacune étant associée à une variable différente. Par exemple, dans notre jeu de données sur les manchots, une observation serait une ligne complète qui contient la longueur du bec, la longueur de la nageoire, la masse corporelle, et d'autres mesures d'un seul manchot. Les données tabulaires sont un ensemble de valeurs, chacune étant associée à une variable et à une observation. Les données tabulaires sont considérées comme ordonnées ou "tidy" si chaque valeur est placée dans sa propre cellule, chaque variable dans sa propre colonne et chaque observation dans sa propre ligne.

### Diapositive 5 : Données « tidy » - Les trois règles
Il y a trois règles fondamentales pour des données tidy. Premièrement, chaque variable doit avoir sa propre colonne. Deuxièmement, chaque observation doit avoir sa propre ligne. Et troisièmement, chaque valeur doit avoir sa propre cellule. Cette structure facilite grandement l'analyse et la visualisation des données.

### Diapositive 6 : Fonctions R - Arguments nommés
Passons maintenant aux fonctions R. Les fonctions prennent des arguments en entrée. Ces arguments peuvent être nommés, comme dans l'exemple "mean" avec x égal à penguins dollar bill_length_mm. Ou ils peuvent être non nommés, où nous passons simplement penguins dollar bill_length_mm directement à la fonction mean.

### Diapositive 7 : Fonctions R - Multiples arguments
Certaines fonctions prennent plusieurs arguments. Par exemple, la fonction "seq" peut prendre "from" égal à 1 et "to" égal à 5. L'ordre de ces arguments peut être modifié si nous utilisons des arguments nommés, comme "seq" avec "to" égal à 5 et "from" égal à 1. Si les arguments ne sont pas nommés, l'ordre par défaut est supposé, donc "seq" de 1 à 5. Mais attention, si nous inversons l'ordre sans nommer les arguments, R comprendra une séquence de 5 à 1. C'est pourquoi il est recommandé d'utiliser des arguments nommés pour rendre le code plus clair et éviter les erreurs.

### Diapositive 8 : Fonctions R - Documentation
Vous pouvez toujours lire la documentation d'une fonction en exécutant un point d'interrogation suivi du nom de la fonction, comme "?seq". Cela ouvrira la page d'aide qui vous donnera toutes les informations nécessaires sur la fonction.

### Diapositive 9 : Pourquoi visualiser ? - Données brutes vs Résumé
Pourquoi est-il si important de visualiser nos données ? Regardons cet exemple. À gauche, nous avons des données brutes qui peuvent sembler difficiles à interpréter. À droite, nous avons un résumé statistique avec la moyenne de X, la moyenne de Y, les écarts-types et la corrélation. Ces résumés peuvent sembler informatifs, mais ils peuvent masquer des patterns importants dans les données. Plusieurs jeux de données très différents peuvent avoir des statistiques résumées identiques.

### Diapositive 10 : Pourquoi visualiser ? - Le Datasaurus
C'est exactement ce que montre le Datasaurus Dozen. Cette animation révèle 13 jeux de données qui ont tous exactement les mêmes statistiques résumées - même moyenne, même écart-type, même corrélation - mais qui, lorsqu'ils sont visualisés, montrent des patterns complètement différents. L'un d'eux forme même un dinosaure ! Cela illustre parfaitement l'importance de toujours visualiser vos données.

### Diapositive 11 : "Grammaire des graphiques" - Concepts de base
Pour créer des visualisations efficaces, nous utilisons ce qu'on appelle la "grammaire des graphiques". Ce concept est basé sur le livre de Leland Wilkinson et est implémenté en R par le package ggplot2. Il y a deux concepts clés à comprendre. L'esthétique est une propriété visuelle d'un graphique, comme la position, la forme ou la couleur. Les données, quant à elles, correspondent à une colonne dans un jeu de données.

### Diapositive 12 : Associer les données aux esthétiques - Introduction
Maintenant, voyons comment nous associons les données aux esthétiques. Ici, nous avons des images de manchots de différentes espèces et un tableau de données montrant les différentes variables que nous avons mesurées. Nous allons maintenant apprendre à mapper ces données à des propriétés visuelles.

### Diapositive 13 : Associer les données aux esthétiques - Graphique
Voici le résultat : un nuage de points qui montre la longueur du bec en fonction de la masse corporelle. Nous utilisons des couleurs différentes pour chaque espèce, ce qui nous permet de visualiser facilement la relation entre ces variables pour chaque groupe.

### Diapositive 14 : Associer les données aux esthétiques - Tableau conceptuel
Décomposons ce graphique. La longueur du bec est associée à la position sur l'axe x, représentée par des points. La masse corporelle est associée à la position sur l'axe y, également représentée par des points. Et l'espèce est associée à la couleur des points.

### Diapositive 15 : Associer les données aux esthétiques - Tableau technique
En termes de code ggplot, bill_length_mm est mappé à x dans geom_point, body_mass_g est mappé à y dans geom_point, et species est mappé à colour dans geom_point.

### Diapositive 16 : ggplot() - Configuration de base
Voyons comment construire ce graphique étape par étape. D'abord, nous configurons les données et les esthétiques avec la fonction ggplot. Nous spécifions que nos données viennent de penguins, et nous mappons bill_length_mm à x, body_mass_g à y, et species à color. À ce stade, nous avons un canevas vide avec les axes définis, mais aucune donnée n'est encore affichée.

### Diapositive 17 : ggplot() - Ajout de geom
Ensuite, nous ajoutons un "geom" pour afficher les données. En ajoutant geom_point, nous indiquons à ggplot que nous voulons représenter nos données sous forme de points. Maintenant, notre nuage de points est visible avec des couleurs différentes pour chaque espèce.

### Diapositive 18 : ggplot() - Couleurs personnalisées manuelles
Nous pouvons personnaliser les couleurs en utilisant scale_colour_manual. Ici, nous spécifions des couleurs manuellement : vert foncé, bleu foncé et rouge foncé. Cela nous permet de choisir exactement les couleurs que nous voulons selon nos préférences ou les exigences de publication.

### Diapositive 19 : ggplot() - Palette viridis
Alternativement, nous pouvons utiliser des palettes de couleurs prédéfinies comme viridis. En ajoutant scale_color_viridis_d, nous utilisons une palette qui est accessible pour les personnes daltoniennes et optimisée pour la perception des couleurs.

### Diapositive 20 : ggplot() - Étiquettes
Il est important d'ajouter des étiquettes descriptives à nos graphiques. Avec la fonction labs, nous pouvons spécifier des étiquettes pour l'axe x, l'axe y et la légende. Ici, nous indiquons "Longueur du bec en millimètres", "Masse corporelle en grammes", et "Espèce" pour la légende. Cela améliore grandement la lisibilité du graphique.

### Diapositive 21 : ggplot() - Theme light
Nous pouvons changer le style général du graphique avec des thèmes. Le theme_light crée un fond clair avec des lignes de grille subtiles, donnant une apparence plus moderne et épurée.

### Diapositive 22 : ggplot() - Theme classic
Le theme_classic donne un style plus traditionnel sans grille de fond, avec seulement les axes. C'est souvent préféré pour les publications académiques.

### Diapositive 23 : ggplot() - Position de la légende
Nous pouvons également modifier la position de la légende. En ajoutant theme avec legend.position égal à "bottom", nous plaçons la légende en bas du graphique, ce qui peut optimiser l'utilisation de l'espace.

### Diapositive 24 : ggplot() - Ajout de forme
Nous pouvons ajouter une autre dimension à notre visualisation en utilisant des formes différentes pour chaque espèce, en plus des couleurs. Nous mappons species à la fois à colour et à shape dans nos esthétiques. Cela renforce la différenciation entre les groupes et rend le graphique plus accessible pour les personnes qui ont des difficultés à distinguer les couleurs.

### Diapositive 25 : Autres visualisations - Boxplot
Il existe de nombreux autres types de visualisations. Par exemple, un boxplot est excellent pour visualiser la distribution des données par groupe. Ici, nous mappons species à x, body_mass_g à y, et species à colour, en utilisant geom_boxplot. Le boxplot montre la médiane, les quartiles et les valeurs extrêmes.

### Diapositive 26 : Autres visualisations - Boxplot + Jitter
Nous pouvons combiner plusieurs types de graphiques. En ajoutant geom_jitter au boxplot, nous superposons les points de données brutes. Cela nous donne une meilleure compréhension de la distribution réelle des données, au-delà de ce que montre le résumé du boxplot.

### Diapositive 27 : Autres visualisations - Violin + Jitter
Une autre combinaison utile est le violin plot avec jitter. Le violin plot montre la densité de distribution de manière plus détaillée qu'un boxplot. Nous utilisons geom_jitter pour les points bruts et geom_violin avec une transparence de 0,5 pour la forme du violon. Notez l'utilisation de fill et color pour contrôler les esthétiques de remplissage et de contour.

### Diapositive 28 : Exemples - Histogramme
Lorsque nous avons uniquement des valeurs numériques et que nous voulons voir leur distribution, l'histogramme est très utile. Avec geom_histogram, nous spécifions seulement la variable x, et ggplot calcule automatiquement les fréquences pour l'axe y. Chaque barre représente le nombre d'observations dans un intervalle de valeurs.

### Diapositive 29 : Exemples - Densité
Une alternative à l'histogramme est la courbe de densité, créée avec geom_density. Elle montre une distribution continue et lissée des données, ce qui peut être plus facile à interpréter dans certains cas.

### Diapositive 30 : Exemples - Diagramme en barres
Pour les valeurs catégorielles, nous utilisons un diagramme en barres. Avec geom_bar et stat égal à "count", ggplot compte automatiquement le nombre d'occurrences de chaque catégorie. C'est parfait pour voir la fréquence de chaque espèce dans notre jeu de données.

### Diapositive 31 : Exemples - Barres avec moyenne
Lorsque nous combinons des valeurs numériques et catégorielles, nous pouvons créer un diagramme en barres qui montre la moyenne pour chaque groupe. Avec geom_bar, stat égal à "summary" et fun égal à "mean", nous obtenons la longueur moyenne de la nageoire pour chaque espèce.

### Diapositive 32 : Exemples - Points avec intervalle de confiance
Finalement, une excellente façon de combiner données brutes et résumé statistique est d'utiliser geom_jitter pour les points bruts avec une certaine transparence, et geom_pointrange pour montrer la moyenne plus ou moins l'écart-type. Nous utilisons stat égal à "summary" et fun.data égal à mean_sdl. L'alpha de 0,75 rend les points semi-transparents, ce qui aide à visualiser les chevauchements. Nous utilisons également une palette colorblind-friendly pour assurer l'accessibilité.

---

## Points en Français

### Diapositive 1 : Titre
- Titre : Visualisations
- Sous-titre : Lecture 2

### Diapositive 2 : Résumé du cours précédent
- Introduction à R
- Qu'est-ce que les objets et les fonctions ?
- Résumés de base des données
- Différents types de données

### Diapositive 3 : Données « tidy » - Variables et Valeurs
- Une **variable** est une quantité, une qualité ou une propriété que vous pouvez mesurer
- Exemple : Longueur de la nageoire
- Une **valeur** est l'état d'une variable lorsque vous la mesurez
- La valeur d'une variable peut changer d'une mesure à l'autre
- Exemple : longueur des nageoires du manchot 1 = 181 mm

### Diapositive 4 : Données « tidy » - Observations et Données tabulaires
- Une **observation** est un ensemble de mesures effectuées dans des conditions similaires
- Une observation contient plusieurs valeurs, chacune étant associée à une variable différente
- Exemple : une ligne dans les données des manchots pour la longueur du bec, la longueur de la nageoire, la masse corporelle, etc. d'un manchot
- Les **données tabulaires** sont un ensemble de valeurs, chacune étant associée à une variable et à une observation
- Les données tabulaires sont ordonnées si chaque valeur est placée dans sa propre « cellule », chaque variable dans sa propre colonne et chaque observation dans sa propre ligne

### Diapositive 5 : Données « tidy » - Les trois règles
- Chaque variable doit avoir sa propre colonne
- Chaque observation doit avoir sa propre ligne
- Chaque valeur doit avoir sa propre cellule

### Diapositive 6 : Fonctions R - Arguments nommés
- Les fonctions prennent des *arguments* en entrée
- Ils peuvent être nommés : `mean(x = penguins$bill_length_mm)`
- Ou non nommés : `mean(penguins$bill_length_mm)`

### Diapositive 7 : Fonctions R - Multiples arguments
- Certaines fonctions prennent plusieurs arguments : `seq(from = 1, to = 5)`
- L'ordre peut être modifié avec des arguments nommés : `seq(to = 5, from = 1)`
- Si non nommés, l'ordre par défaut est supposé : `seq(1, 5)`
- Mais maintenant, R comprend : Séquence de 5 à 1 : `seq(5, 1)`
- Utilisez des arguments nommés pour rendre le code plus clair

### Diapositive 8 : Fonctions R - Documentation
- Lire la documentation d'une fonction en exécutant `?function_name`
- Exemple : `?seq`

### Diapositive 9 : Pourquoi visualiser ? - Données brutes vs Résumé
- Comparaison entre données brutes et résumé statistique
- Les résumés peuvent masquer des patterns importants
- Moyenne de X, moyenne de Y, écart-type de X et Y, corrélation peuvent être identiques pour des données très différentes

### Diapositive 10 : Pourquoi visualiser ? - Le Datasaurus
- Animation du Datasaurus Dozen
- Montre 13 jeux de données avec des statistiques identiques mais des visualisations très différentes
- Importance de toujours visualiser vos données

### Diapositive 11 : "Grammaire des graphiques" - Concepts de base
- Basé sur le livre de Leland Wilkinson
- Package ggplot2 en R
- **Esthétique** : Propriété visuelle d'un graphique (position, forme, couleur, etc.)
- **Données** : Une colonne dans un jeu de données

### Diapositive 12 : Associer les données aux esthétiques - Introduction
- Images de manchots de différentes espèces
- Tableau de données des manchots montrant les variables mesurées
- Préparation pour mapper les données aux propriétés visuelles

### Diapositive 13 : Associer les données aux esthétiques - Graphique
- Nuage de points montrant longueur du bec vs masse corporelle
- Couleurs différentes pour chaque espèce
- Visualisation de la relation entre variables

### Diapositive 14 : Associer les données aux esthétiques - Tableau conceptuel
- Longueur du bec → Position (axe-x) → Point
- Masse corporelle → Position (axe-y) → Point
- Espèce → Couleur → Point

### Diapositive 15 : Associer les données aux esthétiques - Tableau technique
- `bill_length_mm` → `x` → `geom_point()`
- `body_mass_g` → `y` → `geom_point()`
- `species` → `colour` → `geom_point()`

### Diapositive 16 : ggplot() - Configuration de base
- Configurer les données et les esthétiques
- Code : `ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = body_mass_g, color = species))`
- Résultat : Canevas vide avec axes définis

### Diapositive 17 : ggplot() - Ajout de geom
- Ajouter "geom" pour afficher les données
- Code : Ajout de `+ geom_point()`
- Résultat : Nuage de points visible avec couleurs par espèce

### Diapositive 18 : ggplot() - Couleurs personnalisées manuelles
- Utiliser des couleurs personnalisées
- Code : `+ scale_colour_manual(values = c("darkgreen", "darkblue", "darkred"))`
- Personnalisation des couleurs selon vos préférences

### Diapositive 19 : ggplot() - Palette viridis
- Utiliser des palettes de couleurs prédéfinies
- Code : `+ scale_color_viridis_d()`
- Palette accessible et optimisée pour la perception des couleurs

### Diapositive 20 : ggplot() - Étiquettes
- Ajouter des étiquettes descriptives
- Code : `+ labs(x = "Longueur du bec (mm)", y = "Masse corporelle (g)", colour = "Espèce")`
- Améliore la lisibilité du graphique

### Diapositive 21 : ggplot() - Theme light
- Changer le style avec `theme_light()`
- Fond clair avec lignes de grille subtiles
- Apparence plus moderne et épurée

### Diapositive 22 : ggplot() - Theme classic
- Changer le style avec `theme_classic()`
- Style classique sans grille, uniquement axes
- Apparence académique traditionnelle

### Diapositive 23 : ggplot() - Position de la légende
- Modifier la position de la légende
- Code : `+ theme(legend.position = "bottom")`
- Optimisation de l'espace et de la mise en page

### Diapositive 24 : ggplot() - Ajout de forme (shape)
- `bill_length_mm` → `x` → `geom_point()`
- `body_mass_g` → `y` → `geom_point()`
- `species` → `colour` → `geom_point()`
- `species` → `shape` → `geom_point()`
- Combinaison de couleur et forme pour renforcer la différenciation

### Diapositive 25 : Autres visualisations - Boxplot
- `species` → `x` → `geom_boxplot()`
- `body_mass_g` → `y` → `geom_boxplot()`
- `species` → `colour` → `geom_boxplot()`
- Visualisation de la distribution des données par groupe

### Diapositive 26 : Autres visualisations - Boxplot + Jitter
- Combiner les graphiques avec `+ geom_jitter()`
- Ajoute les points de données brutes au boxplot
- Meilleure compréhension de la distribution réelle des données

### Diapositive 27 : Autres visualisations - Violin + Jitter
- Combiner violin plot et jitter
- Code : `geom_jitter() + geom_violin(alpha = .5)`
- Utilisation de `fill` et `color` pour les esthétiques
- Visualisation de la densité de distribution

### Diapositive 28 : Exemples - Histogramme
- Uniquement des valeurs numériques
- `geom_histogram()` pour la distribution d'une variable
- Axe x : Longueur du bec (mm)
- Axe y : Fréquence (calculée automatiquement)

### Diapositive 29 : Exemples - Densité
- Uniquement des valeurs numériques
- `geom_density()` pour une courbe de densité lissée
- Alternative à l'histogramme montrant la distribution continue

### Diapositive 30 : Exemples - Diagramme en barres
- Uniquement des valeurs catégorielles
- `geom_bar(stat = "count")` pour compter les occurrences
- Axe x : Espèce
- Axe y : Nombre (calculé automatiquement)

### Diapositive 31 : Exemples - Barres avec moyenne
- Valeurs numériques et catégorielles
- `geom_bar(stat = "summary", fun = "mean")` pour la moyenne par groupe
- Axe x : Espèce
- Axe y : Longueur de la nageoire (mm) - moyenne

### Diapositive 32 : Exemples - Points avec intervalle de confiance
- Valeurs numériques et catégorielles
- `geom_jitter()` pour les données brutes
- `geom_pointrange(stat = "summary", fun.data = mean_sdl)` pour moyenne ± écart-type
- Utilisation de `alpha = .75` pour transparence
- Palette colorblind-friendly
- Combinaison de données brutes et résumé statistique

---

## Bullet Points in English

### Slide 1: Title
- Title: Visualizations
- Subtitle: Lecture 2

### Slide 2: Summary of previous course
- Introduction to R
- What are objects and functions?
- Basic data summaries
- Different data types

### Slide 3: Tidy data - Variables and Values
- A **variable** is a quantity, quality, or property that you can measure
- Example: Flipper length
- A **value** is the state of a variable when you measure it
- The value of a variable can change from one measurement to another
- Example: penguin 1's flipper length = 181 mm

### Slide 4: Tidy data - Observations and Tabular data
- An **observation** is a set of measurements made under similar conditions
- An observation contains multiple values, each associated with a different variable
- Example: one row in the penguin data for beak length, flipper length, body mass, etc. of one penguin
- **Tabular data** is a set of values, each associated with a variable and an observation
- Tabular data is tidy if each value is placed in its own "cell", each variable in its own column, and each observation in its own row

### Slide 5: Tidy data - The three rules
- Each variable must have its own column
- Each observation must have its own row
- Each value must have its own cell

### Slide 6: R Functions - Named arguments
- Functions take *arguments* as input
- They can be named: `mean(x = penguins$bill_length_mm)`
- Or unnamed: `mean(penguins$bill_length_mm)`

### Slide 7: R Functions - Multiple arguments
- Some functions take multiple arguments: `seq(from = 1, to = 5)`
- Order can be changed with named arguments: `seq(to = 5, from = 1)`
- If unnamed, default order is assumed: `seq(1, 5)`
- But now, R understands: Sequence from 5 to 1: `seq(5, 1)`
- Use named arguments to make code clearer

### Slide 8: R Functions - Documentation
- Read the documentation of a function by running `?function_name`
- Example: `?seq`

### Slide 9: Why visualize? - Raw data vs Summary
- Comparison between raw data and statistical summary
- Summaries can hide important patterns
- Mean of X, mean of Y, standard deviation of X and Y, correlation can be identical for very different data

### Slide 10: Why visualize? - The Datasaurus
- Datasaurus Dozen animation
- Shows 13 datasets with identical statistics but very different visualizations
- Importance of always visualizing your data

### Slide 11: "Grammar of graphics" - Basic concepts
- Based on Leland Wilkinson's book
- ggplot2 package in R
- **Aesthetic**: Visual property of a plot (position, shape, color, etc.)
- **Data**: A column in a dataset

### Slide 12: Mapping data to aesthetics - Introduction
- Images of penguins from different species
- Penguin data table showing measured variables
- Preparation for mapping data to visual properties

### Slide 13: Mapping data to aesthetics - Plot
- Scatter plot showing beak length vs body mass
- Different colors for each species
- Visualization of relationship between variables

### Slide 14: Mapping data to aesthetics - Conceptual table
- Beak length → Position (x-axis) → Point
- Body mass → Position (y-axis) → Point
- Species → Color → Point

### Slide 15: Mapping data to aesthetics - Technical table
- `bill_length_mm` → `x` → `geom_point()`
- `body_mass_g` → `y` → `geom_point()`
- `species` → `colour` → `geom_point()`

### Slide 16: ggplot() - Basic setup
- Set up data and aesthetics
- Code: `ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = body_mass_g, color = species))`
- Result: Empty canvas with defined axes

### Slide 17: ggplot() - Adding geom
- Add "geom" to display the data
- Code: Adding `+ geom_point()`
- Result: Visible scatter plot with colors by species

### Slide 18: ggplot() - Manual custom colors
- Use custom colors
- Code: `+ scale_colour_manual(values = c("darkgreen", "darkblue", "darkred"))`
- Customization of colors according to your preferences

### Slide 19: ggplot() - Viridis palette
- Use predefined color palettes
- Code: `+ scale_color_viridis_d()`
- Accessible palette optimized for color perception

### Slide 20: ggplot() - Labels
- Add descriptive labels
- Code: `+ labs(x = "Beak length (mm)", y = "Body mass (g)", colour = "Species")`
- Improves plot readability

### Slide 21: ggplot() - Theme light
- Change style with `theme_light()`
- Light background with subtle grid lines
- More modern and clean appearance

### Slide 22: ggplot() - Theme classic
- Change style with `theme_classic()`
- Classic style without grid, only axes
- Traditional academic appearance

### Slide 23: ggplot() - Legend position
- Modify legend position
- Code: `+ theme(legend.position = "bottom")`
- Optimization of space and layout

### Slide 24: ggplot() - Adding shape
- `bill_length_mm` → `x` → `geom_point()`
- `body_mass_g` → `y` → `geom_point()`
- `species` → `colour` → `geom_point()`
- `species` → `shape` → `geom_point()`
- Combination of color and shape to reinforce differentiation

### Slide 25: Other visualizations - Boxplot
- `species` → `x` → `geom_boxplot()`
- `body_mass_g` → `y` → `geom_boxplot()`
- `species` → `colour` → `geom_boxplot()`
- Visualization of data distribution by group

### Slide 26: Other visualizations - Boxplot + Jitter
- Combine plots with `+ geom_jitter()`
- Adds raw data points to boxplot
- Better understanding of actual data distribution

### Slide 27: Other visualizations - Violin + Jitter
- Combine violin plot and jitter
- Code: `geom_jitter() + geom_violin(alpha = .5)`
- Use of `fill` and `color` for aesthetics
- Visualization of distribution density

### Slide 28: Examples - Histogram
- Only numerical values
- `geom_histogram()` for distribution of one variable
- X-axis: Beak length (mm)
- Y-axis: Frequency (calculated automatically)

### Slide 29: Examples - Density
- Only numerical values
- `geom_density()` for smoothed density curve
- Alternative to histogram showing continuous distribution

### Slide 30: Examples - Bar chart
- Only categorical values
- `geom_bar(stat = "count")` to count occurrences
- X-axis: Species
- Y-axis: Count (calculated automatically)

### Slide 31: Examples - Bars with mean
- Numerical and categorical values
- `geom_bar(stat = "summary", fun = "mean")` for mean by group
- X-axis: Species
- Y-axis: Flipper length (mm) - mean

### Slide 32: Examples - Points with confidence interval
- Numerical and categorical values
- `geom_jitter()` for raw data
- `geom_pointrange(stat = "summary", fun.data = mean_sdl)` for mean ± standard deviation
- Use of `alpha = .75` for transparency
- Colorblind-friendly palette
- Combination of raw data and statistical summary
