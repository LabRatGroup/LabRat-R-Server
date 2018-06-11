#print('############### Saving model score');

filename <- file.path(sprintf("%s/models",dir),sprintf("%s.rda", token))
saveRDS(data.model, file=filename)

data.stats <- as.data.frame(data.confusionMatrix$byClass)

if(dim(data.confusionMatrix$table)[1]*dim(data.confusionMatrix$table)[2] == 4){
  sensitivity <- data.stats[1,1]
  specificity <- data.stats[2,1]
  precision <- data.stats[5,1]
  recall <- data.stats[6,1]
} else{
  sensitivity <- data.stats[paste0('Class: ',dfParams$positive),1]
  specificity <- data.stats[paste0('Class: ',dfParams$positive),2]
  precision <- data.stats[paste0('Class: ',dfParams$positive),5]
  recall <- data.stats[paste0('Class: ',dfParams$positive),6]
}

insertSql_1 <- "INSERT INTO `ml_model_state_scores` "
insertSql_2 <- "(`results`, `token`, `ml_model_state_id`, `params`, `kappa`, `accuracy`, `confusion_matrix`, `sensitivity`, `specificity`, `precision`, `recall`, `created_at`, `updated_at`, `deleted_at`) values "
insertSql_3 <- sprintf("('%s','%s',%s,'%s',%s ,%s ,'%s', %s, %s, %s, %s,'%s','%s',NULL)", 
                       toJSON(data.model$results),
                       data.query$token, 
                       data.query$id, 
                       toJSON(data.params), 
                       data.confusionMatrix$overall['Kappa'][[1]],
                       data.confusionMatrix$overall['Accuracy'][[1]],
                       toJSON(as.data.frame(data.confusionMatrix$table)),
                       sensitivity,
                       specificity,
                       precision,
                       recall,
                       Sys.time(),
                       Sys.time())

insertSql <- paste0(insertSql_1, insertSql_2, insertSql_3, seq="")
dbExecute(connection, insertSql)

data.algorithm <- dbGetQuery(connection, sprintf("SELECT cast(id as CHAR(25)) as id FROM ml_algorithms WHERE alias = '%s'", data.params$method))


if(index > 1){
  updateSQL <- sprintf("UPDATE ml_model_states set ml_algorithm_id = %s, params = '%s' WHERE id = %s", data.algorithm$id, toJSON(data.params), data.query$id)
  dbExecute(connection, updateSQL)
}
