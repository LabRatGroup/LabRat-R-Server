# Querying data from MySQL
data.query <- dbGetQuery(connection, sprintf("SELECT * FROM ml_model_state_training_datas WHERE token = '%s'", token))

# Retrieving data for model analysis
data.params <- fromJSON(data.query$params)
dir <- paste(data.env$dataDir,"/",data.env$sftpUser, sep="")
data.raw <- read.csv(file.path(dir, data.query$file_path), header=TRUE, sep = ";", dec = ",")


#Create model
set.seed(123)
data.in_train <- createDataPartition(data.raw$prediction, p = 0.67, list = FALSE)
data.training <- data.raw[data.in_train, ]
data.test <- data.raw[-data.in_train, ]

ctrl <- trainControl(
  method = data.params$control$trainControlMethod, 
  number = data.params$control$trainControlMethodRounds
)

source(file.path("./scripts/grid/", sprintf("%s.R", data.params$method)))

data.model <- train(
  prediction ~ ., 
  data = data.training, 
  method = data.params$method,
  preProcess = c(data.params$preprocessing),
  trControl = ctrl,
  tuneGrid = grid,
  metric = data.params$metric
)

data.prediction <- predict(data.model, data.test)
data.confusionMatrix <- confusionMatrix(data.prediction,  data.test$prediction, positive = data.params$positive)

