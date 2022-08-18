/**
*  Description     :  This class handele all the pre and post operation on Contact Object
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  08/14/2022
*
*  Revision Logs   :  V1.0 - Created - Nidhi Kumari
*
**/
public class ContactTriggerHandler {
    
    /**
     * 
     *   @description    :   Status on property, contact and account are in sync
     *
     *   @args           :   New Contact list and Old Contact Map
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 08/14/2022 - Nidhi Kumari 
     * 
     **/
    public static void contactPropertyaccountSync(List<Contact> contactList, Map<Id,Contact>oldMap){
        List<Account> accountList = new List<Account>();
        set<Id> setOfId = new set<Id>();
        
        for(Contact con : contactList){
            setOfId.add(con.AccountId);
        }
        Map<id,Account> accountMap = new Map <Id, Account> ([SELECT Id, Status__c, Property__r.Status__c FROM Account WHERE Id IN: setOfId]);
        
        //If Contact Status is Null and realted Account Status is Not Null Then it will copy the Account Status To Contact Status
        for(Contact con : contactList){
            if(con.Status__c == Null){
                if(accountMap.get(con.AccountId).Status__c != Null){
                    con.Status__c = accountMap.get(con.AccountId).Status__c;
                }
                
                //If Account Status is Null and realted Propert Status is Not Null Then it will fill the Account Status
                
                if(accountMap.get(con.AccountId).Status__c == Null ){
                    if(accountMap.get(con.AccountId).Property__r.Status__c != null){
                        con.Status__c = accountMap.get(con.AccountId).Property__r.Status__c;
                        
                    }
                }
            }
        }              
    }

}