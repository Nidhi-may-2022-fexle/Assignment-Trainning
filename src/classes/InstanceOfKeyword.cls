/**
*  Description     :  Instance of keyword
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  06/29/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				   
*
**/
public with sharing class InstanceOfKeyword {

      /**
     * 
     *   @description    :   Method for instance of key word
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/29/2022 - Developer Name - Nidhi Kumari
     * 
     **/

    public InstanceOfKeyword() {
        sObject s = new Account();

        if (s instanceOf Account){
            Account acc = new Account();
        }
        else if(s instanceOf Contact){
            Contact contacts = (Contact)s;
        }

    }
}