# Set java home location
#if (Sys.info()['sysname'] == 'Darwin') {
#  libjvm <- paste0(system2('/usr/libexec/java_home',stdout = TRUE)[1],'/jre/lib/server/libjvm.dylib')
#  message (paste0('Load libjvm.dylib from: ',libjvm))
#  dyn.load(libjvm)
#}

# Load libraries and packages
#print('############### Load libraries and packages');

libraries <- c("RMySQL", "RJSONIO", "caret", "mongolite")
check.libraries <- is.element(libraries, installed.packages()[, 1])==FALSE
libraries.to.install <- libraries[check.libraries]
if (length(libraries.to.install!=0)) {
  install.packages(libraries.to.install, repos = "http://cran.us.r-project.org", dependencies = TRUE)
}

success <- sapply(libraries,require, quietly = FALSE,  character.only = TRUE)
if(length(success) != length(libraries)) {stop("A package failed to return a success in require() function.")}

require(jsonlite)

options(verbose = FALSE)