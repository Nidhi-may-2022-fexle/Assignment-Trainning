/**
*  Description     :  This class handele all the pre and post operation on Property__c Object
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  08/17/2022
*
*  Revision Logs   :  V1.0 - Created - Nidhi Kumari
*
**/

public class PropertyTriggerHandler {
    
        /**
     * 
     *   @description    :   Status on property, contact and account are in sync
     *
     *   @args           :   New Property__c list and Old Property__c Map
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 08/17/2022 - Nidhi Kumari 
     * 
     **/
    
    public static void PropertyContactaccountSync(List<Property__c> propertyList, Map<Id,Property__c>oldMap){
        Set<Id> setOfIds = new Set<Id>();
        
        for(Property__c property : propertyList){
            setOfIds.add(property.Account__c);
        }
        
        Map<id,Account> accountMap = new Map <Id, Account> ([SELECT Id, Status__c, Property__r.Status__c FROM Account WHERE Id IN: setOfIds]);
        for(Property__c property : propertyList){
            if(property.Status__c == Null){
                if(accountMap.get(property.Account__c).Property__r.Status__c != Null){
                    property.Status__c = accountMap.get(property.Account__c).Status__c;
                }
            }
        }
        
    }

}