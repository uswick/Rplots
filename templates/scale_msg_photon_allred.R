library(ggplot2)
source("/Users/udayangawickramasinghe/Install/RPlots/consts.R")
source("/Users/udayangawickramasinghe/Install/RPlots/util.R")
source("/Users/udayangawickramasinghe/Install/RPlots/gplottempl.R")

# Titl="Scaling with fixed Overlap for 'PlusBench' on `Cutter`"
X_LABEL="message size (bytes)"
Y_LABEL="time (us)"
SERIES_COLORS=c("deepskyblue2" , "indianred2" ,     "springgreen2" , "blue" ,   "chartreuse1"  ,  "magenta")
SERIES_FILL_COLORS=c("deepskyblue2","indianred2","springgreen2","blue","chartreuse1","magenta")
#SERIES_MARKERS=c(23,22,21,24,25,10)
SERIES_MARKERS=c(0,5,6,15,9,10)


#title props
MYPLOT_PROPS['plot.title', 'size']=8
MYPLOT_PROPS['axis.title.x', 'size']=6
MYPLOT_PROPS['axis.title.y', 'size']=6

#legend
LEGEND_POS=c(0.13,0.9)
MYPLOT_PROPS['legend.text', 'size']=15
MYPLOT_PROPS['legend.key', 'units']=1.2
MYPLOT_PROPS['geom_point', 'units']=3.1

MYPLOT_PROPS['axis.text', 'active']=TRUE
MYPLOT_PROPS['axis.range.y', 'active']=TRUE

#disable global plot titles to fix rendering issues on title
MYPLOT_PROPS['plot.title.global', 'active']=FALSE

# mydata <- read.csv(file.choose(), header = TRUE)
mydata <- read.csv("/Users/udayangawickramasinghe/Desktop/Summer2016/quals/Q_Andrew/paper/data_photon_performance/cutter/x_message_size_y_time_photon_latency/excel/allred.csv", header = TRUE)

# View(mydata)
mydata

#y axis 
MYPLOT_PROPS['axis.range.y.limit', 'a']=0
MYPLOT_PROPS['axis.range.y.limit', 'b']=2500

#x axis
MYPLOT_PROPS['axis.range.x', 'active']=TRUE
MYPLOT_PROPS['axis.range.x.break', 'a']=4
MYPLOT_PROPS['axis.range.x.break', 'b']=524288
MYPLOT_PROPS['axis.range.x.break', 'step']=16336

dataset1 <- summarySE(mydata, measurevar="time", groupvars=c("mode","bytes"), na.rm=FALSE,
                      conf.interval=.85)

dataset1
myplot2_logx(dataset1, "bytes", "time", "mode", "ci", "Allreduce Latency vs Message Size on Photon, LibNBC (OFED) and MPI (cutter/224 cores)")

savelast_plot(name="allred_msg_final")
