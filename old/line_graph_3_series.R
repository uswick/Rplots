mydata <- read.csv(file.choose(), header = TRUE)

###########FORMAT#############
###### col1 => x labels ######
###### col2 => y1 data  ######
###### col3 => y2 data  ######
###### col4 => y3 data  ######
############ END #############

###########PARAMS#############
T="Scaling Performance for Lullesh on `Cutter` [x = 48]"
X_LABEL="total number of cores"
Y_LABEL="time (s)"
SERIES_1="mpi allreduce"
SERIES_2="pwc parcel allreduce"
SERIES_3="isir mpi allreduce"
SERIES_1.COLOR="blue"
SERIES_2.COLOR="red"
SERIES_3.COLOR="black"

LEGEND_X_POS=2
LBL_FONT_SZ=0.8
AXIS_DATA_FONT_SZ=0.5

X_AXIS_SPACING=1.5
Y_AXIS_SPACING=1.5

############ END #############


g_range <- range(0, mydata[,2], mydata[,3], mydata[,4])
View(mydata)
plot.new()

plot(mydata[,1],mydata[,2], type="o", col=SERIES_1.COLOR, lwd=1, ylim=g_range , ann=FALSE, cex.lab=0.5 , cex.axis = AXIS_DATA_FONT_SZ, mgp=c(0,0.4,0))
lines(mydata[,1],mydata[,3], type="o", col=SERIES_2.COLOR, lwd=1, pch= 22, lty=2)
lines(mydata[,1],mydata[,4], type="o", col=SERIES_3.COLOR, lwd=1, pch= 23, lty=2)

# Create a legend at (1, g_range[2]) that is slightly smaller 
# (cex) and uses the same line colors and points used by 
# the actual plots 
legend(LEGEND_X_POS, g_range[2], c(SERIES_1,SERIES_2, SERIES_3), cex=LBL_FONT_SZ, 
       col=c(SERIES_1.COLOR,SERIES_2.COLOR, SERIES_3.COLOR), pch=21:23, lty=c(1,2,2));

#axis(1, font=2)
box()
# Create a title with a red, bold/italic font
title(main=T)

mtext(side = 1, text = X_LABEL, line = X_AXIS_SPACING, cex = LBL_FONT_SZ) 
mtext(side = 2, text = Y_LABEL, line = Y_AXIS_SPACING, cex = LBL_FONT_SZ) 
#title(xlab =X_LABEL)
#title(ylab = Y_LABEL)

