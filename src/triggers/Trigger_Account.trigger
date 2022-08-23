trigger Trigger_Account on Account (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            
            AccountTriggerHandler.accountPropertyContactSync(Trigger.New, Trigger.oldMap);
            
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