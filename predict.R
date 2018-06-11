#!/usr/bin/env Rscript

tryCatch (
  {
    source("./scripts/10-loadPackages.R")
    source("./scripts/20-mysqlDataQuery.R")
    source("./scripts/35-createPrediction.R")
    source("./scripts/45-mongoDataSave.R")
    source("./scripts/50-closeDbConnections.R")
 }, error = function(err) {
   cat(500)
 }, finnaly = {
  cat(200)
 })
