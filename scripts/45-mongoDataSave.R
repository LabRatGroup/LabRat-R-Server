#print('############### Saving pedictions');

mongoCon <- mongo(collection = "ml_model_prediction_score", db = "labrat")
mongoCon$remove(sprintf('{"ml_model_prediction_data_id" : %s}', data.query$id))
mongoCon$count()
mongoCon$insert(as.data.frame(data.prediction))
