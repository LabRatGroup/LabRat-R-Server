# Querying data from MySQL
data.query <- dbGetQuery(connection, sprintf("SELECT token, params, file_path, cast(ml_model_state_id as CHAR(25)) as ml_model_state_id FROM ml_model_state_training_datas WHERE token = '%s'", token))

# Retrieving data for model analysis
data.params <- fromJSON(data.query$params)
dir <- paste(data.env$dataDir,"/",data.env$sftpUser, sep="")
data.raw <- read.csv(file.path(dir, data.query$file_path), header=TRUE, sep = ";", dec = ",")


#Create model
set.seed(123)
data.in_train <- createDataPartition(data.raw$prediction, p = 0.67, list = FALSE)
data.training <- data.raw[data.in_train, ]
data.test <- data.raw[-data.in_train, ]

dfParams <- as.data.frame(fromJSON(data.query$params))

data.training.model <- list()
data.training.prediction <- list()
data.training.confusionMatrix <- list()
max = 0

for (row in 1:nrow(dfParams)) {
  method <- dfParams[row, "method"]
  metric <- dfParams[row, "metric"]
  preprocessing <- dfParams[row, "preprocessing"]
  positive <- dfParams[row, "positive"]
  trainControlMethod <- dfParams[row, "control"]$trainControlMethod
  trainControlMethodRounds <- dfParams[row, "control"]$trainControlMethodRounds
  
  ctrl <- trainControl(
    method = trainControlMethod, 
    number = as.numeric(trainControlMethodRounds)
  )

  source(file.path("./scripts/grid/", sprintf("%s.R", method)))
  
  data.training.model[[method]] <- train(
    prediction ~ ., 
    data = data.training,
    method = method,
    preProcess = c(preprocessing),
    trControl = ctrl,
    tuneGrid = grid,
    metric = metric
  )

  data.training.prediction[[method]] <- predict(data.training.model[[method]], data.test)
  data.training.confusionMatrix[[method]] <- confusionMatrix(data.training.prediction[[method]],  data.test$prediction, positive = positive)
  
  metricValue <- data.training.confusionMatrix[[method]]$overall[[metric]]
  if(metricValue >= max) {
    max <- metricValue
    data.model <- data.training.model[[method]]
    data.prediction <- data.training.prediction[[method]]
    data.confusionMatrix <- data.training.confusionMatrix[[method]]
    data.params <- dfParams[row,]
  }
}
data.params
