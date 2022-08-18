trigger Trigger_Contact on Contact (before insert , after insert) {
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            ContactTriggerHandler.contactPropertyaccountSync(Trigger.New, Trigger.OldMap);
            //TriggerContactHandler.duplicateRecord(Trigger.New);
        }
    }

}