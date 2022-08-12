/**
*  Purpose         :  This trigger is to handle all the pre and post processing operations for Trigger_Example__c objects.
*
*  Created By      :  Nidhi kUmari
*
*  Created Date    :  07/27/2022
*
*  Revision Logs   :  V1.0 - Created - Nidhi kumari 
*
**/
trigger Trigger_Example on Trigger_Example__c (before insert, after insert, before update, after update, before delete) {
    System.debug('Hello World!');
    
    if(Trigger.isBefore){
        if(Trigger.isInsert){
             TriggerExampleHandler.beforeInsertExample(Trigger.New);
            
        }
    }
    
    if(Trigger.isbefore){
        if(trigger.isInsert || Trigger.isupdate){
            TriggerExampleHandler.beforeUpdate(Trigger.New);
        }
    }
    
    if(Trigger.isbefore){
        if(Trigger.isdelete){
            TriggerExampleHandler.beforeDelete(Trigger.old);
        }
    }
    
    if(Trigger.isAfter){
        if(Trigger.isdelete){
            TriggerExampleHandler.afterDelete(Trigger.oldMap);
        }
    }

}