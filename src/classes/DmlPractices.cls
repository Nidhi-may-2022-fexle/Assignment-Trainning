/**
*  Description     :  Practices on DML, Updating recorde, inserting,deleting,upserting
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  07/10/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				    . 
*
**/
public with sharing class DmlPractices {
     /**
     * 
     *   @description    :  Updating Contact List
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/11/2022 - Developer Name - Nidhi Kumari
     * 
     **/

    public static void updateContactList() {
        List<Contact> updatedList = new List<Contact>();
        List<Contact> contactList = [Select Department , Description from Contact];
        for(Contact contact : contactList){
            if (contact.Department == 'Finance'){
                contact.Description = 'New description';
                updatedList.add(contact);
            }
        }
        update updatedList;
        System.debug(updatedList);
        System.debug(contactList);

    }

/**
     * 
     *   @description    :  Adding and retriving Data 
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/11/2022 - Developer Name - Nidhi Kumari
     * 
     **/

    //Adding and Retrieving Data With DML
    public static void addingAndRetrievingData(){
        // Query existing Student
       Student__c student = [SELECT Name,City__c FROM Student__c  WHERE Name='Student Name' LIMIT 1];
        System.debug('Student Name before update: ' + student.Name);
        System.debug('Student City before update: ' + student.City__c);
        student.Name = 'Shyam';
        student.City__c = 'Meerut';
        System.debug(student);

        update student;
        system.debug(student);
        // Get a new copy of the students from the database with the two fields.
        Student__c a = [SELECT Name,City__c FROM Student__c  WHERE Name='Shyam' LIMIT 1];
        System.assertEquals('Shyam', student.Name);
        System.assertEquals('Meerut', student.City__c);
        System.debug(student);


    }


    /**
     * 
     *   @description    :  Inserting and updating recorde 
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/11/2022 - Developer Name - Nidhi Kumari
     * 
     **/


    //Inserting and Updating Records
    public static void InsertingAndUpdatingRcorde(){
        Student__c[] student = new List<Student__c>();
        for(Integer i=0;i<3;i++){
            Student__c s = new Student__c(Name='Acme' + i, City__c='Meerut');
            student.add(s);
        }
        Student__c studentUpdate;
        try{
            insert student;  
            studentUpdate =  [SELECT City__c FROM Student__c  WHERE Name='Acme2' AND City__c='Meerut' LIMIT 1];
         // Update the billing city.
         studentUpdate.City__c = 'Greater';
        // Make the update call.
        update studentUpdate;


        }
        catch(DmlException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
        Student__c afterUpdate =  [SELECT City__c FROM Student__c WHERE Id=:studentUpdate.Id];
        System.assertEquals('Greater', afterUpdate.City__c);
        system.debug(afterUpdate);
    }

    
    /**
     * 
     *   @description    :  Inserting Related Records 
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/11/2022 - Developer Name - Nidhi Kumari
     * 
     **/

    //Inserting Related Records
    public static void insertingRelatedRecords(){
        Account[] accts = new List<Account>();
        try{
            Account acct = new Account(Name='SFDC Account');
            insert acct;
            ID acctID = acct.ID;
            Contact con = new Contact(FirstName='Joe', LastName='Smith', Phone='415.555.1212', AccountId=acctID);
            insert con;
        }
        catch(DmlException e){
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
        System.debug(accts);
    }

    /**
     * 
     *   @description    :  Updating Related Records
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/11/2022 - Developer Name - Nidhi Kumari
     * 
     **/

    //Updating Related Records
    public static void updatingRelatedRecords(){
        Account[] accts = new List<Account>();
        try{
            // Query for the contact, which has been associated with an account.
            Contact queriedContact = [SELECT Account.Name  FROM Contact  WHERE FirstName = 'Joe' AND LastName='Smith' LIMIT 1];
            // Update the contact's phone number
            queriedContact.Phone = '415.555.1213';
            // Update the related account industry
            queriedContact.Account.Industry = 'Technology';

            update queriedContact;
            system.debug('99 -> ' + queriedContact.Id);


        }
        catch(Exception e){
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }

    }

    /**
     * 
     *   @description    : Relating Records by Using an External ID
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/11/2022 - Developer Name - Nidhi Kumari
     * 
     **/


    //Relating Records by Using an External ID
    public static void relatingRecords(){
        Opportunity newOpportunity = new Opportunity( Name='OpportunityWithAccountInsert', StageName='Prospecting', CloseDate=Date.today().addDays(7));
        Account accountReference = new Account(MyExtID__c='SAP111111');

        newOpportunity.Account = accountReference;
        Database.SaveResult results = Database.insert(newOpportunity);
        System.debug(newOpportunity);
        System.debug(accountReference);
    }


    /**
     * 
     *   @description    : Inserting records
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/11/2022 - Developer Name - Nidhi Kumari
     * 
     **/

    public static void insertingRecords(){
        Account acct = new Account(Name= 'Account Name', Phone = '5455248425', BillingCity= 'Delhi');

        insert acct;
        ID acctID = acct.ID;
        System.debug(acct);
    }

    /**
     * 
     *   @description    : Deleting records
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/11/2022 - Developer Name - Nidhi Kumari
     * 
     **/


    public static void deletingRecords(){

        Account [] acct = [SELECT Id, Name FROM Account WHERE Name = 'Account Name'];
        try{
            delete acct ;
        }catch (DmlException e){
            System.debug('An unexpected error has occurred: ' + e.getMessage());

        }
    }


    /**
     * 
     *   @description    : Upserting Record
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/11/2022 - Developer Name - Nidhi Kumari
     * 
     **/


    //Upserting Records
    public static void upsertingRecords(){
        List<Student__c> studentList = [SELECT Name,City__c FROM Student__c];
        studentList[0].Name = 'studentList';

        Student__c studentName = new Student__c();
        studentName.Name = 'Smith';

        studentList.add(studentName);

        try{
            upsert studentList;
            System.debug(studentList);

        }catch(DmlException e){
            System.debug('Exeception' + e);
        }

    }

}