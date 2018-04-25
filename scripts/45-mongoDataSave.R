mongoCon <- mongo(collection = "ml_model_prediction_score", db = "labrat")
mongoCon$insert(as.data.frame(data.prediction))
