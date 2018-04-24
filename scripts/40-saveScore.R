generateToken <- function(n = 25) {
  a <- do.call(paste0, replicate(n, sample(LETTERS, 1, TRUE), FALSE))
  paste0(a, sprintf("%04d", sample(9999, 1, TRUE)), sample(LETTERS, 1, TRUE))
}

filename <- file.path(sprintf("%s/models",dir),sprintf("%s.rda", token))
save(data.model, file=filename)

insertSql_1 <- "INSERT INTO `ml_model_state_scores` "
insertSql_2 <- "(`token`, `ml_model_state_id`, `params`, `kappa`, `accuracy`, `confusion_matrix`, `sensitivity`, `specificity`, `precision`, `recall`, `created_at`, `updated_at`, `deleted_at`) values "
insertSql_3 <- sprintf("('%s',%s,'%s',%s ,%s ,'%s', %s, %s, %s, %s,'%s','%s',NULL)", 
                       generateToken(), 
                       data.query$ml_model_state_id, 
                       data.query$params, 
                       data.confusionMatrix$overall['Kappa'][[1]],
                       data.confusionMatrix$overall['Accuracy'][[1]],
                       toJSON(as.data.frame(data.confusionMatrix$table)),
                       data.confusionMatrix$byClass['Sensitivity'][[1]],
                       data.confusionMatrix$byClass['Specificity'][[1]],
                       data.confusionMatrix$byClass['Precision'][[1]],
                       data.confusionMatrix$byClass['Recall'][[1]],
                       Sys.time(),
                       Sys.time())

insertSql <- paste0(insertSql_1, insertSql_2, insertSql_3, seq="")
dbExecute(connection, insertSql)