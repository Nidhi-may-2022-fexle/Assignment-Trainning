public class students {
    public static void studentsList(){
        STUDENT__c a1 = new STUDENT__c();
        a1.Name = 'hey';
        a1.Roll_Number__c = 555;
        a1.Father_Name__c = 'Ram';
        a1.account_Mobile_Number__c = '5451251222';
        a1.Father_Mobile_Number__c = '4425445221';
        a1.Address__c = 'meerut,UP';
        a1.Bank_Name__c = 'SBI';
        a1.Bank_Phone_Number__c ='7544582754';
        a1.City__c = 'Meerut';
        a1.Class_Info__c = '2nd year';
        a1.Email__c = 'ram234@gmail.com';
        a1.IFSC_Code__c = 'usbc7464';
        a1.State__c = 'UP';
        
        
        insert a1;
        
        List<STUDENT__c> studentList = [select ID, Name, Roll_Number__c from STUDENT__c order by createdDate DESC LIMIT 5];
        for(STUDENT__c student : studentList){
            system.debug('student list' + a1);
        }
        
    }

}