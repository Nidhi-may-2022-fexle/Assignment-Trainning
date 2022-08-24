/**
*  Description     :  The following class uses batch Apex to reassign all accounts owned by a specific user to a different user.
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  08/22/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*
**/

//batch Apex to reassign all accounts owned by a specific user to a different user.

public with sharing class OwnerReassignment implements Database.Batchable<sObject>{
   
    String query;
    String email;
    Id toUserId;
    Id fromUserId;

       /**
     * 
     *   @description    :  Start Method
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/08/2017 - Nidhi Kumari
     *		              
     * 
     **/

    public Database.querylocator start(Database.BatchableContext BC){

        return Database.getQueryLocator(query);

    }

       /**
     * 
     *   @description    :  Execute Method
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/08/2017 - Nidhi Kumari
     *		              
     * 
     **/

    public void execute(Database.BatchableContext BC, List<sObject> scope){
        List<Account> accns = new List<Account>();

        for(sObject s : scope){
            Account a = new Account();
            
            if(a.OwnerId==fromUserId){
                a.OwnerId=toUserId;
                accns.add(a);
            }
        }

        if(accns.size()>0){
            update accns;
        }

    }

       /**
     * 
     *   @description    :  Finish Method
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/08/2017 - Nidhi Kumari
     *		              
     * 
     **/

    public void finish(Database.BatchableContext BC){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] {email});
        mail.setReplyTo('batch@acme.com');
        mail.setSubject('Batch Process Completed');
        mail.setPlainTextBody('Batch Process has completed');

        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }

}