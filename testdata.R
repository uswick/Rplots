library(ggplot2)
source("/Users/udayangawickramasinghe/Install/RPlots/consts.R")
source("/Users/udayangawickramasinghe/Install/RPlots/util.R")
source("/Users/udayangawickramasinghe/Install/RPlots/gplottempl.R")

Titl="Scaling with fixed Overlap for 'PlusBench' on `Cutter`"
X_LABEL="cores (count)"
Y_LABEL="time (s)"

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

myplot2(dataset2, "cores", "time", "mode.1", "ci")
