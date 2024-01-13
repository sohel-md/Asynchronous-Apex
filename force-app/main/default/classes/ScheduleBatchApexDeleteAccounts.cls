global class ScheduleBatchApexDeleteAccounts implements Schedulable {
	
        global void execute(SchedulableContext sc){
            BatchApexDeleteAccounts b = new BatchApexDeleteAccounts();
            Database.executeBatch(b, 200);
        }
}
    