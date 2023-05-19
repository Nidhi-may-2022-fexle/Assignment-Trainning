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
        
        //set of Account With Property Id
        set<Id> setOfIds = new set<Id>();
        for(Account acc : accountList){
            setOfIds.add(acc.Property__c);
 
        }
        system.debug('ids---' + setOfIds);
        
        Map<Id,Property__c> propertyMap = new Map<Id,Property__c>([SELECT Id, Name, Status__c FROM Property__c where Id IN :setOfIds]);
        
        //if Account status is null fill the status with related Property__c
        for(Account acc : accountList){
            if(acc.Status__c == Null){
                if(propertyMap.get(acc.Property__c).Status__c != Null){
                    acc.Status__c = propertyMap.get(acc.Property__c).Status__c;
                }
            }
            
        }
    }

}