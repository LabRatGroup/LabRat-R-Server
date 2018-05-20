filename <- file.path(sprintf("%s/models",dir),sprintf("%s.rda", token))
saveRDS(data.model, file=filename)

data.stats <- as.data.frame(data.confusionMatrix$byClass)

insertSql_1 <- "INSERT INTO `ml_model_state_scores` "
insertSql_2 <- "(`results`, `token`, `ml_model_state_id`, `params`, `kappa`, `accuracy`, `confusion_matrix`, `sensitivity`, `specificity`, `precision`, `recall`, `created_at`, `updated_at`, `deleted_at`) values "
insertSql_3 <- sprintf("('%s','%s',%s,'%s',%s ,%s ,'%s', %s, %s, %s, %s,'%s','%s',NULL)", 
                       toJSON(data.model$results),
                       data.query$token, 
                       data.query$ml_model_state_id, 
                       toJSON(data.params), 
                       data.confusionMatrix$overall['Kappa'][[1]],
                       data.confusionMatrix$overall['Accuracy'][[1]],
                       toJSON(as.data.frame(data.confusionMatrix$table)),
                       data.stats[paste0('Class: ',dfParams$positive),1],
                       data.stats[paste0('Class: ',dfParams$positive),2],
                       data.stats[paste0('Class: ',dfParams$positive),5],
                       data.stats[paste0('Class: ',dfParams$positive),6],
                       Sys.time(),
                       Sys.time())

insertSql <- paste0(insertSql_1, insertSql_2, insertSql_3, seq="")
dbExecute(connection, insertSql)
