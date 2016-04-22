library(ggplot2)
source("/Users/udayangawickramasinghe/Install/RPlots/util.R")
source("/Users/udayangawickramasinghe/Install/RPlots/gplottempl.R")

############### PARAMS##############
Titl="Scaling Performance for Lullesh on `Cutter`"
X_LABEL="cores (count)"
Y_LABEL="time (s)"
SERIES_COLORS=c("black","black")
SERIES_FILL_COLORS=c("white","black")
SERIES_MARKERS=c(24,21)
LEGEND_POS=c(0.2,0.8)
CHART_PROPS=list()  #title font sz,


############### DATA ###############
tg <- ToothGrowth
head(tg)

########### PRE-PROCESS ############
dataset <- summarySE(tg, measurevar="len", groupvars=c("supp","dose"))
dataset
dataset["len"]

############### PLOT ###############
# myplot1(dataset, "dose", "len", "supp")
#standard error
myplot2(dataset, "dose", "len", "supp", "se")
#confidence interval 95%
#myplot2(dataset, "dose", "len", "supp", "ci")


