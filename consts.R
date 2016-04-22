MYPLOT_CONSTANTS_DEF=TRUE
############### DEFAULT PARAMS##############
Titl=""
X_LABEL="x label"
Y_LABEL="y label"
SERIES_COLORS=c("black","black")
SERIES_FILL_COLORS=c("white","black")
SERIES_MARKERS=c(24,21)
LEGEND_POS=c(0.2,0.8)

############### DEFAULT PLOT PARAMS##############
MYPLOT_PROPS <- data.frame(active=integer(), 
                      face=character(),     
                      size=integer(),
                      units=double(),
                      angle=integer(),
                      text=character(),
                      key=character(), stringsAsFactors = FALSE)

MYPLOT_PROPS['plot.title', 'active']=TRUE
MYPLOT_PROPS['plot.title', 'size']=14
MYPLOT_PROPS['plot.title', 'face']="bold"
MYPLOT_PROPS['plot.title', 'angle']=90

MYPLOT_PROPS['axis.title.x', 'active']=TRUE
MYPLOT_PROPS['axis.title.x', 'size']=12
MYPLOT_PROPS['axis.title.x', 'face']="bold"
MYPLOT_PROPS['axis.title.x', 'angle']=0

MYPLOT_PROPS['axis.title.y', 'active']=TRUE
MYPLOT_PROPS['axis.title.y', 'size']=12
MYPLOT_PROPS['axis.title.y', 'face']="bold"
MYPLOT_PROPS['axis.title.y', 'angle']=90

MYPLOT_PROPS['legend.key', 'active']=FALSE
MYPLOT_PROPS['legend.title', 'active']=FALSE

MYPLOT_PROPS['legend.text', 'size']=8
MYPLOT_PROPS['legend.key', 'units']=1.1


MYPLOT_PROPS['geom_point', 'units']=3


MYPLOT_PROPS
