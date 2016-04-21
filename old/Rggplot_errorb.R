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


# The errorbars overlapped, so use position_dodge to move them horizontally
# 
# ggplot(tgc, aes(x=dose, y=len, colour=supp)) + 
#   geom_errorbar(aes(ymin=len-se, ymax=len+se), width=.1, position=pd) +
#   geom_line(position=pd) +
#   geom_point(position=pd)


# Use 95% confidence interval instead of SEM
# ggplot(tgc, aes(x=dose, y=len, colour=supp)) + 
#   geom_errorbar(aes(ymin=len-ci, ymax=len+ci), width=.1, position=pd) +
#   geom_line(position=pd) +
#   geom_point(position=pd)
# 
# Black error bars - notice the mapping of 'group=supp' -- without it, the error
# bars won't be dodged!
pd <- position_dodge(0.1) # move them .05 to the left and right

ggplot(tgc, aes(x=dose, y=len, colour=supp, group=supp)) +
  geom_errorbar(aes(ymin=len-ci, ymax=len+ci), colour="black", width=.1, position=pd) +
  geom_line(position=pd) +
  geom_point(position=pd, size=3)