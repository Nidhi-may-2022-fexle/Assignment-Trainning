trigger Trigger_District on District__c (after insert, after update, after delete, after undelete) {
    if(Trigger.IsAfter){
        if(Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete || Trigger.isUndelete){
            DistrictTriggerHandler.countDistrictOnState(Trigger.New, Trigger.Old);
            DistrictTriggerHandler.stateJsonDAta(Trigger.New, Trigger.Old);
            
        }
    }

}