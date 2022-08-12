/**
*  Purpose         :  This trigger is to handle all the pre and post processing operations for Account objects.
*
*  Created By      :  Nidhi kUmari
*
*  Created Date    :  07/21/2022
*
*  Revision Logs   :  V1.0 - Created - Nidhi kumari 
*
**/
trigger Trigger_Account on Account (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
             TriggerAccountHandler.accountNumberSelection(Trigger.New);
             TriggerAccountHandler.phoneNumberValidation(Trigger.New);
             TriggerAccountHandler.accountRevenue(Trigger.New);
             TriggerAccountHandler.AccountDiscount(Trigger.New, Trigger.Old);
             //TriggerAccountHandler.phoneNumberValidation(Trigger.New);
            
        }
    }

    if(Trigger.isAfter){
        if(Trigger.isInsert){
            TriggerAccountHandler.confirmationMail(Trigger.New);
            TriggerAccountHandler.afterInsertExample(Trigger.New);
        }
    }
    
    if(Trigger.isupdate){
        TriggerAccountHandler.updateCheck(Trigger.New, Trigger.Old);
    }
    
    if(Trigger.isdelete){
        TriggerAccountHandler.checkTriggerType(Trigger.newMap, Trigger.oldMap);
    }
    
}