/**
*  Description     :  This class is to refer to the LWC Component to get Account Detail and Related Contact and Cased
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  09/02/2022
*
*  Revision Logs   :  V1.0 - Created - Nidhi Kumari
*
**/
public class AccountRelatedContact {

    /**
     * 
     *   @description    :   Method to get Account Record
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 09/02/2022 - Nidhi Kumari 
     * 
     **/
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(){
        List<Account> accountList = [SELECT Id, Name FROM Account LIMIT 5];
        return accountList;
    }

    /**
     * 
     *   @description    :   Method to get Account Related Contact Record
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 09/02/2022 - Nidhi Kumari 
     * 
     **/
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContact(String accId){
        List<Contact> contactList = [SELECT Id, FirstName, LastName FROM Contact WHERE AccountId =: accId LIMIT 5];
        return contactList;
    }

    /**
     * 
     *   @description    :   Method to get Account related Case Record
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 09/02/2022 - Nidhi Kumari 
     * 
     **/
    
    @AuraEnabled(cacheable=true)
    public static List<Case> getCase(String accId){
        List<Case> caseList = [SELECT Id, SuppliedName, Status FROM Case WHERE AccountId =: accId];
        return caseList;
    }

    /**
     * 
     *   @description    :   Method to get Account related Opporunity Record
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 09/02/2022 - Nidhi Kumari 
     * 
     **/

    @AuraEnabled
    public static List<Opportunity> getOpportunity(String accId){
        List<Opportunity> opportunityList = [SELECT Id, Name FROM Opportunity WHERE AccountId =: accId LIMIT 5];
        return opportunityList;
        
    }

}