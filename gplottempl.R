myplot2 = function(dataset, x_string, y_string, color_string, error_string) {
  # assign(sup_var, dataset.)
  # Black error bars - notice the mapping of 'group=supp' -- without it, the error
  # bars won't be dodged!
  try(
    if(!exists("MYPLOT_CONSTANTS_DEF")){ 
      stop("Fatal Error! Constant file consts.R not available!")
      return()
    }
  )
  
  if(MYPLOT_PROPS['legend.key', 'active']){
    lg_key = element_rect()
  }else{
    lg_key = element_blank()
  }
  
  if(MYPLOT_PROPS['legend.title', 'active']){
    lg_title = element_text()
  }else{
    lg_title = element_blank()
  }
  
  pd <- position_dodge(0.1) # move them .05 to the left and right
  ydata <- dataset[y_string]
  if(!is.null(error_string)){
    error <- dataset[error_string]
  } else{
    error <- c(rep(0, nrow(dataset)))
  }
    
  p1 <- ggplot(dataset, aes_string(x=x_string, y=y_string, colour=color_string, group=color_string)) +
    geom_errorbar(aes(ymin=ydata-error, ymax=ydata+error), colour="grey", width=.1, position=pd) +
    geom_line(position=pd) +
    # geom_point(position=pd, size=3) +
    geom_point(aes_string(shape=color_string, fill=color_string), position=pd, size=MYPLOT_PROPS['geom_point', 'units']) +  # add a scatterplot; constant size, shape/fill depends on lesion
    scale_x_continuous(X_LABEL) + # have tick marks for each session
    # scale_y_continuous(Y_LABEL) + # have tick marks for each session
    scale_y_continuous(Y_LABEL, limits=c(0,400)) + # have tick marks for each session
    scale_shape_manual(values=SERIES_MARKERS)  +# explicitly have sham=fillable triangle, ACCX=fillable circle
    scale_color_manual(values=SERIES_COLORS)  +# explicitly have sham=fillable triangle, ACCX=fillable circle
    scale_fill_manual(values=SERIES_FILL_COLORS) + # explicitly have sham=white, ACCX=black
    # theme_bw()+  # make the theme black-and-white rather than grey (do this before font changes, or it overrides them)
    ggtitle(Titl)+
    theme(
      plot.title = element_text(face=MYPLOT_PROPS['plot.title', 'face'], size=MYPLOT_PROPS['plot.title', 'size']), # use theme_get() to see available options
      axis.title.x = element_text(face=MYPLOT_PROPS['axis.title.x', 'face'], size=MYPLOT_PROPS['axis.title.x', 'size']),
      axis.title.y = element_text(face=MYPLOT_PROPS['axis.title.y', 'face'], size=MYPLOT_PROPS['axis.title.y', 'size'], angle=MYPLOT_PROPS['axis.title.y', 'angle']),
      # panel.grid.major = element_blank(), # switch off major gridlines
      # panel.grid.minor = element_blank(), # switch off minor gridlines
      legend.position = LEGEND_POS, # manually position the legend (numbers being from 0,0 at bottom left of whole plot to 1,1 at top right)
      legend.title = lg_title, # switch off the legend title
      legend.text = element_text(size=MYPLOT_PROPS['legend.text', 'size']),
      legend.key.size = unit(MYPLOT_PROPS['legend.key', 'units'], "lines"),
      legend.key = lg_key # switch off the rectangle around symbols in the legend
    )
  
  return(p1)
}

myplot1 = function(dataset, x_string, y_string, color_string) {
  # assign(sup_var, dataset.)
  # Black error bars - notice the mapping of 'group=supp' -- without it, the error
  # bars won't be dodged!
  myplot2(dataset, x_string, y_string, color_string, NULL)
}

myplot_cleanup = function(){
  remove("MYPLOT_CONSTANTS_DEF")
}

# Multiple plot function
#
# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}
