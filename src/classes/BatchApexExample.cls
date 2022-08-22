Public with sharing class BatchApexExample implements Database.Batchable<sObject>{


    Public Database.QueryLocator start(Database.BatchableContext BC){

        // collect the batches of records or objects to be passed to execute

        String query ;
        return Database.getQueryLocator(query);
    }

    Public void execute(Database.BatchableContext BC, List<Account> accList){

        for(Account acc : accList){
            acc.Name = acc.Name + 'sfdcpoint';
        }

        update accList;

    }

    Public void finish(Database.BatchableContext BC){

        // execute sending email process or anyother

        List<Messaging.Email> emailList = new List<Messaging.Email>();

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new List<String>{'Email'});
        mail.setSubject('Batch Process Completed');

        emailList.add(mail);

        Messaging.sendEmail(emailList);


        //Calling OwnerReassignment class in this Example

        OwnerReassignment ass = new OwnerReassignment();
        Id batchprocessid = Database.executeBatch(ass);

    }
}