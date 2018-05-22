# Get MySQL connection param from env variables
#print('############### Get MySQL connection param from env variables');

data.env <-read.csv('env', header=TRUE, sep = ",", dec = ",")
connection <- dbConnect(
  MySQL(),
  user=toString(data.env$dbUser),
  password=toString(data.env$dbpassword),
  host=toString(data.env$dbHost),
  dbname=toString(data.env$dbName)
  )

# Catch collection token from script params
args <- commandArgs(trailingOnly = TRUE)
token <- args[1]
#token <- "liC53aCdwP9jxmzjCXXIrlGNL"
