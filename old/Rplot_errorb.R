##install.packages("ggplot2")
library(ggplot2)
require(ggplot2)
source("http://egret.psychol.cam.ac.uk/statistics/R/extensions/rnc_ggplot2_border_themes_2013_01.r")

phdfig37b = read.table("/Users/udayangawickramasinghe/Install/RPlots/PhD_fig37B.csv", header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)

phdfig37b_long = with(phdfig37b,
                      rbind( data.frame( lesion = "sham", session = session, diffscore = sham, sem = SEM_sham ),
                             data.frame( lesion = "ACCX", session = session, diffscore = ACCX, sem = SEM_accx ) )
)

#qplot(session, diffscore, colour=lesion, data=phdfig37b_long) + geom_line() + geom_errorbar(aes(ymin = diffscore - sem, ymax = diffscore + sem))

f1 = ggplot(data = phdfig37b_long, aes(x = session, y = diffscore, group = lesion) ) +  # lesion becomes a classifying factor
  geom_errorbar(aes(ymin = diffscore - sem, ymax = diffscore + sem), width=0.3) +  # add error bars (do so before geom_point so the points are on top of the error bars)
  geom_line() + # join points with lines (specify this before geom_point, or the lines will be drawn over the shapes)
  geom_point(aes(shape=lesion, fill=lesion), size=5)+  # add a scatterplot; constant size, shape/fill depends on lesion
  scale_x_continuous("Session", breaks=1:12) + # have tick marks for each session
  scale_y_continuous("Difference score", limits = c(-4, 8), breaks=seq(-4, 8, by = 2))  +# rescale Y axis slightly
  scale_shape_manual(values=c(24,21))  +# explicitly have sham=fillable triangle, ACCX=fillable circle
  scale_fill_manual(values=c("white","black")) + # explicitly have sham=white, ACCX=black
  #stat_abline(intercept=0, slope=0, linetype="dotted")  + # add a reference line
  annotate("text", x=11, y=-0.25, label="chance") + # and a manual label or annotation
  theme_bw() + # make the theme black-and-white rather than grey (do this before font changes, or it overrides them)
  ggtitle("Two-stimulus discriminated approach task")+
  theme(
       plot.title = element_text(face="bold", size=14), # use theme_get() to see available options
       axis.title.x = element_text(face="bold", size=12),
       axis.title.y = element_text(face="bold", size=12, angle=90),
       panel.grid.major = element_blank(), # switch off major gridlines
       panel.grid.minor = element_blank(), # switch off minor gridlines
       legend.position = c(0.2,0.8), # manually position the legend (numbers being from 0,0 at bottom left of whole plot to 1,1 at top right)
       legend.title = element_blank(), # switch off the legend title
       legend.text = element_text(size=12),
       legend.key.size = unit(1.5, "lines"),
       legend.key = element_blank() # switch off the rectangle around symbols in the legend
  )

print(f1)
