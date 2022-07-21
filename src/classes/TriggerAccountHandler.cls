/**
*  Description     :  This is Account trigger handler class.
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  07/21/2022
*
*  Revision Logs   :  V1.0 - Created - Nidhi kumari
*
**/
public class TriggerAccountHandler {

    
     /**
     * 
     *   @description    :  Method to select account Type and Assign Account Number
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/21/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    public static void accountNumberSelection(List<Account> accounts){
        //Using Random Number for assigning as Account Number
        Integer randomNumber = Integer.Valueof((Math.random() * 1000));
        //Selection of Account Type
         for(Account acc:accounts){
            if(acc.Account_Type__c=='Saving Account' ){
                acc.AccountNumber='SA-'+randomNumber;
            }
            if(acc.Account_Type__c=='Fixed Account' ){
                acc.AccountNumber='FD-'+randomNumber;
            }
            if(acc.Account_Type__c=='Current Account' ){

            }
             system.debug(acc.AccountNumber);
        }
    }

    /**
     * 
     *   @description    :  Method for creating Email and sending email to 
     *                                    the customer with confirmation of account Number and Type of account
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/21/2022 - Developer Name - Nidhi Kumari
     * 
     **/


    public static void confirmationMail(List<Account> accounts){
        List<Messaging.Email> emailList = new List<Messaging.Email>();
        //creating Email to the customer with confirmation of account Number and Account Type
        for(Account acc : accounts){
            Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
            mail.setToAddresses(new List<String>{acc.Email__c});
            mail.setSubject('Dear,' +acc.Name + ' Your Account Has been Created, Please Find the detail below ');
            String body = 'Hello there, Congratulation your account has been created, '+acc.Name+' With Account Number '+ acc.AccountNumber;
            mail.setHtmlBody(body);
			emailList.add(mail);
        }
            //sending mail with account Number to customer
        if(emailList.size() > 0){
             Messaging.sendEmail(emailList);
             system.debug(accounts);
            
        }
        

            
        }
        
}