mydata <- read.csv(file.choose(), header = TRUE)
###########FORMAT#############
###### col1 => x labels ######
###### col2 => y  data  ######
############ END #############

###########PARAMS#############
T="Title of the Graph"
X_LABEL="nodes"
Y_LABEL="time (ms)"
SERIES_1="series1"
SERIES_1.COLOR="blue"

LEGEND_X_POS=2
LBL_FONT_SZ=0.8
AXIS_DATA_FONT_SZ=0.5

X_AXIS_SPACING=1.5
Y_AXIS_SPACING=1.5

############ END #############


g_range <- range(0, mydata[,2])
View(mydata)
plot.new()

plot(mydata[,1],mydata[,2], type="o", col=SERIES_1.COLOR, lwd=1, ylim=g_range , ann=FALSE, cex.lab=0.5 , cex.axis = AXIS_DATA_FONT_SZ, mgp=c(0,0.4,0))

# Create a legend at (1, g_range[2]) that is slightly smaller 
# (cex) and uses the same line colors and points used by 
# the actual plots 
legend(LEGEND_X_POS, g_range[2], c(SERIES_1), cex=LBL_FONT_SZ, 
       col=c(SERIES_1.COLOR), pch=21, lty=1);

#axis(1, font=2)
box()
# Create a title with a red, bold/italic font
title(main=T)

mtext(side = 1, text = X_LABEL, line = X_AXIS_SPACING, cex = LBL_FONT_SZ) 
mtext(side = 2, text = Y_LABEL, line = Y_AXIS_SPACING, cex = LBL_FONT_SZ) 
#title(xlab =X_LABEL)
#title(ylab = Y_LABEL)
