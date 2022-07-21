/**
*  Description     :  This is Account trigger handler class.
*
*  Created By      :  Nidhi kumari
*
*  Created Date    :  07/21/2022
*
*  Revision Logs   :  V1.0 - Created - Nidhi kumari
*
**/
public class TriggerAccountHandlerClass {
    public static void accountNumberSelection(List<Account> accounts){
        //Selection Account Type
         for(Account acc:accounts){
            if(acc.Account_Type__c=='Saving Account' ){
                acc.AccountNumber='SA-'+acc.AccountNumber;
            }
            if(acc.Account_Type__c=='Fixed Account' ){
                acc.AccountNumber='FD-'+acc.AccountNumber;
            }
            if(acc.Account_Type__c=='Current Account' ){
                acc.AccountNumber='CA-'+acc.AccountNumber;
            }
             system.debug(acc.AccountNumber);
        }
    }


    public static void confirmationMail(List<Account> accounts){
        List<Messaging.Email> emailList = new List<Messaging.Email>();
        //Email Sender to the customer with confirmation of account Number and Account Type
        for(Account acc : accounts){
            Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
            mail.setToAddresses(new List<String>{acc.Email__c});
            mail.setSubject('Welcome:  '+ acc.Name);
            String body = 'Hello , Congratulation your account has been created, '+acc.Name+' With Account Number '+ acc.AccountNumber;
            mail.setHtmlBody(body);
			emailList.add(mail);
        }
        Messaging.sendEmail(emailList);
        system.debug(accounts);
    }

}