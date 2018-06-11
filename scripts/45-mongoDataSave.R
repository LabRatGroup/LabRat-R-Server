#print('############### Saving pedictions');
mongoUrl = sprintf("mongodb://%s:%s@%s:%s/%s", data.env$mongoUser, data.env$mongoPassword, data.env$mongoHost, data.env$mongoPort, data.env$mongoDb)
mongoCon <- mongo(collection = "ml_model_prediction_score", url = mongoUrl)
mongoCon$remove(sprintf('{"ml_model_prediction_data_id" : %s}', data.query$id))
mongoCon$count()
mongoCon$insert(as.data.frame(data.prediction))
