/**
*  Description     :  Creating Parent and Child Records in a Single Statement Using Foreign Keys
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  07/10/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				    
*
**/
public with sharing class ParentandChildRecords {

    /**
     * 
     *   @description    : Creating Parent and Child Records in a Single Statement Using Foreign Keys
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/11/2022 - Developer Name - Nidhi Kumari
     * 
     **/


    public static void InsertParentChild(){
        Date dt = Date.today();
        dt = dt.addDays(7);
        Opportunity newOpportunity = new Opportunity( Name='OpportunityWithAccountInsert', StageName='Prospecting',  CloseDate=dt);

        // Create the parent reference. Used only for foreign key reference, and doesn't contain any other fields.
        Account accountReference = new Account( MyExtID__c='SAP111111');                
        newOpportunity.Account = accountReference;

        // Create the Account object to insert. 
        Account parentAccount = new Account( Name='Hallie', MyExtID__c='SAP111111');
         // Create the account and the opportunity.
        Database.SaveResult[] results = Database.insert(new SObject[] { parentAccount, newOpportunity });
        for (Integer i = 0; i < results.size(); i++){
            if (results[i].isSuccess()){
                System.debug('Successfully created ID: ' + results[i].getId());
            }else{
                System.debug('Error: could not create sobject ' + 'for array element ' + i + '.');
                System.debug('   The error reported was: ' + results[i].getErrors()[0].getMessage() + '\n');
            }
        }

    }
}