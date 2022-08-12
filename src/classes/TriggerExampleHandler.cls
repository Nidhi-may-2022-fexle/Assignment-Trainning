/**
*  Description     :  This is handler class for Trigger_Example Trigger
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  07/27/2022
*
*  Revision Logs   :  V1.0 - Created - Nidhi kumari
*
**/
public class TriggerExampleHandler {
    
     /**
     * 
     *   @description    :  Method to insert Description When Record is created on Trigger_Example__c object
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/27/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    public static void beforeInsertExample(List<Trigger_Example__c> examples){
        //Add Description when Record is inserted
        for(Trigger_Example__c dis : examples){
            dis.Description__c = 'add new description';
        }
        system.debug('check inserted text' + examples);
    }
    
    
     /**
     * 
     *   @description    :  Method before Update on  Trigger_Example__c object
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/27/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    
    public static void beforeUpdate(List<Trigger_Example__c> examples){
        //to update Evalution When percentage is inserted 
        for(Trigger_Example__c obj : examples){
            if(obj.Evalution__c == 'Pass'){
                obj.Review__c = 'Cleared the Exam';
            }else{
                obj.Review__c = 'Fail to Clear';
            }
        }
        
    }
    
    /**
     * 
     *   @description    :  Method before delete on  Trigger_Example__c object
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/27/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    
    
    public static void beforeDelete(List<Trigger_Example__c> examples){
        //if Status is active Then we are not allowed to delete the record
        for(Trigger_Example__c obj : examples){
            if(obj.Status__c == True){
                obj.addError('Cannot be Deleted');
            }
        }
    }
    
    /**
     * 
     *   @description    :  Method before after Delete on  Trigger_Example__c object
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/27/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    
    public static void afterDelete(Map<id, Trigger_Example__c> mapexamples){
        List<Opportunity> oppObj = new List<Opportunity>();
        for(Opportunity obj : [SELECT id FROM Opportunity WHERE Trigger_Example__c IN: mapexamples.keyset()]){
            oppObj.add(obj);
        }
        delete oppObj;
        
    }
}