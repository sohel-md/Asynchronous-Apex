public class BatchApexWithStatefulExample implements Database.batchable<Sobject>,Database.Stateful{
    public integer count = 0;
    public Database.QueryLocator start(Database.BatchableContext bc){
    String str ='select id,Name,Description from Account';
    return Database.getQueryLocator (str);
    }
    
    public void execute(Database.BatchableContext bc, List<Account> accs){
    for(Account a :accs){
    a.Description = 'Description added by BatchApexWithStatefulExample !'; 
    }
     
    try{
          
    database.saveresult[] ds =  Database.update(accs,false);
        for(database.SaveResult d : ds){
            if(d.issuccess()){
                count++;
            }
            
        }
    }
    catch(exception e){
    system.debug('update failed');
    }
    }
    
    public void finish(Database.BatchableContext bc){
        system.debug(count);
    //Send an email to the User after your batch completes
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    String[] toAddresses = new String[] {'sohailmd60@gmail.com'};
    mail.setToAddresses(toAddresses);
    mail.setSubject('Batch Apex Job is done');
    mail.setPlainTextBody('Total' +'  '+ count +'  '+ 'Records updated sucessfully');
    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
    }
    
    /*
    Execution of batch job:     
    BatchApexWithStatefulExample b = new BatchApexWithStatefulExample();
    Database.executeBatch(b);
    */    