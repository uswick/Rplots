mydata <- read.csv(file.choose(), header = TRUE)

###########FORMAT#############
###### col1 => x labels ######
###### col2 => y1 data  ######
###### col3 => y2 data  ######
###### col4 => y3 data  ######
############ END #############

###########PARAMS#############
T="Microbenchmark Performance Allreduce (I=1000 N=256) on `Cutter`"
X_LABEL="total number of cores"
Y_LABEL="time per iteration (s)"

num_series = 4

ser_labels=c()
ser_labels[1]="pwc lco"
ser_labels[2]="isir lco"
ser_labels[3]="pwc parcel"
ser_labels[4]="isir new collective"

ser_cols=c()
ser_cols[1]="blue"
ser_cols[2]="purple"
ser_cols[3]="red"
ser_cols[4]="black"

pch_start_symb_idx = 0

# ser_cols = c(SERIES_1.COLOR, SERIES_2.COLOR, SERIES_3.COLOR, SERIES_4.COLOR)
# ser_labels = c(SERIES_1, SERIES_2, SERIES_3, SERIES_4)


LEGEND_X_POS=2
LBL_FONT_SZ=0.8
AXIS_DATA_FONT_SZ=0.5

X_AXIS_SPACING=1.5
Y_AXIS_SPACING=1.5

Y_OFFSET=0.049
############ END #############

for(i in 1:num_series){
  col_num = 1 + i  
    g_range <- range(0, mydata[,col_num]+Y_OFFSET)  
}
# g_range <- range(8, mydata[,2]+Y_OFFSET, mydata[,3]+Y_OFFSET, mydata[,4]+Y_OFFSET, mydata[,5]+Y_OFFSET)
View(mydata)
plot.new()

for(i in 1:num_series){
  col_num = 1 + i
  ser_c = ser_cols[i]
  # ser_pch = 21 + i
  ser_pch = pch_start_symb_idx + i
  if(i != 1){
    lines(mydata[,1],mydata[,col_num], type="o", col=ser_cols[i], lwd=1, pch= ser_pch, lty=2)
  }else {
    plot(mydata[,1],mydata[,col_num], type="o", col=ser_cols[i], lwd=1, ylim=g_range, ann=FALSE, cex.lab=0.5 , cex.axis = AXIS_DATA_FONT_SZ, mgp=c(0,0.4,0))
  }
}

# Create a legend at (1, g_range[2]) that is slightly smaller 
# (cex) and uses the same line colors and points used by 
# the actual plots 
pch_end=pch_start_symb_idx+num_series
pch_start=pch_start_symb_idx+1
legend(LEGEND_X_POS, g_range[2], ser_labels, cex=LBL_FONT_SZ, 
       col=ser_cols, pch=pch_start:pch_end, lty=c(1,2,2));

#axis(1, font=2)
box()
# Create a title with a red, bold/italic font
title(main=T)

mtext(side = 1, text = X_LABEL, line = X_AXIS_SPACING, cex = LBL_FONT_SZ) 
mtext(side = 2, text = Y_LABEL, line = Y_AXIS_SPACING, cex = LBL_FONT_SZ) 
#title(xlab =X_LABEL)
#title(ylab = Y_LABEL)

