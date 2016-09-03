# simple plotting framework for R using ggplot2
# helper functions (extracted from R Cookbook - http://www.cookbook-r.com/)
# Author : Udayanga Wickramasinghe [uswickra@umail.iu.edu]

summarySE <- function(data=NULL, measurevar, groupvars=NULL, na.rm=FALSE,
                      conf.interval=.95, .drop=TRUE) {
  library(plyr)
  
  # New version of length which can handle NA's: if na.rm==T, don't count them
  length2 <- function (x, na.rm=FALSE) {
    if (na.rm) sum(!is.na(x))
    else       length(x)
  }
  
  # This does the summary. For each group's data frame, return a vector with
  # N, mean, and sd
  datac <- ddply(data, groupvars, .drop=.drop,
                 .fun = function(xx, col) {
                   c(N    = length2(xx[[col]], na.rm=na.rm),
                     mean = mean   (xx[[col]], na.rm=na.rm),
                     sd   = sd     (xx[[col]], na.rm=na.rm)
                   )
                 },
                 measurevar
  )
  
  # Rename the "mean" column    
  datac <- rename(datac, c("mean" = measurevar))
  
  datac$se <- datac$sd / sqrt(datac$N)  # Calculate standard error of the mean
  
  # Confidence interval multiplier for standard error
  # Calculate t-statistic for confidence interval: 
  # e.g., if conf.interval is .95, use .975 (above/below), and use df=N-1
  ciMult <- qt(conf.interval/2 + .5, datac$N-1)
  datac$ci <- datac$se * ciMult
  
  return(datac)
}

MHmakeRandomString <- function(n=1, lenght=12)
{
  randomString <- c(1:n)                  # initialize vector
  for (i in 1:n)
  {
    randomString[i] <- paste(sample(c(0:9, letters, LETTERS),
                                    lenght, replace=TRUE),
                             collapse="")
  }
  return(randomString)
}

savelast_plot <- function(fpath=NULL, name=NULL, dev = "eps"){
  base <- getwd()
  fname <- ""
  if(!is.null(name)){
    fname <- paste("plot_", fname, name, sep="")
  }else {
    fname <- paste("plot_", fname, MHmakeRandomString(), sep="")
  }
  fname <- paste(fname, ".", dev, sep ="")
  
  if(!is.null(fpath)){
    fname <- paste(fpath, "/" ,fname, sep="")
  } else {
    fname <- paste(base, "/../graphs/" ,fname, sep="")
  }
  ggsave(file=fname, device = dev)
}

