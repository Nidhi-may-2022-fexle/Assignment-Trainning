/**
*  Description     :  implementation of the Queueable interface.
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  08/22/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*
**/
public with sharing class QueueableExample implements Queueable{

    /**
     * 
     *   @description    :   Method to Update record in account
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 08/14/2022 - Nidhi Kumari 
     * 
     **/
    
    public void Execute(QueueableContext context){
        Account acc = [SELECT Id, Name FROM Account WHERE Name = 'Acme'];
        acc.Name = acc.Name + 'Update';

        update acc;
        System.debug('acc update --->' + acc);

    }
}