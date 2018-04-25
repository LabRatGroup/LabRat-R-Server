# Querying data from MySQL
data.query <- dbGetQuery(connection, sprintf("SELECT * FROM ml_model_prediction_datas WHERE token = '%s'", token))
data.state <- dbGetQuery(connection, sprintf("SELECT * FROM ml_model_state_training_datas WHERE ml_model_state_id = '%s'", data.query$ml_model_prediction_id))

# Retrieving data for model analysis
data.params <- fromJSON(data.query$params)
dir <- paste(data.env$dataDir,"/",data.env$sftpUser, sep="")
data.raw <- read.csv(file.path(dir, data.query$file_path), header=TRUE, sep = ";", dec = ",")

#Load model
source(file.path("./scripts/grid/", sprintf("%s.R", data.params$method)))

#Predict
filename <- file.path(sprintf("%s/models",dir),sprintf("%s.rda", data.state$token))
data.model <- readRDS(filename)
data.prediction <- predict(data.model, data.raw)
data.prediction <- as.data.frame(data.prediction)
colnames(data.prediction) <- c('prediction')
data.prediction$sample <- data.raw$sample
data.prediction$ml_model_prediction_data_id <- as.integer(data.query$id)
#str(data.prediction$ml_model_prediction_data_id)
