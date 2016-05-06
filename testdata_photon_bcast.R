library(ggplot2)
source("/Users/udayangawickramasinghe/Install/RPlots/consts.R")
source("/Users/udayangawickramasinghe/Install/RPlots/util.R")
source("/Users/udayangawickramasinghe/Install/RPlots/gplottempl.R")

Titl="Broadcast performance on `Cutter` (iterations = 1000)"
X_LABEL="nodes (count)"
Y_LABEL="time (us)"
LEGEND_POS=c(0.23,0.9)
SERIES_COLORS=c("blue","chartreuse4","red","purple")
SERIES_FILL_COLORS=c("white","green", "red", "white")
SERIES_MARKERS=c(24,21,22,23)
LEGEND_POS=c(0.23,0.87)

MYPLOT_PROPS['plot.title', 'size']=8
MYPLOT_PROPS['axis.title.x', 'size']=8
MYPLOT_PROPS['axis.title.y', 'size']=8

MYPLOT_PROPS['legend.text', 'size']=5
MYPLOT_PROPS['legend.key', 'units']=0.5
MYPLOT_PROPS['geom_point', 'units']=1.3


# mydata <- read.csv(file.choose(), header = TRUE)
mydata <- read.csv("/Users/udayangawickramasinghe/Documents/Collectives/photon/microbcast_cutter.csv", header = TRUE)

# View(mydata)
mydata
dataset <- summarySE(mydata, measurevar="time", groupvars=c("type","nodes"))
#dataset

myplot1(dataset, "nodes", "time", "type")

