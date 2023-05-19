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

    /**
     * 
     *   @description    :   Method to insert record in account
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 08/14/2022 - Nidhi Kumari 
     * 
     **/

    public void execute(QueueableContext context) {
        Account a = new Account(Name='Acme insert1',Phone='4888-555-1212');
        
        insert a; 

        system.debug('insert --->' + a);

        System.enqueueJob(new QueueableExample());
    }
}