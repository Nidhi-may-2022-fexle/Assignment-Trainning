/**
*  Description     :  updating s object 
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  07/05/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				    . 
*
**/
public class ApexSobject {
    /**
     * 
     *   @description    :  insert student details in student object  
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/07/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    public static void apexSobject(){
        Student__c student = new Student__c();
        student.Name = 'Nidhi';
        student.Mobile_Number__c = '55846757585';
        student.City__c = 'meerut';
        system.debug(student);
        insert student;
        update student;
            
    }
}