# simple plotting framework for R using ggplot2
# Author : Udayanga Wickramasinghe [uswickra@umail.iu.edu]
myplot_shrink_descrete = function(dataset, x_string, y_string, color_string, error_string, title="") {
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
    loc.lg_key = element_rect()
  }else{
    loc.lg_key = element_blank()
  }
  
  if(MYPLOT_PROPS['legend.title', 'active']){
    loc.lg_title = element_text()
  }else{
    loc.lg_title = element_blank()
  }
  
  if(MYPLOT_PROPS['plot.title.global', 'active']){
    loc.plt_title = Titl
  }else{
    loc.plt_title = title
  }
  
  if(MYPLOT_PROPS['axis.text', 'active']){
    loc.ax_txt =  element_text(face=MYPLOT_PROPS['axis.text', 'face'], size=MYPLOT_PROPS['axis.text', 'size'])
  }else{
    loc.ax_txt = element_text()
  }
  
  if(MYPLOT_PROPS['axis.range.y', 'active']){
    loc.ylimits = c(MYPLOT_PROPS['axis.range.y.limit', 'a'], MYPLOT_PROPS['axis.range.y.limit', 'b'])  
  }else{
    loc.ylimits = NULL
  }
  
  pd <- position_dodge(0.1) # move them .05 to the left and right
  ydata <- dataset[y_string]
  if(!is.null(error_string)){
    error <- dataset[error_string]
  } else{
    error <- c(rep(0, nrow(dataset)))
  }
  
  p1 <- ggplot(dataset, aes_string(x=x_string, y=y_string, colour=color_string, group=color_string)) +
    geom_errorbar(aes(ymin=ydata-error, ymax=ydata+error), colour="black", width=0.7, position=pd, size=0.28, linetype='solid') +
    geom_line(position=pd, size=0.6) +
    # geom_point(position=pd, size=1) +
    geom_point(aes_string(shape=color_string, fill=color_string, color=color_string), position=pd, size=MYPLOT_PROPS['geom_point', 'units']) +  # add a scatterplot; constant size, shape/fill depends on lesion
    # scale_y_continuous(Y_LABEL) + # have tick marks for each session
    scale_x_discrete(aes(breaks = "size"),labels=c("4","8","16","32","64","128","256","512","1K","2K","4K","8K","16K","32K","64K","128K","256K","512K","1M", "2M"))+
    scale_y_continuous(Y_LABEL, limits = loc.ylimits ) + # have tick marks for each session
    scale_shape_manual(values=SERIES_MARKERS)  +# explicitly have sham=fillable triangle, ACCX=fillable circle
    scale_color_manual(values=SERIES_COLORS)  +# explicitly have sham=fillable triangle, ACCX=fillable circle
    scale_fill_manual(values=SERIES_FILL_COLORS) + # explicitly have sham=white, ACCX=black
    #scale_fill_manual(values=c("#CC0000", "#006600", "#669999", "#00CCCC",
    #               "#660099", "#CC0066", "#FF9999", "#FF9900", 
    #                "black", "black", "black", "black", "black")) +
    theme_bw()+  # make the theme black-and-white rather than grey (do this before font changes, or it overrides them)
    ggtitle(loc.plt_title)+
    theme(
      plot.title = element_text(face=MYPLOT_PROPS['plot.title', 'face'], size=MYPLOT_PROPS['plot.title', 'size']), # use theme_get() to see available options
      axis.title.x = element_text(face=MYPLOT_PROPS['axis.title.x', 'face'], size=MYPLOT_PROPS['axis.title.x', 'size']),
      axis.title.y = element_text(face=MYPLOT_PROPS['axis.title.y', 'face'], size=MYPLOT_PROPS['axis.title.y', 'size'], angle=MYPLOT_PROPS['axis.title.y', 'angle']),
      axis.text = loc.ax_txt, 
      # axis.text.x = MYPLOT_PROPS['axis.text', 'x'],
      # panel.grid.major = element_blank(), # switch off major gridlines
      # panel.grid.minor = element_blank(), # switch off minor gridlines
      legend.position = LEGEND_POS, # manually position the legend (numbers being from 0,0 at bottom left of whole plot to 1,1 at top right)
      legend.title = loc.lg_title, # switch off the legend title
      legend.text = element_text(size=MYPLOT_PROPS['legend.text', 'size']),
      legend.key.size = unit(MYPLOT_PROPS['legend.key', 'units'], "lines"),
      legend.key = loc.lg_key, # switch off the rectangle around symbols in the legend
      legend.background = element_rect(fill=alpha('white', 0.2))
    )
  
  return(p1)
}




myplot_shrink = function(dataset, x_string, y_string, color_string, error_string, title="") {
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
    loc.lg_key = element_rect()
  }else{
    loc.lg_key = element_blank()
  }
  
  if(MYPLOT_PROPS['legend.title', 'active']){
    loc.lg_title = element_text()
  }else{
    loc.lg_title = element_blank()
  }
  
  if(MYPLOT_PROPS['plot.title.global', 'active']){
    loc.plt_title = Titl
  }else{
    loc.plt_title = title
  }
  
  if(MYPLOT_PROPS['axis.text', 'active']){
    loc.ax_txt =  element_text(face=MYPLOT_PROPS['axis.text', 'face'], size=MYPLOT_PROPS['axis.text', 'size'])
  }else{
    loc.ax_txt = element_text()
  }
  
  if(MYPLOT_PROPS['axis.range.y', 'active']){
    loc.ylimits = c(MYPLOT_PROPS['axis.range.y.limit', 'a'], MYPLOT_PROPS['axis.range.y.limit', 'b'])  
  }else{
    loc.ylimits = NULL
  }
  if(MYPLOT_PROPS['axis.range.x', 'active']){
    loc.xbreaks = seq(MYPLOT_PROPS['axis.range.x.break', 'a'], MYPLOT_PROPS['axis.range.x.break', 'b'], MYPLOT_PROPS['axis.range.x.break', 'step'])  
  }else{
    loc.xbreaks = NULL
  }
  
  pd <- position_dodge(0.1) # move them .05 to the left and right
  ydata <- dataset[y_string]
  if(!is.null(error_string)){
    error <- dataset[error_string]
  } else{
    error <- c(rep(0, nrow(dataset)))
  }
  
  p1 <- ggplot(dataset, aes_string(x=x_string, y=y_string, colour=color_string, group=color_string)) +
    geom_errorbar(aes(ymin=ydata-error, ymax=ydata+error), colour="black", width=1.5, position=pd, size=0.28, linetype='solid') +
    geom_line(position=pd, size=0.4) +
    # geom_point(position=pd, size=1) +
    geom_point(aes_string(shape=color_string, fill=color_string, color=color_string), position=pd, size=MYPLOT_PROPS['geom_point', 'units']) +  # add a scatterplot; constant size, shape/fill depends on lesion
    # scale_x_continuous(X_LABEL) + # have tick marks for each session
    scale_x_continuous(X_LABEL, breaks = loc.xbreaks) + # have tick marks for each session
    #with log scale
    #scale_x_continuous(X_LABEL, breaks = loc.xbreaks, trans="log2") + # have tick marks for each session
    
    # scale_y_continuous(Y_LABEL) + # have tick marks for each session
    scale_y_continuous(Y_LABEL, limits = loc.ylimits ) + # have tick marks for each session
    scale_shape_manual(values=SERIES_MARKERS)  +# explicitly have sham=fillable triangle, ACCX=fillable circle
    scale_color_manual(values=SERIES_COLORS)  +# explicitly have sham=fillable triangle, ACCX=fillable circle
    scale_fill_manual(values=SERIES_FILL_COLORS) + # explicitly have sham=white, ACCX=black
    #scale_fill_manual(values=c("#CC0000", "#006600", "#669999", "#00CCCC",
    #               "#660099", "#CC0066", "#FF9999", "#FF9900", 
    #                "black", "black", "black", "black", "black")) +
    theme_bw()+  # make the theme black-and-white rather than grey (do this before font changes, or it overrides them)
    ggtitle(loc.plt_title)+
    theme(
      plot.title = element_text(face=MYPLOT_PROPS['plot.title', 'face'], size=MYPLOT_PROPS['plot.title', 'size']), # use theme_get() to see available options
      axis.title.x = element_text(face=MYPLOT_PROPS['axis.title.x', 'face'], size=MYPLOT_PROPS['axis.title.x', 'size']),
      axis.title.y = element_text(face=MYPLOT_PROPS['axis.title.y', 'face'], size=MYPLOT_PROPS['axis.title.y', 'size'], angle=MYPLOT_PROPS['axis.title.y', 'angle']),
      axis.text = loc.ax_txt, 
      # panel.grid.major = element_blank(), # switch off major gridlines
      # panel.grid.minor = element_blank(), # switch off minor gridlines
      legend.position = LEGEND_POS, # manually position the legend (numbers being from 0,0 at bottom left of whole plot to 1,1 at top right)
      legend.title = loc.lg_title, # switch off the legend title
      legend.text = element_text(size=MYPLOT_PROPS['legend.text', 'size']),
      legend.key.size = unit(MYPLOT_PROPS['legend.key', 'units'], "lines"),
      legend.key = loc.lg_key, # switch off the rectangle around symbols in the legend
      legend.background = element_rect(fill=alpha('white', 0.2))
    )
  
  return(p1)
}


myplot2_logx = function(dataset, x_string, y_string, color_string, error_string, title="") {
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
    loc.lg_key = element_rect()
  }else{
    loc.lg_key = element_blank()
  }
  
  if(MYPLOT_PROPS['legend.title', 'active']){
    loc.lg_title = element_text()
  }else{
    loc.lg_title = element_blank()
  }
  
  if(MYPLOT_PROPS['plot.title.global', 'active']){
    loc.plt_title = Titl
  }else{
    loc.plt_title = title
  }
  
  if(MYPLOT_PROPS['axis.text', 'active']){
    loc.ax_txt =  element_text(face=MYPLOT_PROPS['axis.text', 'face'], size=MYPLOT_PROPS['axis.text', 'size'])
  }else{
    loc.ax_txt = element_text()
  }
  
  if(MYPLOT_PROPS['axis.range.y', 'active']){
    loc.ylimits = c(MYPLOT_PROPS['axis.range.y.limit', 'a'], MYPLOT_PROPS['axis.range.y.limit', 'b'])  
  }else{
    loc.ylimits = NULL
  }
  if(MYPLOT_PROPS['axis.range.x', 'active']){
    loc.xbreaks = seq(MYPLOT_PROPS['axis.range.x.break', 'a'], MYPLOT_PROPS['axis.range.x.break', 'b'], MYPLOT_PROPS['axis.range.x.break', 'step'])  
  }else{
    loc.xbreaks = NULL
  }
  
  pd <- position_dodge(0.1) # move them .05 to the left and right
  ydata <- dataset[y_string]
  if(!is.null(error_string)){
    error <- dataset[error_string]
  } else{
    error <- c(rep(0, nrow(dataset)))
  }
  
  p1 <- ggplot(dataset, aes_string(x=x_string, y=y_string, colour=color_string, group=color_string)) +
    geom_errorbar(aes(ymin=ydata-error, ymax=ydata+error), colour="black", width=0.9, position=pd, size=0.28, linetype='dashed') +
    geom_line(position=pd, size=0.4) +
    # geom_point(position=pd, size=1) +
    geom_point(aes_string(shape=color_string, fill=color_string), position=pd, size=MYPLOT_PROPS['geom_point', 'units']) +  # add a scatterplot; constant size, shape/fill depends on lesion
    # scale_x_continuous(X_LABEL) + # have tick marks for each session
    # scale_x_continuous(X_LABEL, breaks = loc.xbreaks) + # have tick marks for each session
    #with log scale
    scale_x_continuous(X_LABEL, breaks = loc.xbreaks, trans="log2") + # have tick marks for each session
    
    # scale_y_continuous(Y_LABEL) + # have tick marks for each session
    scale_y_continuous(Y_LABEL, limits = loc.ylimits ) + # have tick marks for each session
    scale_shape_manual(values=SERIES_MARKERS)  +# explicitly have sham=fillable triangle, ACCX=fillable circle
    scale_color_manual(values=SERIES_COLORS)  +# explicitly have sham=fillable triangle, ACCX=fillable circle
    scale_fill_manual(values=SERIES_FILL_COLORS) + # explicitly have sham=white, ACCX=black
    # scale_fill_manual(values=c("#CC0000", "#006600", "#669999", "#00CCCC",
    # "#660099", "#CC0066", "#FF9999", "#FF9900", 
    # "black", "black", "black", "black", "black")) +
    theme_bw()+  # make the theme black-and-white rather than grey (do this before font changes, or it overrides them)
    ggtitle(loc.plt_title)+
    theme(
      plot.title = element_text(face=MYPLOT_PROPS['plot.title', 'face'], size=MYPLOT_PROPS['plot.title', 'size']), # use theme_get() to see available options
      axis.title.x = element_text(face=MYPLOT_PROPS['axis.title.x', 'face'], size=MYPLOT_PROPS['axis.title.x', 'size']),
      axis.title.y = element_text(face=MYPLOT_PROPS['axis.title.y', 'face'], size=MYPLOT_PROPS['axis.title.y', 'size'], angle=MYPLOT_PROPS['axis.title.y', 'angle']),
      axis.text = loc.ax_txt, 
      # panel.grid.major = element_blank(), # switch off major gridlines
      # panel.grid.minor = element_blank(), # switch off minor gridlines
      legend.position = LEGEND_POS, # manually position the legend (numbers being from 0,0 at bottom left of whole plot to 1,1 at top right)
      legend.title = loc.lg_title, # switch off the legend title
      legend.text = element_text(size=MYPLOT_PROPS['legend.text', 'size']),
      legend.key.size = unit(MYPLOT_PROPS['legend.key', 'units'], "lines"),
      legend.key = loc.lg_key, # switch off the rectangle around symbols in the legend
      legend.background = element_rect(fill=alpha('white', 0.2))
    )
  
  return(p1)
}


myplot2 = function(dataset, x_string, y_string, color_string, error_string, title="") {
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
    loc.lg_key = element_rect()
  }else{
    loc.lg_key = element_blank()
  }
  
  if(MYPLOT_PROPS['legend.title', 'active']){
    loc.lg_title = element_text()
  }else{
    loc.lg_title = element_blank()
  }
  
  if(MYPLOT_PROPS['plot.title.global', 'active']){
    loc.plt_title = Titl
  }else{
    loc.plt_title = title
  }
  
  if(MYPLOT_PROPS['axis.text', 'active']){
    loc.ax_txt =  element_text(face=MYPLOT_PROPS['axis.text', 'face'], size=MYPLOT_PROPS['axis.text', 'size'])
  }else{
    loc.ax_txt = element_text()
  }
  
  if(MYPLOT_PROPS['axis.range.y', 'active']){
    loc.ylimits = c(MYPLOT_PROPS['axis.range.y.limit', 'a'], MYPLOT_PROPS['axis.range.y.limit', 'b'])  
  }else{
    loc.ylimits = NULL
  }
  if(MYPLOT_PROPS['axis.range.x', 'active']){
    loc.xbreaks = seq(MYPLOT_PROPS['axis.range.x.break', 'a'], MYPLOT_PROPS['axis.range.x.break', 'b'], MYPLOT_PROPS['axis.range.x.break', 'step'])  
  }else{
    loc.xbreaks = NULL
  }
  
  pd <- position_dodge(0.1) # move them .05 to the left and right
  ydata <- dataset[y_string]
  if(!is.null(error_string)){
    error <- dataset[error_string]
  } else{
    error <- c(rep(0, nrow(dataset)))
  }
    
  p1 <- ggplot(dataset, aes_string(x=x_string, y=y_string, colour=color_string, group=color_string)) +
    geom_errorbar(aes(ymin=ydata-error, ymax=ydata+error), colour="black", width=0.9, position=pd, size=0.28, linetype='dashed') +
    geom_line(position=pd, size=0.4) +
    # geom_point(position=pd, size=1) +
    geom_point(aes_string(shape=color_string, fill=color_string, color=color_string), position=pd, size=MYPLOT_PROPS['geom_point', 'units']) +  # add a scatterplot; constant size, shape/fill depends on lesion
    # scale_x_continuous(X_LABEL) + # have tick marks for each session
    scale_x_continuous(X_LABEL, breaks = loc.xbreaks) + # have tick marks for each session
    #with log scale
    #scale_x_continuous(X_LABEL, breaks = loc.xbreaks, trans="log2") + # have tick marks for each session
    
    # scale_y_continuous(Y_LABEL) + # have tick marks for each session
    scale_y_continuous(Y_LABEL, limits = loc.ylimits ) + # have tick marks for each session
    scale_shape_manual(values=SERIES_MARKERS)  +# explicitly have sham=fillable triangle, ACCX=fillable circle
    scale_color_manual(values=SERIES_COLORS)  +# explicitly have sham=fillable triangle, ACCX=fillable circle
    scale_fill_manual(values=SERIES_FILL_COLORS) + # explicitly have sham=white, ACCX=black
    #scale_fill_manual(values=c("#CC0000", "#006600", "#669999", "#00CCCC",
                 #               "#660099", "#CC0066", "#FF9999", "#FF9900", 
                 #                "black", "black", "black", "black", "black")) +
    theme_bw()+  # make the theme black-and-white rather than grey (do this before font changes, or it overrides them)
    ggtitle(loc.plt_title)+
    theme(
      plot.title = element_text(face=MYPLOT_PROPS['plot.title', 'face'], size=MYPLOT_PROPS['plot.title', 'size']), # use theme_get() to see available options
      axis.title.x = element_text(face=MYPLOT_PROPS['axis.title.x', 'face'], size=MYPLOT_PROPS['axis.title.x', 'size']),
      axis.title.y = element_text(face=MYPLOT_PROPS['axis.title.y', 'face'], size=MYPLOT_PROPS['axis.title.y', 'size'], angle=MYPLOT_PROPS['axis.title.y', 'angle']),
      axis.text = loc.ax_txt, 
      # panel.grid.major = element_blank(), # switch off major gridlines
      # panel.grid.minor = element_blank(), # switch off minor gridlines
      legend.position = LEGEND_POS, # manually position the legend (numbers being from 0,0 at bottom left of whole plot to 1,1 at top right)
      legend.title = loc.lg_title, # switch off the legend title
      legend.text = element_text(size=MYPLOT_PROPS['legend.text', 'size']),
      legend.key.size = unit(MYPLOT_PROPS['legend.key', 'units'], "lines"),
      legend.key = loc.lg_key, # switch off the rectangle around symbols in the legend
      legend.background = element_rect(fill=alpha('white', 0.2))
      )
  
  return(p1)
}


myplot1 = function(dataset, x_string, y_string, color_string, title= "") {
  # assign(sup_var, dataset.)
  # Black error bars - notice the mapping of 'group=supp' -- without it, the error
  # bars won't be dodged!
  myplot2(dataset, x_string, y_string, color_string, NULL, title)
}

myplot_cleanup = function(){
  remove("MYPLOT_CONSTANTS_DEF")
}

myplot_bar_stacked_with_negative = function(dataset, labels, dataset_neg, labels_neg,
                                       x_string, y_string, color_string, error_string, title="") {
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
    loc.lg_key = element_rect()
  }else{
    loc.lg_key = element_blank()
  }
  
  if(MYPLOT_PROPS['legend.title', 'active']){
    loc.lg_title = element_text()
  }else{
    loc.lg_title = element_blank()
  }
  
  if(MYPLOT_PROPS['plot.title.global', 'active']){
    loc.plt_title = Titl
  }else{
    loc.plt_title = title
  }
  
  if(MYPLOT_PROPS['axis.text', 'active']){
    loc.ax_txt =  element_text(face=MYPLOT_PROPS['axis.text', 'face'], size=MYPLOT_PROPS['axis.text', 'size'])
  }else{
    loc.ax_txt = element_text()
  }
  
  if(MYPLOT_PROPS['axis.range.y', 'active']){
    loc.ylimits = c(MYPLOT_PROPS['axis.range.y.limit', 'a'], MYPLOT_PROPS['axis.range.y.limit', 'b'])  
  }else{
    loc.ylimits = NULL
  }
  if(MYPLOT_PROPS['axis.range.x', 'active']){
    loc.xbreaks = seq(MYPLOT_PROPS['axis.range.x.break', 'a'], MYPLOT_PROPS['axis.range.x.break', 'b'], MYPLOT_PROPS['axis.range.x.break', 'step'])  
  }else{
    loc.xbreaks = NULL
  }
  
  pd <- position_dodge(0.9) # move them .05 to the left and right
  ydata <- dataset[y_string]
  if(!is.null(error_string)){
    error <- dataset[error_string]
  } else{
    error <- c(rep(0, nrow(dataset)))
  }
  
  p1 <- ggplot() +
    geom_bar(data=dataset, aes_string(x=x_string, y=y_string, fill=color_string), stat="identity") +
    geom_bar(data=dataset_neg, aes_string(x=x_string, y=y_string, fill=color_string), stat="identity") +
    labels +
    labels_neg +
    #geom_text(data=dataset, aes_string(x = x_string, y = y_string, label = y_string), size=2) +
    #geom_text(data=dataset_neg, aes_string(x = x_string, y = y_string, label = y_string), size=2) +
    
    #geom_errorbar(aes(ymin=ydata-error, ymax=ydata+error), colour="black", width=1.5, position=pd, size=0.28, linetype='solid') +
    #geom_bar(stat="identity", position=position_dodge(), colour="black") +
    #geom_bar(stat="identity", position=position_dodge(), colour="black",width=0.9)+
    scale_x_discrete(X_LABEL) + # have tick marks for each session
    #scale_x_continuous(X_LABEL, breaks = loc.xbreaks) + # have tick marks for each session
    #with log scale
    #scale_x_discrete(limits=c(8,27,64,125,216)) +
    #scale_x_continuous(X_LABEL, breaks = loc.xbreaks, trans="log2") + # have tick marks for each session
    #scale_y_continuous(Y_LABEL) + # have tick marks for each session
    scale_y_continuous(Y_LABEL, limits = loc.ylimits ) + # have tick marks for each session
    #scale_color_manual(values=SERIES_COLORS)  +# explicitly have sham=fillable triangle, ACCX=fillable circle
    #scale_fill_manual(values=SERIES_FILL_COLORS) + # explicitly have sham=white, ACCX=black
    scale_fill_brewer(palette="Blues") +
    #scale_fill_hue(c=45, l=85) +
    #scale_fill_manual(values=c("#999999", "#E69F00"))
    #scale_fill_manual(values=c("#CC0000", "#006600", "#669999", "#00CCCC",
    #               "#660099", "#CC0066", "#FF9999", "#FF9900", 
    #                "black", "black", "black", "black", "black")) +
    theme_bw()+  # make the theme black-and-white rather than grey (do this before font changes, or it overrides them)
    ggtitle(loc.plt_title)+
    theme(
      plot.title = element_text(face=MYPLOT_PROPS['plot.title', 'face'], size=MYPLOT_PROPS['plot.title', 'size']), # use theme_get() to see available options
      axis.title.x = element_text(face=MYPLOT_PROPS['axis.title.x', 'face'], size=MYPLOT_PROPS['axis.title.x', 'size']),
      axis.title.y = element_text(face=MYPLOT_PROPS['axis.title.y', 'face'], size=MYPLOT_PROPS['axis.title.y', 'size'], angle=MYPLOT_PROPS['axis.title.y', 'angle']),
      axis.text = loc.ax_txt, 
      # panel.grid.major = element_blank(), # switch off major gridlines
      # panel.grid.minor = element_blank(), # switch off minor gridlines
      legend.position = LEGEND_POS, # manually position the legend (numbers being from 0,0 at bottom left of whole plot to 1,1 at top right)
      legend.title = loc.lg_title, # switch off the legend title
      legend.text = element_text(size=MYPLOT_PROPS['legend.text', 'size']),
      legend.key.size = unit(MYPLOT_PROPS['legend.key', 'units'], "lines"),
      legend.key = loc.lg_key, # switch off the rectangle around symbols in the legend
      legend.background = element_rect(fill=alpha('white', 0.2))
    )
  
  return(p1)
}

myplot_bar = function(dataset, x_string, y_string, color_string, error_string, title="") {
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
    loc.lg_key = element_rect()
  }else{
    loc.lg_key = element_blank()
  }
  
  if(MYPLOT_PROPS['legend.title', 'active']){
    loc.lg_title = element_text()
  }else{
    loc.lg_title = element_blank()
  }
  
  if(MYPLOT_PROPS['plot.title.global', 'active']){
    loc.plt_title = Titl
  }else{
    loc.plt_title = title
  }
  
  if(MYPLOT_PROPS['axis.text', 'active']){
    loc.ax_txt =  element_text(face=MYPLOT_PROPS['axis.text', 'face'], size=MYPLOT_PROPS['axis.text', 'size'])
  }else{
    loc.ax_txt = element_text()
  }
  
  if(MYPLOT_PROPS['axis.range.y', 'active']){
    loc.ylimits = c(MYPLOT_PROPS['axis.range.y.limit', 'a'], MYPLOT_PROPS['axis.range.y.limit', 'b'])  
  }else{
    loc.ylimits = NULL
  }
  if(MYPLOT_PROPS['axis.range.x', 'active']){
    loc.xbreaks = seq(MYPLOT_PROPS['axis.range.x.break', 'a'], MYPLOT_PROPS['axis.range.x.break', 'b'], MYPLOT_PROPS['axis.range.x.break', 'step'])  
  }else{
    loc.xbreaks = NULL
  }
  
  pd <- position_dodge(0.9) # move them .05 to the left and right
  ydata <- dataset[y_string]
  if(!is.null(error_string)){
    error <- dataset[error_string]
  } else{
    error <- c(rep(0, nrow(dataset)))
  }
  
  p1 <- ggplot(dataset, aes_string(x=x_string, y=y_string, fill=color_string)) +
    #geom_errorbar(aes(ymin=ydata-error, ymax=ydata+error), colour="black", width=1.5, position=pd, size=0.28, linetype='solid') +
    #geom_bar(stat="identity", position=position_dodge(), colour="black") +
    geom_bar(stat="identity", position=position_dodge(), colour="black",width=0.9)+
    #geom_bar(stat="identity")+
    # scale_x_continuous(X_LABEL) + # have tick marks for each session
    #scale_x_continuous(X_LABEL, breaks = loc.xbreaks) + # have tick marks for each session
    #with log scale
    #scale_x_discrete(limits=c(8,27,64,125,216)) +
    #scale_x_continuous(X_LABEL, breaks = loc.xbreaks, trans="log2") + # have tick marks for each session
    #scale_y_continuous(Y_LABEL) + # have tick marks for each session
    scale_y_continuous(Y_LABEL, limits = loc.ylimits ) + # have tick marks for each session
    #scale_color_manual(values=SERIES_COLORS)  +# explicitly have sham=fillable triangle, ACCX=fillable circle
    #scale_fill_manual(values=SERIES_FILL_COLORS) + # explicitly have sham=white, ACCX=black
    scale_fill_brewer(palette="Blues") +
    #scale_fill_hue(c=45, l=85) +
    #scale_fill_manual(values=c("#999999", "#E69F00"))
    #scale_fill_manual(values=c("#CC0000", "#006600", "#669999", "#00CCCC",
    #               "#660099", "#CC0066", "#FF9999", "#FF9900", 
    #                "black", "black", "black", "black", "black")) +
    theme_bw()+  # make the theme black-and-white rather than grey (do this before font changes, or it overrides them)
    #ggtitle(loc.plt_title)+
    theme(
      plot.title = element_text(face=MYPLOT_PROPS['plot.title', 'face'], size=MYPLOT_PROPS['plot.title', 'size']), # use theme_get() to see available options
      axis.title.x = element_text(face=MYPLOT_PROPS['axis.title.x', 'face'], size=MYPLOT_PROPS['axis.title.x', 'size']),
      axis.title.y = element_text(face=MYPLOT_PROPS['axis.title.y', 'face'], size=MYPLOT_PROPS['axis.title.y', 'size'], angle=MYPLOT_PROPS['axis.title.y', 'angle']),
      axis.text = loc.ax_txt, 
      # panel.grid.major = element_blank(), # switch off major gridlines
      # panel.grid.minor = element_blank(), # switch off minor gridlines
      legend.position = LEGEND_POS, # manually position the legend (numbers being from 0,0 at bottom left of whole plot to 1,1 at top right)
      legend.title = loc.lg_title, # switch off the legend title
      legend.text = element_text(size=MYPLOT_PROPS['legend.text', 'size']),
      legend.key.size = unit(MYPLOT_PROPS['legend.key', 'units'], "lines"),
      legend.key = loc.lg_key # switch off the rectangle around symbols in the legend
    )
  
  return(p1)
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

