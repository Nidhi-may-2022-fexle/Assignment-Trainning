/**
*  Description     :  This class handele all the pre and post operation on Account Object
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  08/16/2022
*
*  Revision Logs   :  V1.0 - Created - Nidhi Kumari
*
**/
public class AccountTriggerHandler {
    
    /**
     * 
     *   @description    :   Status on property, contact and account are in sync
     *
     *   @args           :   New Account list and Old Account Map
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 08/16/2022 - Nidhi Kumari 
     * 
     **/
    
    public static void accountPropertyContactSync(List<Account> accountList, Map<Id, Account> oldMap){
        set<Id> setOfIds = new set<Id>();
        for(Account acc : accountList){
            setOfIds.add(acc.Property__c);
 
        }
        
        Map<Id,Contact> contactMap = new Map<Id,Contact>([Select Id, Status__c, AccountId, Account.Property__r.Status__c from Contact where AccountId IN :setOfIds]);
        
        for(Contact con : contactMap.values()){
            if(con.Status__c == Null){
                con.Status__c = contactMap.get(con.AccountId).Status__c;
            }
            else if(contactMap.get(con.Account.Property__r.Status__c).Status__c == Null){
                con.Account.Property__r.Status__c = contactMap.get(con.AccountId).Status__c;
            }
        }
    }

}