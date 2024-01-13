public class QueueableApexExample implements Queueable {
    public List<Account> accList ; 
    public QueueableApexExample(List<Account> accList){
        this.accList = accList ;  
    }
    public void execute(QueueableContext context) {
        for(Account acc :accList){
            // Update the Account Details 
            acc.Name = acc.Name + 'Test';
            acc.Description = 'Test';
        }
        update accList;
    }
}
