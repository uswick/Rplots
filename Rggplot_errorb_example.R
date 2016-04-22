library(ggplot2)
source("/Users/udayangawickramasinghe/Install/RPlots/consts.R")
source("/Users/udayangawickramasinghe/Install/RPlots/util.R")
source("/Users/udayangawickramasinghe/Install/RPlots/gplottempl.R")


############### PARAMS##############
Titl="Scaling Performance for Lulesh on `Cutter`"
X_LABEL="cores (count)"
Y_LABEL="time (s)"
# SERIES_COLORS=c("black","black")
# SERIES_FILL_COLORS=c("white","black")
# SERIES_MARKERS=c(24,21)
# LEGEND_POS=c(0.2,0.8)

MYPLOT_PROPS['plot.title', 'size']=8
# MYPLOT_PROPS['axis.title.y', 'size']=18
MYPLOT_PROPS['legend.title', 'active']=TRUE

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

remove("MYPLOT_CONSTANTS_DEF")