global class BatchApexDeleteAccounts implements Database.Batchable<sObject> {
	
        global Database.QueryLocator start(Database.BatchableContext bc){
            return Database.getQueryLocator('SELECT Id FROM Account WHERE CreateDate < LAST_N_DAYS:7');
        }
        
        global void execute(Database.BatchableContext bc, List<Account> accts){
            if(!accts.isEmpty){
                try {
                    Database.Delete(accts, false);
                }
                catch(Exception ex){
                    System.debug('Exception occurred '+ex);
                }
            }
        }
        
        global void finish(Database.BatchableContext bc){
            
        }
}
    