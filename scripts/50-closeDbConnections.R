#print('############### Closing DB connections');

lapply( dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)
