/**
*  Description     :  implementation of the Batchable interface.
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  08/22/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*
**/
Public with sharing class BatchApexExample implements Database.Batchable<sObject>{

    /**
     * 
     *   @description    :   start Method of Batch Class
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 08/14/2022 - Nidhi Kumari 
     * 
     **/


    Public Database.QueryLocator start(Database.BatchableContext BC){

        // collect the batches of records or objects to be passed to execute

        String query = 'SELECT Id, Name From Account LIMIT 5';
        return Database.getQueryLocator(query);
    }

    /**
     * 
     *   @description    :  Execute Method of Batch Class
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 08/14/2022 - Nidhi Kumari 
     * 
     **/

    Public void execute(Database.BatchableContext BC, List<Account> accList){
        
        List<Account> accountList = new List<Account>();

        for(Account acc : accList){
            acc.Name = acc.Name + 'sfdcpoint';
            accountList.add(acc);
        }

        update accountList;

    }

    /**
     * 
     *   @description    :   Finish Method of Batch Class
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 08/14/2022 - Nidhi Kumari 
     * 
     **/

    Public void finish(Database.BatchableContext BC){

        // execute sending email process or anyother

        List<Messaging.Email> emailList = new List<Messaging.Email>();

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new List<String>{'Email@gmail.com'});
        mail.setSubject('Batch Process Completed');

        emailList.add(mail);

        Messaging.sendEmail(emailList);


        //Calling OwnerReassignment class in this Example

        OwnerReassignment ass = new OwnerReassignment();
        Id batchprocessid = Database.executeBatch(ass);

    }
}