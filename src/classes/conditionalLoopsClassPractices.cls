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
        String medal_color;
        if (place == 1) {
            medal_color = 'gold';
        } else if (place == 2) {
            medal_color = 'silver';
        } else if (place == 3) {
            medal_color = 'bronze';
        } else {
            medal_color = null;
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
    public static void loopsPractices(){
        Integer count = 1;
        do {
            System.debug(count);
            count++;
        } while (count < 11);

        //While Loop
        Integer intData = 1;
        
        while (intData < 11) {
            System.debug(intData);
            count++;
        }

        
        //For loop
        for (Integer i = 0, j = 0; i < 10; i++) {
            System.debug(i+1);
        }

        //List or Set Iteration for Loops

        Integer[] myInts = new Integer[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        for (Integer i : myInts) {
            System.debug(i);
        }


    }


     /**
     * 
     *   @description    :  Constructors
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi Kumari
     * 
     **/

    //Using Constructors
    public class TestObject2 {

        private final Integer DEFAULT_SIZE = 10;
        
        Integer size;
        
           //Constructor with no arguments
           public TestObject2() {
               this(); // Using this(...DEFAULT_SIZE) calls the one argument constructor    
           }
           // Constructor with one argument 
           public TestObject2(Integer ObjectSize) {
             size = ObjectSize;  
           }
           TestObject2 myObject1 = new TestObject2(42);
            TestObject2 myObject2 = new TestObject2();
        }



         /**
     * 
     *   @description    :  Call by value and call by reference 
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/27/2022 - Developer Name - Nidhi Kumari
     * 
     **/
       

        Student__c s1 = new Student__c();
        Integer intI = 10;
        public void ExampleC (){
            manipulateReferenes(s1);
            System.debug('Check Student Name...' + s1.Name);
            checkCallByValue(intI);
            System.debug('Check Int....' + intI);
        }
        public void manipulateReferenes(Student__c stData){
            for(Integer i=0; i<10; i++){
                stData.Name = stData.Name + i;
            }
        }
        public void checkCallByValue(Integer intI){
            intI = 50;
            System.debug('Check Int...' + intI);
        }
    

}