trigger Trigger_Opportunity on Opportunity (after insert, after update) {
    
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate){
               TriggerOpportunityHandler.automobileRecord(Trigger.New, Trigger.oldMap);
               //TriggerOpportunityHandler.emailSentToOwner(Trigger.New, Trigger.oldMap);
        }
    }

}