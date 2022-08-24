/**
*  Description     :  Schedulable Class for BatchApexExample Class
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  08/22/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*
**/
global class scheduledBatchableClass implements Schedulable{

    global void execute(SchedulableContext sc){

        BatchApexExample be = new BatchApexExample();
        Database.executeBatch(be);

    }
}