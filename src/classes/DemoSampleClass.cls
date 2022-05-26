public class DemoSampleClass {
    public List<Contact> ContactList{get;set;}
    
    public void getContactDetails(){
        contactList = [select id, name, isDeleted from contact where isDeleted = true All Rows];
    }
    
    Public static void getContactDetails1(){
        List<Contact> ContactList1 = [select id, name, isDeleted from Contact where isDeleted = true ALL Rows];
        System.debug('Check Deleted Data :::' + ContactList1);
    }

}