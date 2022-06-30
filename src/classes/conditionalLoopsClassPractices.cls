/**
*  Description     :  Collection Practices
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  06/25/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				    . 
*
**/
public with sharing class conditionalLoopsClassPractices {
    /**
     * 
     *   @description    :   Conditional(IF-else Statment)
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    public static void conditionalStatent(){
        //if else
        Integer x, sign;
        if (x <= 0) {
            if (x == 0) {
                sign = 0; 
            } else  {
                sign = -1;
            }
        }

        //else if 
        Integer place;
        String medalColor;
        if (place == 1) {
            medalColor = 'gold';
        } else if (place == 2) {
            medalColor = 'silver';
        } else if (place == 3) {
            medalColor = 'bronze';
        } else {
            medalColor = null;
        }


    
        //if else....else if (Example)
        String customerName = 'Mark';
        Decimal discountRate = 0;
        Boolean premiumSupport = false;
        if (customerName == 'mark'){
            discountRate = 0.1;
            premiumSupport = true;
            System.debug('Special Discount is given as customer is premium');
        }
        else if(customerName == 'Steve'){
            discountRate = 0.5;
            premiumSupport = false;
            System.debug('Special Discount is not given as customer is not premium');

        }
        else{
            discountRate = 0.05;
            premiumSupport = false;
            System.debug('Special Discount is not given as customer is not premium');
        }
    }

    /**
     * 
     *   @description    :   While Loop
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi Kumari
     * 
     **/

    public static void whileLoops(){
        Integer intI =1;
        while (intI<=10) {
            
            System.debug('print While Loop');
            intI++;
        }
    }

    public static void whileLoopWithList(){
        List<Integer> intList = new List<Integer>{1,2,3,4,5};
            system.debug('length of list' + intList.size());
        Integer i = 0;
        while(i < intList.size()){
            System.debug(intList[i]);
            i++;
            if(i ==2){
                system.debug('second element');
            }
        }

    }


    public static void whileLoopWithStudentsList(){
        List<Student__c> studentsRecords = [SELECT Name, id FROM Student__c Limit 5 ];
        Integer intL = 0;
        while (intL<5) {
            System.debug(studentsRecords[intL].Name);
            intL++;
            
        }
    }
/**
     * 
     *   @description    :   Loop Practices
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    //Do-While Loops
    public static void doWhile(){
        Integer inti = 0;
        do {
            System.debug(inti);
            inti++;
        } while (inti <= 10);  

    }

    public static void doWhileWithList(){
        List<Integer> intList = new List<Integer>{1,2,3,4,5};
        Integer intL = 0;
        do{
            System.debug(intList[intL]);
            intL++;
            if(intL == 3){
                System.debug('third element');
            }
        }while(intL <= 5);


    }



    public static void dowhileWithStudentList(){
        List<Student__c> studentsList = [SELECT Name, id FROM Student__c Limit 5];
        Integer i = 0;
        system.debug(studentsList);
        do{
            
            System.debug(studentsList[i].Name);
            i++;
        }while (i < 5);

    }

    /**
     * 
     *   @description    :   for Loop Practices
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/29/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    public static void forLoop(){
        for(Integer i=1; i<=5; i++){
            System.debug(i);
            if(i == 2){
                System.debug('print second ement');
            }
        }
    }

    public static void forLoopWithList(){
        List<Integer> intList = new List<Integer>{1,2,3,4,5};
        for (Integer intdata : intList){
            System.debug(intdata);
            if( intdata == 1){
                System.debug('first element');
            }
        }
    }
    

    public static void forLoopWithStudentList(){
        for(Student__c studentsRecords : [SELECT Name, id FROM Student__c Limit 5]){
            System.debug('The students name ' + studentsRecords);
        }
        
    }


    public static void forLoopWithMap(){
        List<Contact> conList = [select Id,Name from Contact LIMIT 5];
        Map<Id,Contact> mapOfContacts = new Map<Id,Contact>();
        System.debug('');
        for(Contact con : conList){
            mapOfContacts.put(con.Id,con); 
        }
        system.debug('Map of Contact ' + mapOfContacts);
    }


}