library(ggplot2)
source("/Users/udayangawickramasinghe/Install/RPlots/util.R")

tg <- ToothGrowth
head(tg)

tgc <- summarySE(tg, measurevar="len", groupvars=c("supp","dose"))
tgc

# ggplot(tgc, aes(x=dose, y=len, colour=supp)) + 
#   geom_errorbar(aes(ymin=len-se, ymax=len+se), width=.1) +
#   geom_line() +
#   geom_point()

# Black error bars - notice the mapping of 'group=supp' -- without it, the error
# bars won't be dodged!
pd <- position_dodge(0.1) # move them .05 to the left and right

ggplot(tgc, aes(x=dose, y=len, colour=supp, group=supp)) +
  geom_errorbar(aes(ymin=len-ci, ymax=len+ci), colour="grey", width=.1, position=pd) +
  geom_line(position=pd) +
  # geom_point(position=pd, size=3) +
  geom_point(aes(shape=supp, fill=supp), position=pd, size=5) +  # add a scatterplot; constant size, shape/fill depends on lesion
  scale_x_continuous("Dose") + # have tick marks for each session
  scale_y_continuous("Length") + # have tick marks for each session
  scale_shape_manual(values=c(24,21))  +# explicitly have sham=fillable triangle, ACCX=fillable circle
  scale_color_manual(values=c("black","black"))  +# explicitly have sham=fillable triangle, ACCX=fillable circle
  scale_fill_manual(values=c("white","black")) + # explicitly have sham=white, ACCX=black
  theme_bw()+  # make the theme black-and-white rather than grey (do this before font changes, or it overrides them)
  ggtitle("Length vs Dose")+
  theme(
    plot.title = element_text(face="bold", size=14), # use theme_get() to see available options
    axis.title.x = element_text(face="bold", size=12),
    axis.title.y = element_text(face="bold", size=12, angle=90),
    # panel.grid.major = element_blank(), # switch off major gridlines
    # panel.grid.minor = element_blank(), # switch off minor gridlines
    legend.position = c(0.2,0.8), # manually position the legend (numbers being from 0,0 at bottom left of whole plot to 1,1 at top right)
    # legend.title = element_blank(), # switch off the legend title
    legend.text = element_text(size=12),
    legend.key.size = unit(1.5, "lines"),
    legend.key = element_blank() # switch off the rectangle around symbols in the legend
  )
  

