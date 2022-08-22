/**
*  Description     :   batch Apex class for deleting records
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  08/22/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*
**/

public class BatchDelete implements Database.Batchable<sObject> {
    public String query;

    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext BC, List<sObject> scope){
        delete scope;
        DataBase.emptyRecycleBin(scope);
    }

    public void finish(Database.BatchableContext BC){

    }
}