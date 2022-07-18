/**
*  Description     :  Creating Parent, Child and grand child records 
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  07/11/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				    . 
*
**/
public with sharing class ChildParentExample {

    /**
     * 
     *   @description    : Creating Parent, Child and grand child records 
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/11/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    public static void insertRcordParentChild(){
        try{

        HOD__c hodName = new HOD__c( Name='HOD Rajeev');
        insert hodName;

        ID hodID = hodName.ID;

        Teacher__c teacherName = new Teacher__c(Name = 'Rajat', HOD__c=hodID,College__c = 'a065i000002xY5mAAE');
        insert teacherName;

        ID teacherID = teacherName.ID;

        Student__c studentName = new Student__c(Name='Mrinal',Teacher__c=teacherId);
        insert studentName;
        }catch(DmlException e){
             System.debug('Exeception' + e);
            
        }

        try{
            Student__c studentQuery = [SELECT Teacher__r.HOD__c,Name FROM Student__c WHERE Name = 'Smith' LIMIT 1];
            System.debug(studentQuery);
            
            HOD__c hodUpdate = new HOD__c(Id=studentQuery.Teacher__r.HOD__c,Name = 'New Hod');
            update hodUpdate;
            
        }catch(DmlException e){
            System.debug('Exeception' + e);
        }

    }

}