/**
*  Description     :  implementation of the Batchable interface.
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  08/22/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*
**/
public class RemoveLastName implements Database.Batchable<sObject>{
    
    public Database.QueryLocator start(Database.BatchableContext batchcontext){
        String query = 'select id,name from Account LIMIT 10';
        return Database.getQueryLocator(query);
    }
    
     /**
     * 
     *   @description    :  Execute Method of Batch Class
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 08/14/2022 - Nidhi Kumari 
     * 
     **/

    public void execute(Database.BatchableContext batchcontext,list<Account> scope){

        for(Account a:scope){
            a.name = a.name.removeEnd('sfdcpoint');
           // a.name = a.name.removeStart('stringname');
        
        }

        if(scope.size()>0){
            update scope;
            System.debug(scope);
        }
    }

     /**
     * 
     *   @description    :   Finish Method of Batch Class
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 08/14/2022 - Nidhi Kumari 
     * 
     **/

    public void finish(Database.BatchableContext batchcontext){
        
    }
}