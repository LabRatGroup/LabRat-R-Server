# Querying data from MySQL
#print('############### Querying data from MySQL');
# FIX RELATION QUERY
data.query <- dbGetQuery(connection, sprintf("SELECT cast(id as CHAR(25)) as id, token, file_path, cast(ml_model_id as CHAR(25)) as ml_model_id FROM ml_model_predictions WHERE token = '%s'", token))
data.state <- dbGetQuery(connection, sprintf("SELECT token FROM ml_model_states WHERE is_current=1 and ml_model_id = '%s'", data.query$ml_model_id))

# Retrieving data for model analysis
dir <- paste(data.env$dataDir,"/",data.env$sftpUser, sep="")
data.raw <- read.csv(file.path(dir, data.query$file_path), header=TRUE, sep = ";", dec = ",")


#Predict
#print('############### Predincting data');

filename <- file.path(sprintf("%s/models",dir),sprintf("%s.rda", data.state$token))
data.model <- readRDS(filename)
data.prediction <- predict(data.model, data.raw)
data.prediction <- as.data.frame(data.prediction)
colnames(data.prediction) <- c('prediction')
data.prediction$sample <- data.raw$sample
data.prediction$ml_model_prediction_data_id <- as.integer(data.query$id)
#str(data.prediction$ml_model_prediction_data_id)
