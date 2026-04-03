#######    Global Ecology and Biogeography     ######

#######   Shining a light on daytime coral     ######
#######   spawning synchrony across oceans     ######

#######    Moritz C, et al. 2025               ######
#######    DOI: 10.1111/geb.70072              ######

#### Script using SEANOE data DOI 10.17882/105886 ####
### Produced by Charlotte Moritz CMOANA Consulting ###

setwd("")


library(ggplot2)
library(ggbreak)
library(gridExtra)
library(dplyr)
library(vegan)
library(lme4)
library(lmerTest)
library(afex)


### Load data
data.spawn <- read.table(
	here("lectures/07/Porites_rus_spawning/data/SEANOE_SiteSpawning_Moritz.csv"),
	sep = ";",
	dec = ".",
	header = T,
	stringsAsFactors = T
)
dim(data.spawn)

# Months as factors
data.spawn$month <- as.factor(as.character(data.spawn$month))

# Remove Teva i Uta : unclear information...
data.spawn <- subset(data.spawn, site != "AME Teva i uta")

### Number of sites per island
nb.site <- data.spawn %>% group_by(island) %>% distinct(site) %>% count()


### Percentage of sites with spawning per island

# replace T by 1

data.spawn$no.start <- as.numeric(data.spawn$no.start)

# and inverse
data.spawn <- data.spawn %>%
	mutate(no.start = ifelse(no.start == 1, 0, 1))


myfun <- function(x) sum(x) * 100 / length(x)
percent.spawn <- aggregate(
	data.spawn$no.start,
	list(data.spawn$island),
	FUN = myfun
)
names(percent.spawn) <- c("island", "percent.spawn")

# Percent not spawn
groups <- c(rep("yes", 16), rep("no", 16))

percent.total <- data.frame(
	rep(percent.spawn[, 1], 2),
	c(percent.spawn[, 2], 100 - percent.spawn[, 2]),
	groups
)
names(percent.total) <- c("island", "percent.spawn", "group")

# Plot percent
ggplot(percent.total, aes(x = island, y = percent.spawn, fill = groups)) +
	geom_bar(stat = "identity") +
	scale_fill_manual(values = c("grey", "grey20")) +
	labs(y = "% spawning (all sites, all years)") +
	theme_test() +
	theme(
		legend.position = "none",
		axis.title.x = element_blank(),
		axis.text.x = element_text(angle = 90, vjust = 0.2, hjust = 1),
		axis.title.y = element_text(size = 9)
	)


### Analysis with observations TRUE only (exact and approximative time)

# Remove data with no spawning
dt <- subset(data.spawn, no.start == "1")

# Separate data between lagoon and outerslope
dt.lag <- subset(dt, habitat == "Lagoon")
dt.ch <- rbind(
	subset(dt, habitat == "Channel"),
	subset(dt, habitat == "Inner slope")
)
dt.os <- subset(dt, habitat == "Outer slope")

# Droplevels
dt.lag <- droplevels(dt.lag)
dt.ch <- droplevels(dt.ch)
dt.os <- droplevels(dt.os)

# Check time mean etc for lagoon and outerslope
summary(dt.lag)
summary(dt.ch)
summary(dt.os)

# Boxplot exact and approximative time together
boxplot(
	dt.lag$start.decimal,
	dt.ch$start.decimal,
	dt.os$start.decimal,
	names = c("Lagoon", "Channel", "Outer slope"),
	cex.axis = 1.2,
	las = 1
)
mtext("Spawning start time (decimal)", side = 2, line = 2.2, cex = 1.2)

boxplot(
	dt.lag$STrSR,
	dt.ch$STrSR,
	dt.os$STrSR,
	names = c("Lagoon", "Channel", "Outer slope"),
	cex.axis = 1.2,
	las = 1
)
mtext(
	"Spawning start time after sunrise (decimal)",
	side = 2,
	line = 1.9,
	cex = 1.2
)

summary(aov(start.decimal ~ habitat, dt)) # heures significativement diff entres habitats
pairwise.t.test(dt$start.decimal, dt$habitat, p.adjust.method = "bonferroni") # post-hoc test
summary(aov(STrSR ~ habitat, dt)) # heures after sunrise significativement diff entres habitats
pairwise.t.test(dt$STrSR, dt$habitat, p.adjust.method = "bonferroni") # post-hoc test


# Mean sd time start in lagoon per island for EXACT time only
dt.lag.xt <- subset(dt.lag, quality.start == "Exact")
dt.ch.xt <- subset(dt.ch, quality.start == "Exact")
dt.os.xt <- subset(dt.os, quality.start == "Exact")

dt.isl.mean <- aggregate(dt.lag.xt$start.decimal, list(dt.lag.xt$island), mean)
dt.isl.sd <- aggregate(dt.lag.xt$start.decimal, list(dt.lag.xt$island), sd)
dt.isl <- cbind(dt.isl.mean, dt.isl.sd$x)
names(dt.isl) <- c("island", "mean", "sd")

dt.isl.tot.mean <- aggregate(dt.lag$start.decimal, list(dt.lag$island), mean)
dt.isl.tot.sd <- aggregate(dt.lag$start.decimal, list(dt.lag$island), sd)
# Count number of sites to do the mean per island
dt.isl.tot.nb <- aggregate(dt.lag$start.decimal, list(dt.lag$island), length)
dt.isl.tot <- cbind(dt.isl.tot.mean, dt.isl.tot.sd$x, dt.isl.tot.nb$x)
names(dt.isl.tot) <- c("island", "mean", "sd", "nb.site")

# Save table for mapping (article)
#write.table(dt.isl.tot,"WorldMapData.csv",sep=";",dec=".",row.names=F)

# Plot mean sd in lagoon only

ggplot(dt.isl, aes(x = island, y = mean)) +
	geom_point(stat = "identity", colour = "black") +
	geom_hline(yintercept = mean(dt.isl$mean), colour = "grey60") +
	geom_hline(yintercept = mean(dt.isl.tot$mean), colour = alpha("red", 0.3)) +
	geom_errorbar(aes(ymin = mean - sd, ymax = mean + sd), width = .2) +
	geom_point(data = dt.isl.tot, colour = "red", alpha = 0.3) +
	#geom_errorbar(aes(ymin=dt.isl.tot$mean-dt.isl.tot$sd,ymax=dt.isl.tot$mean+dt.isl.tot$sd),width=.2,alpha=0.4,color="red")+
	labs(y = "Spawning start time (decimal)") +
	scale_y_continuous(limits = c(6.5, 8)) +
	annotate("text", x = 1.4, y = 7.95, label = "All", colour = "red") +
	annotate("text", x = 1.9, y = 7.78, label = "Exact", colour = "black") +
	theme_test() +
	theme(
		axis.title.x = element_blank(),
		axis.text.x = element_text(angle = 90, vjust = 0.2, hjust = 1),
		axis.title.y = element_text(size = 10)
	)


### Time to sunrise in lagoon

dt.tsr.mean <- aggregate(dt.lag.xt$STrSR, list(dt.lag.xt$island), mean)
dt.tsr.sd <- aggregate(dt.lag.xt$STrSR, list(dt.lag.xt$island), sd)
dt.tsr <- cbind(dt.tsr.mean, dt.tsr.sd$x)
names(dt.tsr) <- c("island", "mean", "sd")

dt.tsr.tot.mean <- aggregate(dt.lag$STrSR, list(dt.lag$island), mean)
dt.tsr.tot.sd <- aggregate(dt.lag$STrSR, list(dt.lag$island), sd)
dt.tsr.tot <- cbind(dt.tsr.tot.mean, dt.tsr.tot.sd$x)
names(dt.tsr.tot) <- c("island", "mean", "sd")

# Plot mean sd

fig1.1 <- ggplot(dt.tsr, aes(x = island, y = mean)) +
	geom_hline(
		yintercept = mean(dt.lag.xt$STrSR),
		colour = "royalblue3",
		size = 1.2
	) +
	geom_hline(
		yintercept = mean(dt.lag$STrSR),
		colour = alpha("seagreen3", 0.6),
		size = 1.2
	) +
	geom_errorbar(
		aes(ymin = mean - sd, ymax = mean + sd),
		width = .2,
		colour = "royalblue3"
	) +
	geom_point(stat = "identity", colour = "royalblue3", shape = 18, size = 4) +
	geom_point(
		data = dt.tsr.tot,
		colour = "seagreen3",
		alpha = 0.6,
		shape = 23,
		stroke = 2,
		size = 3
	) +
	#geom_errorbar(aes(ymin=dt.tsr.tot$mean-dt.tsr.tot$sd,ymax=dt.tsr.tot$mean+dt.tsr.tot$sd),width=.2,alpha=0.4,color="red")+
	labs(y = "Decimal spawning\nstart time after sunrise (h)") +
	scale_y_continuous(limits = c(1, 3)) +
	annotate(
		"text",
		x = 2.6,
		y = 2.9,
		label = "All data",
		colour = "seagreen3",
		fontface = "bold"
	) +
	annotate(
		"text",
		x = 3.3,
		y = 2.65,
		label = "Exact data",
		colour = "royalblue3",
		fontface = "bold"
	) +
	geom_text(x = -2.5, y = 3, label = "b", fontface = "bold") +
	coord_cartesian(clip = "off") +
	theme_test() +
	theme(
		axis.title.x = element_blank(),
		axis.text.x = element_text(angle = 90, vjust = 0.2, hjust = 1),
		axis.title.y = element_text(size = 10)
	)

grid.arrange(fig1.1, fig1.2, fig1.3, ncol = 3)

### Time to moonrise in lagoon

dt.tmr.mean <- aggregate(
	dt.lag.xt$STrMR,
	list(dt.lag.xt$island),
	mean,
	na.rm = T
)
dt.tmr.sd <- aggregate(dt.lag.xt$STrMR, list(dt.lag.xt$island), sd, na.rm = T)
dt.tmr <- cbind(dt.tmr.mean, dt.tmr.sd$x)
names(dt.tmr) <- c("island", "mean", "sd")

dt.tmr.tot.mean <- aggregate(dt.lag$STrMR, list(dt.lag$island), mean, na.rm = T)
dt.tmr.tot.sd <- aggregate(dt.lag$STrMR, list(dt.lag$island), sd, na.rm = T)
dt.tmr.tot <- cbind(dt.tmr.tot.mean, dt.tmr.tot.sd$x)
names(dt.tmr.tot) <- c("island", "mean", "sd")

# Plot mean sd

ggplot(dt.tmr, aes(x = island, y = mean)) +
	geom_point(stat = "identity", colour = "black") +
	geom_hline(yintercept = mean(dt.tmr$mean), colour = "grey60") +
	geom_hline(yintercept = mean(dt.tmr.tot$mean), colour = alpha("red", 0.3)) +
	geom_errorbar(aes(ymin = mean - sd, ymax = mean + sd), width = .2) +
	geom_point(data = dt.tmr.tot, colour = "red", alpha = 0.4) +
	#geom_errorbar(aes(ymin=dt.tmr.tot$mean-dt.tmr.tot$sd, ymax=dt.tmr.tot$mean+dt.tmr.tot$sd),width=.2,alpha=0.4,color="red")+
	labs(y = "Spawning time after\nmoonrise (decimal)") +
	scale_y_continuous(limits = c(7.5, 10.5)) +
	annotate("text", x = 13.9, y = 10.4, label = "All", colour = "red") +
	annotate("text", x = 14.4, y = 10.1, label = "Exact", colour = "black") +
	theme_test() +
	theme(
		axis.title.x = element_blank(),
		axis.text.x = element_text(angle = 90, vjust = 0.2, hjust = 1),
		axis.title.y = element_text(size = 10)
	)


### Check relatinship between time of moorise / sunrise and spawning EXACT time

# Time of sunrise
summary(lm(dt.lag.xt$start.decimal ~ dt.lag.xt$ToSR.decimal)) # ***
summary(lm(dt.ch.xt$start.decimal ~ dt.ch.xt$ToSR.decimal)) # NA : une seule valeur
summary(lm(dt.os.xt$start.decimal ~ dt.os.xt$ToSR.decimal)) # n.s.
summary(lm(
	c(dt.os.xt$start.decimal, dt.ch.xt$start.decimal) ~ c(
		dt.os.xt$ToSR.decimal,
		dt.ch.xt$ToSR.decimal
	)
)) # . presque * !

# Plot lagon - outer slope

#plot(dt.lag.xt$start.decimal,dt.lag.xt$ToSR.decimal,pch=18,col="grey40",xlim=c(6.5,12),xlab="Exact spawning start time (decimal)",ylab="Time of sunrise (decimal)",cex=2,cex.lab=1.5)
#points(dt.os.xt$start.decimal,dt.os.xt$ToSR.decimal,col="red",pch=18,cex=2)
#points(dt.ch.xt$start.decimal,dt.ch.xt$ToSR.decimal,col="blue",pch=18,cex=2)
#abline(lm(dt.lag.xt$ToSR.decimal~dt.lag.xt$start.decimal),col="grey30",lwd=2)
#abline(lm(c(dt.os.xt$ToSR.decimal,dt.ch.xt$ToSR.decimal)~c(dt.os.xt$start.decimal,dt.ch.xt$start.decimal)),col="red",lwd=2)
#legend(11,5.5,c("Lagoon","Channel","Outer slope"),col=c("grey40","blue","red"),pch=18,bty="n",cex=1.5)

#par(mfrow=c(2,1))
plot(
	dt.lag.xt$ToSR.decimal,
	dt.lag.xt$start.decimal,
	pch = 18,
	col = "grey40",
	xlim = c(5, 6.5),
	ylim = c(6.5, 12),
	ylab = "Exact spawning start time (decimal)",
	xlab = "Time of sunrise (decimal)",
	cex = 2,
	cex.lab = 1.5,
	las = 1
)
points(
	dt.os.xt$ToSR.decimal,
	dt.os.xt$start.decimal,
	col = "red",
	pch = 18,
	cex = 2
)
points(
	dt.ch.xt$ToSR.decimal,
	dt.ch.xt$start.decimal,
	col = "blue",
	pch = 18,
	cex = 2
)
abline(
	lm(dt.lag.xt$start.decimal ~ dt.lag.xt$ToSR.decimal),
	col = "grey30",
	lwd = 2
)
abline(
	lm(
		c(dt.os.xt$start.decimal, dt.ch.xt$start.decimal) ~ c(
			dt.os.xt$ToSR.decimal,
			dt.ch.xt$ToSR.decimal
		)
	),
	col = "red",
	lwd = 2
)
abline(
	lm(
		c(dt.os.xt$start.decimal, dt.ch.xt$start.decimal) ~ c(
			dt.os.xt$ToSR.decimal,
			dt.ch.xt$ToSR.decimal
		)
	),
	col = "blue",
	lwd = 2,
	lty = 2
)
legend(
	5.15,
	12.2,
	c("Lagoon", "Channel", "Outer slope"),
	col = c("grey40", "blue", "red"),
	pch = 18,
	bty = "n",
	cex = 1.5
)


fig2.1 <- ggplot(dt.lag.xt, aes(x = ToSR.decimal, y = start.decimal)) +
	geom_smooth(
		method = "lm",
		fullrange = T,
		colour = "royalblue3",
		size = 1.2,
		fill = "white"
	) +
	geom_point(stat = "identity", colour = "royalblue3", shape = 18, size = 4) +
	geom_smooth(
		data = data.frame(dt.os.xt, dt.ch.xt),
		aes(x = ToSR.decimal, y = start.decimal),
		method = "lm",
		fullrange = T,
		colour = "salmon",
		size = 1.2,
		fill = "white"
	) +
	geom_point(
		data = dt.os.xt,
		aes(x = ToSR.decimal, y = start.decimal),
		colour = "salmon",
		shape = 18,
		size = 4
	) +
	geom_point(
		data = dt.ch.xt,
		aes(x = ToSR.decimal, y = start.decimal),
		colour = "salmon",
		shape = 23,
		stroke = 2,
		size = 2
	) +
	scale_y_continuous(limits = c(6, 12)) +
	labs(
		y = "\nExact decimal\nspawning start time",
		x = "Decimal time of sunrise"
	) +
	annotate(
		"text",
		x = 5.35,
		y = 6.2,
		label = "Shallow lagoon",
		colour = "royalblue3",
		fontface = "bold"
	) +
	annotate(
		"text",
		x = 5.4,
		y = 11.9,
		label = "Channel",
		colour = "salmon",
		fontface = "bold"
	) +
	annotate(
		"text",
		x = 5.3,
		y = 9.7,
		label = "Outer slope",
		colour = "salmon",
		fontface = "bold"
	) +
	geom_segment(
		aes(x = 5.4, y = 11.7, xend = 5.5, yend = 10.7),
		colour = "salmon",
		size = 0.6
	) +
	annotate(
		"text",
		x = 6.1,
		y = 6.85,
		label = bquote(
			{
				italic(R)^2
			} ==
				0.47
		),
		colour = "royalblue3",
		fontface = "bold"
	) +
	annotate(
		"text",
		x = 6.1,
		y = 6.3,
		label = bquote(
			{
				italic(p)
			} <
				0.001
		),
		colour = "royalblue3",
		fontface = "bold"
	) +
	annotate(
		"text",
		x = 6.1,
		y = 11.85,
		label = bquote(
			{
				italic(R)^2
			} ==
				0.42
		),
		colour = "salmon",
		fontface = "bold"
	) +
	annotate(
		"text",
		x = 6.1,
		y = 11.3,
		label = bquote(
			{
				italic(p)
			} ==
				0.058
		),
		colour = "salmon",
		fontface = "bold"
	) +
	geom_text(x = 4.8, y = 12, label = "a", size = 5.5, fontface = "bold") +
	coord_cartesian(clip = "off") +
	theme_test() +
	theme(
		axis.title.x = element_text(size = 11),
		axis.title.y = element_text(size = 11)
	)

grid.arrange(fig2.1, fig2.2, ncol = 2)

mean(rbind(dt.ch.xt$start.decimal, dt.os.xt$start.decimal)) -
	mean(dt.lag.xt$start.decimal)


# Time of moonrise
summary(lm(dt.lag.xt$start.decimal ~ dt.lag.xt$ToMR.decimal)) # n.s.
summary(lm(dt.ch.xt$start.decimal ~ dt.ch.xt$ToMR.decimal)) # NA : une seule valeur
summary(lm(dt.os.xt$start.decimal ~ dt.os.xt$ToMR.decimal)) # n.s.
summary(lm(
	c(dt.os.xt$start.decimal, dt.ch.xt$start.decimal) ~ c(
		dt.os.xt$ToMR.decimal,
		dt.ch.xt$ToMR.decimal
	)
)) # n.s.


plot(
	dt.lag.xt$ToMR.decimal,
	dt.lag.xt$start.decimal,
	pch = 18,
	col = "grey40",
	ylim = c(6.5, 12),
	ylab = "Exact spawning start time (decimal)",
	xlab = "Time of moonrise (decimal, day-1)",
	cex = 2,
	cex.lab = 1.5
)
points(
	dt.os.xt$ToMR.decimal,
	dt.os.xt$start.decimal,
	col = "red",
	pch = 18,
	cex = 2
)
points(
	dt.ch.xt$ToMR.decimal,
	dt.ch.xt$start.decimal,
	col = "blue",
	pch = 18,
	cex = 2
)
abline(
	lm(dt.lag.xt$start.decimal ~ dt.lag.xt$ToMR.decimal),
	col = "grey30",
	lwd = 2
)
abline(
	lm(
		c(dt.os.xt$start.decimal, dt.ch.xt$start.decimal) ~ c(
			dt.os.xt$ToMR.decimal,
			dt.ch.xt$ToMR.decimal
		)
	),
	col = "red",
	lwd = 2
)
abline(
	lm(
		c(dt.os.xt$start.decimal, dt.ch.xt$start.decimal) ~ c(
			dt.os.xt$ToMR.decimal,
			dt.ch.xt$ToMR.decimal
		)
	),
	col = "blue",
	lwd = 2,
	lty = 2
)
legend(
	20.15,
	12.2,
	c("Lagoon", "Channel", "Outer slope"),
	col = c("grey40", "blue", "red"),
	pch = 18,
	bty = "n",
	cex = 1.5
)


### Spawning time temporel (month, year) lagon - os, EXACT time

# Reorder months (october to april)
dt.lag.xt$month <- factor(
	dt.lag.xt$month,
	c("10", "11", "12", "1", "2", "3", "4")
)
dt.os.xt$month <- factor(
	dt.os.xt$month,
	c("10", "11", "12", "1", "2", "3", "4")
)
levels(dt.lag.xt$month) <- c(
	"October",
	"November",
	"December",
	"January",
	"February",
	"March",
	"April"
)

# Boxplot spawning sunrise moonrise
ggplot(dt.lag.xt, aes(month, start.decimal)) +
	geom_boxplot() +
	geom_boxplot(
		aes(dt.lag.xt$month, dt.lag.xt$ToSR.decimal),
		colour = "red",
		alpha = 0.4
	) +
	geom_boxplot(
		aes(dt.lag.xt$month, dt.lag.xt$ToMR.decimal),
		colour = "blue",
		alpha = 0.4
	) +
	labs(y = "Decimal time") +
	annotate("text", 6.3, 8.4, label = "Spawning", color = "black", size = 2.7) +
	annotate("text", 6.5, 5.5, label = "Sunrise", color = "red", size = 2.7) +
	annotate("text", 6.4, 23.2, label = "Moonrise", color = "blue", size = 2.7) +
	scale_y_break(c(8.5, 20), scales = 1) +
	theme_test() +
	theme(
		axis.title.x = element_blank(),
		axis.text.x = element_text(angle = 90, vjust = 0.2, hjust = 1),
		axis.title.y = element_text(size = 10)
	)


# By season
ggplot(dt.lag.xt, aes(season, start.decimal)) +
	geom_boxplot() +
	geom_boxplot(
		aes(dt.lag.xt$season, dt.lag.xt$ToSR.decimal),
		colour = "red",
		alpha = 0.4
	) +
	geom_boxplot(
		aes(dt.lag.xt$season, dt.lag.xt$ToMR.decimal),
		colour = "blue",
		alpha = 0.4
	) +
	labs(y = "Decimal time") +
	annotate("text", 1.25, 8.4, label = "Spawning", color = "black", size = 2.7) +
	annotate("text", 1.15, 6.2, label = "Sunrise", color = "red", size = 2.7) +
	annotate("text", 1.2, 20.1, label = "Moonrise", color = "blue", size = 2.7) +
	scale_y_break(c(8.5, 20), scales = 1) +
	theme_test() +
	theme(
		axis.title.x = element_blank(),
		axis.text.x = element_text(angle = 90, vjust = 0.2, hjust = 1),
		axis.title.y = element_text(size = 10)
	)


# Start spawning function of season
summary(aov(dt.lag.xt$start.decimal ~ dt.lag.xt$season)) # *** diff among seasons : mais �chantill. d�s�quilibr�
summary(lmer(
	start.decimal ~ season + (1 | factor(dt.lag.xt$month)),
	data = dt.lag.xt
)) # prend en compte les mois (compare les saisons mois par mois)
anova(lmer(
	start.decimal ~ season + (1 | factor(dt.lag.xt$month)),
	data = dt.lag.xt
)) # * l�g�re diff entre saisons

# Start spawning function of months
summary(aov(dt.lag.xt$start.decimal ~ dt.lag.xt$month)) # *** diff among months
summary(lmer(
	start.decimal ~ month + (1 | factor(dt.lag.xt$season)),
	data = dt.lag.xt
)) # prend en compte les mois (compare les saisons mois par mois)
anova(lmer(
	start.decimal ~ month + (1 | factor(dt.lag.xt$season)),
	data = dt.lag.xt
)) # *** diff entre mois

# Start time after sunrise function of season
summary(aov(dt.lag.xt$STrSR ~ dt.lag.xt$season)) # ** diff among seasons : mais �chantill. d�s�quilibr�
g <- aggregate(dt.lag.xt$STrSR, list(dt.lag.xt$month, dt.lag.xt$season), mean)
summary(aov(x ~ Group.2, data = g[-1, ])) # ns : anova on mean STrSR per month : balanced design, remove 2019-2020
summary(lmer(STrSR ~ season + (1 | factor(dt.lag.xt$month)), data = dt.lag.xt)) # prend en compte les mois (compare les saisons mois par mois)
anova(lmer(STrSR ~ season + (1 | factor(dt.lag.xt$month)), data = dt.lag.xt)) # ** l�g�re diff entre saisons
shapiro.test(dt.lag.xt$STrSR[dt.lag.xt$season %in% "2022-2023"])
summary(aov(
	STrSR ~ factor(season) + Error(factor(month)),
	data = dt.lag.xt[dt.lag.xt$season != "2019-2020", ]
))
ggplot(dt.lag.xt, aes(season, STrSR)) +
	geom_boxplot()

# Start time after sunrise function of months
summary(aov(dt.lag.xt$STrSR ~ dt.lag.xt$month)) # *** diff among months
summary(lmer(STrSR ~ month + (1 | factor(dt.lag.xt$season)), data = dt.lag.xt)) # prend en compte les mois (compare les saisons mois par mois)
anova(lmer(STrSR ~ month + (1 | factor(dt.lag.xt$season)), data = dt.lag.xt)) # *** diff entre mois


# ToSR function of season
summary(aov(dt.lag.xt$ToSR.decimal ~ dt.lag.xt$season)) # * diff among seasons (years) # ne veut rien dire : le lever de soleil ne change pas entre ann�es : �chantillonnage d�s�quilibr� entre les mois
summary(lmer(
	ToSR.decimal ~ season + (1 | factor(dt.lag.xt$month)),
	data = dt.lag.xt
)) # prend en compte les mois (compare les saisons mois par mois)
anova(lmer(
	ToSR.decimal ~ season + (1 | factor(dt.lag.xt$month)),
	data = dt.lag.xt
)) # effectivement, pas de diff entre saisons

# ToSR function of months
summary(aov(dt.lag.xt$ToSR.decimal ~ dt.lag.xt$month)) # *** diff among months
summary(lmer(
	ToSR.decimal ~ month + (1 | factor(dt.lag.xt$season)),
	data = dt.lag.xt
)) # prend en compte les saisons (compare les mois saison par saison)
anova(lmer(
	ToSR.decimal ~ month + (1 | factor(dt.lag.xt$season)),
	data = dt.lag.xt
)) # *** diff entre les mois (compare les mois saison par saison)

#
summary(aov(dt.lag.xt$ToMR.decimal ~ dt.lag.xt$season)) # *** diff among seasons (years)
summary(aov(dt.lag.xt$ToMR.decimal ~ dt.lag.xt$month)) # no diff among months


### GLM !!! �chantillonnage d�s�quilibr�... mois mieux �chantillonn�s que d'autres
glm.lag <- glm(
	start.decimal ~ island +
		site +
		depth +
		latitude +
		longitude +
		month +
		season +
		ToSR.decimal,
	data = dt.lag.xt,
	family = gaussian
)


# Boxplots temporal only in Tahiti Vairao 1
ggplot(subset(dt.lag.xt, dt.lag.xt$site == "Vairao 1"), aes(month, STrSR)) +
	geom_boxplot()
ggplot(subset(dt.lag.xt, dt.lag.xt$site == "Vairao 1"), aes(season, STrSR)) +
	geom_boxplot()


##### Colony type : laminar, massive, encrusting

### The astrology of a daytime-spawning coral

# Temperature has a strong influence on coral gametogenic and spawning cycles : add temperature?
# For instance : add mean SST and SD and show that it does not affect spawning time and synchrony

# For example, a team led by Oren Levy of the Weizmann Institute of Science in Israel
#reported on the presence of blue light sensing �cryptochromes� in the coral Acropora millepora and hinted at
#their potential role in spawning (Levy et al., 2007).

# We accordingly found that sea surface temperature and wind speed within one to two months prior to the
#full moon of the spawning month were strongly correlated with spawning day deviations.
# SST [10], solar insolation [7,8], wind speed [9,10] and rate of precipitation [6] (electronic supplementary material, table S3).
#The change in SST between days (?SST) was also used as a variable, as a previous study has reported that the rate of ?SST is highly
#correlated with the spawning month [10]. In total, we used five variables in our model. Daily SST (�C) values were obtained from
#NOAA High-resolution Blended Analysis at a 0.25� spatial resolution [17]. The global daily 1� � 1� gridded Adjusted All-Sky Surface
#Spectral Shortwave Down Flux (hereafter, simply referred to as �solar flux�) data were obtained from NASA's Clouds and the Earth's
#Radiant Energy System Synoptic (CERES-SYN1 deg) Edition 4A, used as a measure of solar insolation. Solar fluxes (W m-2) are surface
#solar irradiances in the shortwave region (wavelength between 0.1754 and 4 �m) [18]. The daily means of 10 m above surface wind speed
#(m s-1) and rate of precipitation (mm h-1) at a 0.25� spatial resolution were derived from the Tropical Rainfall Measuring Mission's
#(TRMM) Microwave Imager (TMI) by the NASA Earth Sciences Program and were recorded using Remote Sensing Systems.
#Monthly means of parameters (SST, ?SST, solar flux, wind speed and rate of precipitation) were standardized to Z-score values (a mean
# of zero and a standard deviation of one) for each time range.

### LM spawning time and depth
plot(dt.lag.xt$depth, dt.lag.xt$start.decimal)
summary(lm(dt.lag.xt$start.decimal ~ dt.lag.xt$depth)) # n.s.

### LM spawning time and latitude
plot(dt.lag.xt$latitude, dt.lag.xt$start.decimal)
summary(lm(dt.lag.xt$start.decimal ~ dt.lag.xt$latitude)) # n.s.

### LM spawning time and longitude
plot(dt.lag.xt$longitude, dt.lag.xt$start.decimal)
summary(lm(dt.lag.xt$start.decimal ~ dt.lag.xt$longitude)) # n.s.

# Pas d'effet de la profondeur ni latitude ni longitude
# Par contre, v�rifier l'effet du changement de temp�rature lors des semaines / mois pr�c�dant la ponte
