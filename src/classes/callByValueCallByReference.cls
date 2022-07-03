/**
*  Description     :    call by Value And Call by Reference
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  06/25/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				    . 
*
**/
public with sharing class callByValueCallByReference {
    
    public static void ExampleC (){
        Student__c s1 = new Student__c();
        Integer intI = 10;
        manipulateReferenes(s1);
        System.debug('Check Student Name...' + s1.Name);
        checkCallByValue(intI);
        System.debug('Check Int....' + intI);
    }
    public static void manipulateReferenes(Student__c stData){
        for(Integer i=0; i<10; i++){
            stData.Name = stData.Name + i;
        }
    }
    public static void checkCallByValue(Integer intI){
        intI = 50;
        System.debug('Check Int...' + intI);
    }
}