trigger Trigger_State on State__c (after insert, after update, after delete, after undelete) {
    
    if(Trigger.IsAfter){
        if(Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete || Trigger.isUndelete){
            StateTriggerHandler.countStateOnCountry(Trigger.New, Trigger.old);
            StateTriggerHandler.countryJsonDataFill(Trigger.New, Trigger.Old);
        }
    }

}