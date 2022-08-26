trigger Trigger_Property on Property__c (before insert) {
    
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            PropertyTriggerHandler.PropertyContactaccountSync(Trigger.New, Trigger.OldMap);
            
        }
    }

}