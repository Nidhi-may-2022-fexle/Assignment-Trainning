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
trigger Trigger_Account on Account (before insert, after insert) {
    if(Trigger.isBefore){
        TriggerAccountHandlerClass.accountNumberSelection(Trigger.New);
    }

    if(Trigger.isInsert && Trigger.isAfter){
        TriggerAccountHandlerClass.confirmationMail(Trigger.New);
    }

}