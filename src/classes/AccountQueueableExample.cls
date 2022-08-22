/**
*  Description     :  implementation of the Queueable interface.
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  08/22/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*
**/
public class AccountQueueableExample implements Queueable {
    public List<Account> accList ; 
    public AccountQueueableExample(List<Account> accList){

        this.accList = accList ;
    }

       /**
     * 
     *   @description    :  The execute method  inserts a new account
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/08/2017 - Nidhi Kumari
     *		              
     * 
     **/

    public void execute(QueueableContext QC){

        for(Account acc :accList){
            // Update the Account Name 
            acc.Name = acc.Name + 'sfdcpoint';
        }

        update accList;
        System.debug('account List---->' + accList);
    }

    public void execute2(QueueableContext context) {
        Account a = new Account(Name='Acme',Phone='(415) 555-1212');
        
        insert a;
    }
}