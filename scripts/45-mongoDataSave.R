#print('############### Saving pedictions');
mongoUrl = sprintf("mongodb://%s:%s@127.0.0.1:%s/labrat", data.env$mongoUser, data.env$mongoPassword, data.env$mongoPort)
mongoCon <- mongo(collection = "ml_model_prediction_score", url = mongoUrl)
mongoCon$remove(sprintf('{"ml_model_prediction_data_id" : %s}', data.query$id))
mongoCon$count()
mongoCon$insert(as.data.frame(data.prediction))
