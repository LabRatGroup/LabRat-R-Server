tryCatch (
  {
    source("./scripts/10-loadPackages.R")
    source("./scripts/20-mysqlDataQuery.R")
    source("./scripts/30-createModel.R")
    source("./scripts/40-saveScore.R")
    source("./scripts/50-closeDbConnections.R")
  }, error = function(err) {
    cat(500)
  }, finnaly = {
    cat(200)
  })