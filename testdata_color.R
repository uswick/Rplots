library(ggplot2)
source("/Users/udayangawickramasinghe/Install/RPlots/consts.R")
source("/Users/udayangawickramasinghe/Install/RPlots/util.R")
source("/Users/udayangawickramasinghe/Install/RPlots/gplottempl.R")

# Titl="Scaling with fixed Overlap for 'PlusBench' on `Cutter`"
X_LABEL="cores (count)"
Y_LABEL="time (s)"
LEGEND_POS=c(0.23,0.9)
SERIES_COLORS=c("blue","chartreuse4")
SERIES_FILL_COLORS=c("white","green")


MYPLOT_PROPS['plot.title', 'size']=8
MYPLOT_PROPS['axis.title.x', 'size']=8
MYPLOT_PROPS['axis.title.y', 'size']=8

MYPLOT_PROPS['legend.text', 'size']=5
MYPLOT_PROPS['legend.key', 'units']=0.5
MYPLOT_PROPS['geom_point', 'units']=1.3


# mydata <- read.csv(file.choose(), header = TRUE)
mydata <- read.csv("/Users/udayangawickramasinghe/Install/RPlots/data/scaled_procs_ov_all.csv", header = TRUE)

# View(mydata)
mydata
dataset <- summarySE(mydata, measurevar="time", groupvars=c("mode.1","distrib","overhead","cores"))
# dataset

dataset1 <- dataset[dataset$overhead == 10 & dataset$distrib == 'gaussian',]
dataset1

dataset2 <- dataset[dataset$overhead == 10 & dataset$distrib == 'uniform',]
dataset2

dataset3 <- dataset[dataset$overhead == 10 & dataset$distrib == 'exponen',]
dataset3

dataset4 <- dataset[dataset$overhead == 10 & dataset$distrib == 'random_uniform',]
dataset4

dataset5 <- dataset[dataset$overhead == 10 & dataset$distrib == 'scaled_2.5x',]
dataset5

##### overhead 20
dataset1b <- dataset[dataset$overhead == 20 & dataset$distrib == 'gaussian',]
dataset1b

dataset2b <- dataset[dataset$overhead == 20 & dataset$distrib == 'uniform',]
dataset2b

dataset3b <- dataset[dataset$overhead == 20 & dataset$distrib == 'exponen',]
dataset3b

dataset4b <- dataset[dataset$overhead == 20 & dataset$distrib == 'random_uniform',]
dataset4b

dataset5b <- dataset[dataset$overhead == 20 & dataset$distrib == 'scaled_2.5x',]
dataset5b

##### overhead 40
dataset1c <- dataset[dataset$overhead == 40 & dataset$distrib == 'gaussian',]
dataset1c

dataset2c <- dataset[dataset$overhead == 40 & dataset$distrib == 'uniform',]
dataset2c

dataset3c <- dataset[dataset$overhead == 40 & dataset$distrib == 'exponen',]
dataset3c

dataset4c <- dataset[dataset$overhead == 40 & dataset$distrib == 'random_uniform',]
dataset4c

dataset5c <- dataset[dataset$overhead == 40 & dataset$distrib == 'scaled_2.5x',]
dataset5c

##### overhead 80
dataset1d <- dataset[dataset$overhead == 80 & dataset$distrib == 'gaussian',]
dataset1d

dataset2d <- dataset[dataset$overhead == 80 & dataset$distrib == 'uniform',]
dataset2d

dataset3d <- dataset[dataset$overhead == 80 & dataset$distrib == 'exponen',]
dataset3d

dataset4d <- dataset[dataset$overhead == 80 & dataset$distrib == 'random_uniform',]
dataset4d

dataset5d <- dataset[dataset$overhead == 80 & dataset$distrib == 'scaled_2.5x',]
dataset5d



p1 <- myplot2(dataset1, "cores", "time", "mode.1", "ci")
p2 <- myplot2(dataset2, "cores", "time", "mode.1", "ci")
p3 <- myplot2(dataset3, "cores", "time", "mode.1", "ci")
p4 <- myplot2(dataset4, "cores", "time", "mode.1", "ci")
p5 <- myplot2(dataset5, "cores", "time", "mode.1", "ci")


# multiplot(p1)
multiplot(p1, p2, p3, p4, p5, cols=3)