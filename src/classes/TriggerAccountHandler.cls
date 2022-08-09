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
                acc.AccountNumber='CA-'+randomNumber;

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
    
    
    public static void updateCheck(List<Account> newaccounts, List<Account> oldaccounts){
        system.debug('Check Update List ::: Trigger.New ' + newaccounts);
        system.debug('Check Update List ::: Trigger.Old ' + oldaccounts);
    }
    
    public static void checkTriggerType(Map<Id, Account> newMap, Map<Id, Account> oldMap){
        system.debug('Check ::: Trigger.NewMap ' + newMap);
        system.debug('Check ::: Trigger.OldMap ' + oldMap);
    }
    
    
    /**
     * 
     *   @description    :  Method to insert contact if account is inserted with the Name 
     * 
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/28/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    
    public static void afterInsertExample(List<Account> acc){
        List<contact> conList =new List<contact>();
        for(Account obj:acc){
            contact con=new contact();
            con.FirstName='Testing contact';
            con.LastName='Last Name';
            con.AccountId=obj.id;
            conList.add(con);
        }
        if(conList.size() > 0){
            insert conList;
        }
    }
    
    /**
     * 
     *   @description    :  According to annual revenue change account type
     * 
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 08/04/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    
    public static void accountRevenue(List<Account> accList){
        for(Account acc : accList){
            if(acc.AnnualRevenue >= 1000000000){
                acc.Type = 'Strategic Account';
            }
            else if(acc.AnnualRevenue >1000000000 && acc.AnnualRevenue <1000000000){
                acc.Type = 'Growth Account';
            }
        }
        system.debug(accList);
        
    }
    
     /**
     * 
     *   @description    :  is field will update with trigger.old or not
     * 
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 08/04/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    
    public static void AccountDiscount(List<Account> accList, List<Account> olAccList){
        Integer count = 0;
        for(Account acc : accList){
            if(acc.AnnualRevenue!=olAccList[count].AnnualRevenue && acc.AnnualRevenue>100000000){
                acc.Discount__c = 50;
            }
            count++;
        }
        system.debug(accList);
    }
    
     /**
     * 
     *   @description    :  Phone number Validation
     * 
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 08/04/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    
    public static void phoneNumberValidation(List<Account> accList){
        for(Account acc : accList){
           String phone = acc.Phone;
            if(phone.length() > 10){
                acc.Phone.AddError('Enter Valid Phone Number');
            }
        }
    }
        
}


/*
 * DML operation cann't performed on Trigger.New and Trigger.Old 
 * We use Trigger.New and Trigger.old in Trigger.isBefore and Trigger.isAfter operations
 * Before triggers are used to performe the logic on the same object and trigger fired before the data save into the database
 * 
 */