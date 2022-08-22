/**
*  Description     :  Execute Future Method
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  08/22/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*
**/
public with sharing class FutureMethodClass {

       /**
     * 
     *   @description    :  To execute all method of this class
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/08/2017 - Nidhi Kumari
     *		              
     * 
     **/
    
    public void callAllMethod(){
        futureMethod();
        toDebugWithoutFutureMethod();
        methodWithCallOut();
    }

       /**
     * 
     *   @description    :  Debug With Future Method
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/08/2017 - Nidhi Kumari
     *		              
     * 
     **/
    @future
    public static void futureMethod() {
        System.debug('Print first Future Method');

    }
    
       /**
     * 
     *   @description    :  Debug without future method
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/08/2017 - Nidhi Kumari
     *		              
     * 
     **/
    public static void toDebugWithoutFutureMethod(){
        system.debug('Debug Without Future Methode Use');
        
    }

       /**
     * 
     *   @description    :  future method with call out
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/08/2017 - Nidhi Kumari
     *		              
     * 
     **/
    
    //We can also apply future methods to isolate DML operations on differents Object types to prevent the mixed DML error.

    @future(CallOut=True)
    public static void methodWithCallOut(){
        
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        UserRole u = [SELECT Id FROM UserRole WHERE Name='COO'];
  
        User newUser = new User(firstName = 'Future', LastName = 'Method',
                                alias = 'al',Username = 'jo@acme.com' ,Email = 'john@acme.com',TimeZoneSidKey ='America/Los_Angeles',
                                LocaleSidKey = 'en_US',ProfileId =p.Id,
                                emailencodingkey='UTF-8',languagelocalekey='en_US',
                                userroleid = u.Id);
        insert newUser;
        system.debug('--' + newUser);
    }
}